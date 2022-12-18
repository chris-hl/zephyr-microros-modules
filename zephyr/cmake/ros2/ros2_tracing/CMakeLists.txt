option(TRACETOOLS_DISABLED "Explicitly disable support for tracing" ON)

configure_file(
  ${SUBMODULE_SRC_DIR}/tracetools/include/tracetools/config.h.in
  ${SUBMODULE_BIN_DIR}/tracetools/include/tracetools/config.h
)

zephyr_interface_library_named(ros2_tracetools)
target_include_directories(ros2_tracetools INTERFACE
  ${SUBMODULE_SRC_DIR}/tracetools/include
  ${SUBMODULE_BIN_DIR}/tracetools/include
)


zephyr_library()
zephyr_library_link_libraries(ros2_tracetools)

zephyr_library_sources(
  ${SUBMODULE_SRC_DIR}/tracetools/src/tracetools.c
)
