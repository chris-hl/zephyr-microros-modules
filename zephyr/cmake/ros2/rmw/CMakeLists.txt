zephyr_interface_library_named(ros2_rmw)
target_include_directories(ros2_rmw INTERFACE ${SUBMODULE_SRC_DIR}/rmw/include)
target_link_libraries(ros2_rmw INTERFACE ros2_rcutils)


zephyr_library()
zephyr_library_link_libraries(ros2_rmw)

zephyr_library_sources(
  ${SUBMODULE_SRC_DIR}/rmw/src/allocators.c
  ${SUBMODULE_SRC_DIR}/rmw/src/convert_rcutils_ret_to_rmw_ret.c
  ${SUBMODULE_SRC_DIR}/rmw/src/event.c
  ${SUBMODULE_SRC_DIR}/rmw/src/init.c
  ${SUBMODULE_SRC_DIR}/rmw/src/init_options.c
  ${SUBMODULE_SRC_DIR}/rmw/src/message_sequence.c
  ${SUBMODULE_SRC_DIR}/rmw/src/names_and_types.c
  ${SUBMODULE_SRC_DIR}/rmw/src/network_flow_endpoint_array.c
  ${SUBMODULE_SRC_DIR}/rmw/src/network_flow_endpoint.c
  ${SUBMODULE_SRC_DIR}/rmw/src/publisher_options.c
  ${SUBMODULE_SRC_DIR}/rmw/src/qos_string_conversions.c
  ${SUBMODULE_SRC_DIR}/rmw/src/sanity_checks.c
  ${SUBMODULE_SRC_DIR}/rmw/src/security_options.c
  ${SUBMODULE_SRC_DIR}/rmw/src/subscription_content_filter_options.c
  ${SUBMODULE_SRC_DIR}/rmw/src/subscription_options.c
  ${SUBMODULE_SRC_DIR}/rmw/src/time.c
  ${SUBMODULE_SRC_DIR}/rmw/src/topic_endpoint_info_array.c
  ${SUBMODULE_SRC_DIR}/rmw/src/topic_endpoint_info.c
  ${SUBMODULE_SRC_DIR}/rmw/src/types.c
  ${SUBMODULE_SRC_DIR}/rmw/src/validate_full_topic_name.c
  ${SUBMODULE_SRC_DIR}/rmw/src/validate_namespace.c
  ${SUBMODULE_SRC_DIR}/rmw/src/validate_node_name.c
)
