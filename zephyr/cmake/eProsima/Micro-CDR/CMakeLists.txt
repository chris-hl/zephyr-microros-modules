# generate config.h in a function to restrict scope of modified variables

# temporarily set them
set(PROJECT_VERSION_MAJOR 2)
set(PROJECT_VERSION_MINOR 0)
set(PROJECT_VERSION_PATCH 0)
set(PROJECT_VERSION 2.0.0)
if (CONFIG_BIG_ENDIAN)
  set(CONFIG_MACHINE_ENDIANNESS UCDR_BIG_ENDIANNESS)
else()
  set(CONFIG_MACHINE_ENDIANNESS UCDR_LITTLE_ENDIANNESS)
endif()

configure_file(
  ${SUBMODULE_SRC_DIR}/include/ucdr/config.h.in
  ${SUBMODULE_BIN_DIR}/include/ucdr/config.h
)


zephyr_interface_library_named(eprosima_micro_cdr)
target_include_directories(
  eprosima_micro_cdr
  INTERFACE
  ${SUBMODULE_SRC_DIR}/include
  ${SUBMODULE_BIN_DIR}/include
)


zephyr_library()
zephyr_library_link_libraries(eprosima_micro_cdr)
zephyr_library_sources(
  ${SUBMODULE_SRC_DIR}/src/c/common.c
  ${SUBMODULE_SRC_DIR}/src/c/types/basic.c
  ${SUBMODULE_SRC_DIR}/src/c/types/string.c
  ${SUBMODULE_SRC_DIR}/src/c/types/array.c
  ${SUBMODULE_SRC_DIR}/src/c/types/sequence.c
)

