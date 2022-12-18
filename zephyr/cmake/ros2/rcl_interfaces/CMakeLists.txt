include(builtin_interfaces.cmake)
include(action_msgs.cmake)

zephyr_interface_library_named(ros2_rcl_interfaces)
target_include_directories(ros2_rcl_interfaces INTERFACE ${SUBMODULE_BIN_DIR}/include)
target_link_libraries(ros2_rcl_interfaces INTERFACE ros2_rosidl ros2_unique_identifier_msgs)


zephyr_library()
zephyr_library_link_libraries(ros2_rcl_interfaces)

zephyr_library_sources(
  ${builtin_interfaces_generated_files}
  ${action_msgs_generated_files}
)
