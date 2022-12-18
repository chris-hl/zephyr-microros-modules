option(RCUTILS_NO_THREAD_SUPPORT "Disable thread support." ON)
option(RCUTILS_NO_FILESYSTEM "Disable filesystem usage." ON)
option(RCUTILS_AVOID_DYNAMIC_ALLOCATION "Disable dynamic allocations." OFF)
option(RCUTILS_MICROROS "Flag for building micro-ROS." ON)

set(GENERATED_INCLUDE_DIR ${SUBMODULE_BIN_DIR}/include/rcutils)

configure_file(
  ${SUBMODULE_SRC_DIR}/include/rcutils/configuration_flags.h.in
  ${GENERATED_INCLUDE_DIR}/configuration_flags.h
)

set(LOGGING_MACROS_H_EM ${SUBMODULE_SRC_DIR}/resource/logging_macros.h.em)
set(LOGGING_MACROS_H ${GENERATED_INCLUDE_DIR}/logging_macros.h)
set(RCUTILS_MODULE_PATH rcutils_module_path="${SUBMODULE_SRC_DIR}")
set(EMPY ${SUBMODULE_SRC_DIR}/scripts/empy)

add_custom_command(OUTPUT ${LOGGING_MACROS_H}
  COMMAND ${CMAKE_COMMAND} -E make_directory ${GENERATED_INCLUDE_DIR}
  COMMAND ${PYTHON_EXECUTABLE} ${EMPY}
  -o ${LOGGING_MACROS_H}
  -D ${RCUTILS_MODULE_PATH}
  ${LOGGING_MACROS_H_EM}
  DEPENDS
    ${LOGGING_MACROS_H_EM}
  COMMENT "Expanding logging_macros.h.em"
  VERBATIM
)

zephyr_interface_library_named(ros2_rcutils)
target_include_directories(
  ros2_rcutils
  INTERFACE
  ${SUBMODULE_SRC_DIR}/include
  ${SUBMODULE_BIN_DIR}/include
)
target_sources(ros2_rcutils INTERFACE ${LOGGING_MACROS_H})


zephyr_library()
zephyr_library_link_libraries(ros2_rcutils)
zephyr_library_link_libraries_ifdef(CONFIG_POSIX_API posix_subsys)

zephyr_library_sources(
  ${SUBMODULE_SRC_DIR}/src/allocator.c
  ${SUBMODULE_SRC_DIR}/src/array_list.c
  ${SUBMODULE_SRC_DIR}/src/char_array.c
  ${SUBMODULE_SRC_DIR}/src/cmdline_parser.c
  ${SUBMODULE_SRC_DIR}/src/env_zephyr.c
  ${SUBMODULE_SRC_DIR}/src/error_handling.c
  ${SUBMODULE_SRC_DIR}/src/filesystem.c
  ${SUBMODULE_SRC_DIR}/src/find.c
  ${SUBMODULE_SRC_DIR}/src/format_string.c
  ${SUBMODULE_SRC_DIR}/src/hash_map.c
  #${SUBMODULE_SRC_DIR}/src/logging.c
  #${SUBMODULE_SRC_DIR}/src/process.c
  ${SUBMODULE_SRC_DIR}/src/qsort.c
  ${SUBMODULE_SRC_DIR}/src/repl_str.c
  ${SUBMODULE_SRC_DIR}/src/shared_library.c
  ${SUBMODULE_SRC_DIR}/src/snprintf.c
  ${SUBMODULE_SRC_DIR}/src/split.c
  ${SUBMODULE_SRC_DIR}/src/strcasecmp.c
  ${SUBMODULE_SRC_DIR}/src/strdup.c
  ${SUBMODULE_SRC_DIR}/src/strerror.c
  ${SUBMODULE_SRC_DIR}/src/string_array.c
  ${SUBMODULE_SRC_DIR}/src/string_map.c
  ${SUBMODULE_SRC_DIR}/src/testing/fault_injection.c
  ${SUBMODULE_SRC_DIR}/src/time.c
  ${SUBMODULE_SRC_DIR}/src/time_zephyr.c
  ${SUBMODULE_SRC_DIR}/src/uint8_array.c
  ${SUBMODULE_SRC_DIR}/src/atomic_64bits.c
  #${LOGGING_MACROS_H}
)

zephyr_library_compile_definitions(_DEFAULT_SOURCE)
