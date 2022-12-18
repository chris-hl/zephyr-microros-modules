zephyr_interface_library_named(ros2_rosidl)
target_include_directories(ros2_rosidl INTERFACE
  ${SUBMODULE_SRC_DIR}/rosidl_runtime_c/include
  ${SUBMODULE_SRC_DIR}/rosidl_typesupport_interface/include
)
target_link_libraries(ros2_rosidl INTERFACE ros2_rcutils)


zephyr_library()
zephyr_library_link_libraries(ros2_rosidl)
zephyr_library_sources(
  ${SUBMODULE_SRC_DIR}/rosidl_runtime_c/src/message_type_support.c
  ${SUBMODULE_SRC_DIR}/rosidl_runtime_c/src/primitives_sequence_functions.c
  ${SUBMODULE_SRC_DIR}/rosidl_runtime_c/src/sequence_bound.c
  ${SUBMODULE_SRC_DIR}/rosidl_runtime_c/src/service_type_support.c
  ${SUBMODULE_SRC_DIR}/rosidl_runtime_c/src/string_functions.c
  ${SUBMODULE_SRC_DIR}/rosidl_runtime_c/src/u16string_functions.c
)
