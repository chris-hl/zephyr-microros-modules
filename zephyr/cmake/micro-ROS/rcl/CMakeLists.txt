# FIXME: Move these options to Kconfig
option(RCL_COMMAND_LINE_ENABLED "Enable/disable the rcl_yaml_param_parser tool" OFF)
option(RCL_LOGGING_ENABLED "Enable/disable logging" OFF)

zephyr_interface_library_named(ros2_rcl)
target_include_directories(ros2_rcl INTERFACE
  ${SUBMODULE_SRC_DIR}/rcl/include
  ${SUBMODULE_SRC_DIR}/rcl_action/include
)
target_link_libraries(ros2_rcl INTERFACE ros2_rcl_interfaces ros2_rmw ros2_tracetools)


zephyr_library()
zephyr_library_link_libraries(ros2_rcl)

zephyr_library_sources(
  ${SUBMODULE_SRC_DIR}/rcl/src/rcl/client.c
  ${SUBMODULE_SRC_DIR}/rcl/src/rcl/common.c
  ${SUBMODULE_SRC_DIR}/rcl/src/rcl/context.c
  ${SUBMODULE_SRC_DIR}/rcl/src/rcl/domain_id.c
  ${SUBMODULE_SRC_DIR}/rcl/src/rcl/event.c
  ${SUBMODULE_SRC_DIR}/rcl/src/rcl/expand_topic_name.c
  ${SUBMODULE_SRC_DIR}/rcl/src/rcl/graph.c
  ${SUBMODULE_SRC_DIR}/rcl/src/rcl/guard_condition.c
  ${SUBMODULE_SRC_DIR}/rcl/src/rcl/init.c
  ${SUBMODULE_SRC_DIR}/rcl/src/rcl/init_options.c
  ${SUBMODULE_SRC_DIR}/rcl/src/rcl/lexer.c
  ${SUBMODULE_SRC_DIR}/rcl/src/rcl/lexer_lookahead.c
  ${SUBMODULE_SRC_DIR}/rcl/src/rcl/localhost.c
  ${SUBMODULE_SRC_DIR}/rcl/src/rcl/network_flow_endpoints.c
  ${SUBMODULE_SRC_DIR}/rcl/src/rcl/node.c
  ${SUBMODULE_SRC_DIR}/rcl/src/rcl/node_options.c
  ${SUBMODULE_SRC_DIR}/rcl/src/rcl/publisher.c
  ${SUBMODULE_SRC_DIR}/rcl/src/rcl/remap.c
  ${SUBMODULE_SRC_DIR}/rcl/src/rcl/node_resolve_name.c
  ${SUBMODULE_SRC_DIR}/rcl/src/rcl/rmw_implementation_identifier_check.c
  ${SUBMODULE_SRC_DIR}/rcl/src/rcl/security.c
  ${SUBMODULE_SRC_DIR}/rcl/src/rcl/service.c
  ${SUBMODULE_SRC_DIR}/rcl/src/rcl/subscription.c
  ${SUBMODULE_SRC_DIR}/rcl/src/rcl/time.c
  ${SUBMODULE_SRC_DIR}/rcl/src/rcl/timer.c
  ${SUBMODULE_SRC_DIR}/rcl/src/rcl/validate_enclave_name.c
  ${SUBMODULE_SRC_DIR}/rcl/src/rcl/validate_topic_name.c
  ${SUBMODULE_SRC_DIR}/rcl/src/rcl/wait.c

  ${SUBMODULE_SRC_DIR}/rcl_action/src/rcl_action/action_client.c
  ${SUBMODULE_SRC_DIR}/rcl_action/src/rcl_action/action_server.c
  ${SUBMODULE_SRC_DIR}/rcl_action/src/rcl_action/goal_handle.c
  ${SUBMODULE_SRC_DIR}/rcl_action/src/rcl_action/goal_state_machine.c
  ${SUBMODULE_SRC_DIR}/rcl_action/src/rcl_action/graph.c
  ${SUBMODULE_SRC_DIR}/rcl_action/src/rcl_action/names.c
  ${SUBMODULE_SRC_DIR}/rcl_action/src/rcl_action/types.c
)

zephyr_library_sources_ifdef(${RCL_COMMAND_LINE_ENABLED}
  ${SUBMODULE_SRC_DIR}/rcl/src/rcl/arguments.c
)

zephyr_library_sources_ifdef(${RCL_LOGGING_ENABLED}
  ${SUBMODULE_SRC_DIR}/rcl/src/rcl/logging_rosout.c
  ${SUBMODULE_SRC_DIR}/rcl/src/rcl/logging.c
  ${SUBMODULE_SRC_DIR}/rcl/src/rcl/log_level.c
)
