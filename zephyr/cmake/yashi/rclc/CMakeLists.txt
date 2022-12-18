zephyr_interface_library_named(ros2_rclc)
target_include_directories(ros2_rclc INTERFACE ${SUBMODULE_SRC_DIR}/rclc/include)
target_link_libraries(ros2_rclc INTERFACE ros2_rcutils ros2_rcl_interfaces ros2_rcl)


zephyr_library()
zephyr_library_link_libraries(ros2_rclc)
zephyr_library_link_libraries_ifdef(CONFIG_POSIX_API posix_subsys)

zephyr_library_sources(
  ${SUBMODULE_SRC_DIR}/rclc/src/rclc/init.c
  ${SUBMODULE_SRC_DIR}/rclc/src/rclc/publisher.c
  ${SUBMODULE_SRC_DIR}/rclc/src/rclc/subscription.c
  ${SUBMODULE_SRC_DIR}/rclc/src/rclc/client.c
  ${SUBMODULE_SRC_DIR}/rclc/src/rclc/service.c
  ${SUBMODULE_SRC_DIR}/rclc/src/rclc/timer.c
  ${SUBMODULE_SRC_DIR}/rclc/src/rclc/action_client.c
  ${SUBMODULE_SRC_DIR}/rclc/src/rclc/action_server.c
  ${SUBMODULE_SRC_DIR}/rclc/src/rclc/action_goal_handle.c
  ${SUBMODULE_SRC_DIR}/rclc/src/rclc/node.c
  ${SUBMODULE_SRC_DIR}/rclc/src/rclc/executor_handle.c
  ${SUBMODULE_SRC_DIR}/rclc/src/rclc/executor.c
  ${SUBMODULE_SRC_DIR}/rclc/src/rclc/sleep_zephyr.c
)

zephyr_library_compile_definitions(_DEFAULT_SOURCE)
