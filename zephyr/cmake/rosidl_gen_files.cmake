# set vars for locations of important IDL repos used by msg code generators
set(rosidl_dir ${ZEPHYR_CURRENT_MODULE_DIR}/submodules/ros2/rosidl)
set(rosidl_typesupport_dir ${ZEPHYR_CURRENT_MODULE_DIR}/submodules/micro-ROS/rosidl_typesupport)
set(rosidl_typesupport_microxrcedds_dir ${ZEPHYR_CURRENT_MODULE_DIR}/submodules/micro-ROS/rosidl_typesupport_microxrcedds)


# set vars required by the various IDL msg code generators
set(rosidl_generator_c ${rosidl_dir}/rosidl_generator_c/bin/rosidl_generator_c)
set(rosidl_generator_c_template_dir ${rosidl_dir}/rosidl_generator_c/resource) 

set(rosidl_typesupport_c ${rosidl_typesupport_dir}/rosidl_typesupport_c/bin/rosidl_typesupport_c)
set(rosidl_typesupport_c_template_dir ${rosidl_typesupport_dir}/rosidl_typesupport_c/resource)

set(rosidl_typesupport_microxrcedds_c ${rosidl_typesupport_microxrcedds_dir}/rosidl_typesupport_microxrcedds_c/main/rosidl_typesupport_microxrcedds_c)
set(rosidl_typesupport_microxrcedds_c_template_dir ${rosidl_typesupport_microxrcedds_dir}/rosidl_typesupport_microxrcedds_c/resource)

# extend PYTHONPATH to include python code for the various IDL msg code generators
set(PYTHONPATH_LIST
  ${rosidl_dir}/rosidl_adapter
  ${rosidl_dir}/rosidl_cmake
  ${rosidl_dir}/rosidl_generator_c
  ${rosidl_dir}/rosidl_parser
  ${rosidl_typesupport_dir}/rosidl_typesupport_c
  ${rosidl_typesupport_microxrcedds_dir}/rosidl_typesupport_microxrcedds_c
)
list(JOIN PYTHONPATH_LIST ":" PYTHONPATH)

if(DEFINED ENV{PYTHONPATH})
  set(ENV{PYTHONPATH} "$ENV{PYTHONPATH}:${PYTHONPATH}")
else()
  set(ENV{PYTHONPATH} "${PYTHONPATH}")
endif()


include(${rosidl_dir}/rosidl_cmake/cmake/rosidl_write_generator_arguments.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/rosidl_adapt_interfaces.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/msg_to_idl.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/idl_to_files.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/idl_to_typesupport.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/idl_to_typesupport_microxrcedds.cmake)


function(rosidl_gen_files)
  set(single_args "TARGET")
  set(multi_args "NON_IDL_TUPLES;OUTPUT_FILES")
  cmake_parse_arguments(GENFILES "" "${single_args}" "${multi_args}" ${ARGN})

  if(NOT DEFINED GENFILES_TARGET)
    message(FATAL_ERROR "${CMAKE_CURRENT_FUNCTION}(${ARGV0}) requires TARGET")
  endif()
  if(NOT DEFINED GENFILES_NON_IDL_TUPLES)
    message(FATAL_ERROR "${CMAKE_CURRENT_FUNCTION}(${ARGV0}) requires NON_IDL_TUPLES")
  endif()
  if(NOT DEFINED GENFILES_OUTPUT_FILES)
    message(FATAL_ERROR "${CMAKE_CURRENT_FUNCTION}(${ARGV0}) requires OUTPUT_FILES")
  endif()

  msg_to_idl(
    idl_tuples
    TARGET ${GENFILES_TARGET}
    NON_IDL_TUPLES ${GENFILES_NON_IDL_TUPLES}
  )

  idl_to_files(
    TARGET ${GENFILES_TARGET}
    IDL_TUPLES ${idl_tuples}
    OUTPUT_FILES ${GENFILES_OUTPUT_FILES}
  )

  idl_to_typesupport(
    TARGET ${GENFILES_TARGET}
    IDL_TUPLES ${idl_tuples}
  )

  idl_to_typesupport_microxrcedds(
    TARGET ${GENFILES_TARGET}
    IDL_TUPLES ${idl_tuples}
  )

  file(GLOB generated_files
    ${CMAKE_CURRENT_BINARY_DIR}/include/${GENFILES_TARGET}/msg/*.cpp
    ${CMAKE_CURRENT_BINARY_DIR}/include/${GENFILES_TARGET}/msg/detail/*.c
    ${CMAKE_CURRENT_BINARY_DIR}/include/${GENFILES_TARGET}/msg/detail/microxrcedds/*.c
  )

  set(${GENFILES_TARGET}_generated_files ${generated_files} PARENT_SCOPE)

endfunction() # rosidl_gen_files

