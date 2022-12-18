include(std_msgs.cmake)

zephyr_interface_library_named(ros2_common_interfaces)
target_include_directories(ros2_common_interfaces INTERFACE ${SUBMODULE_BIN_DIR}/include)
target_link_libraries(ros2_common_interfaces INTERFACE ros2_rosidl_typesupport ros2_rcl_interfaces)


zephyr_library()
zephyr_library_link_libraries(ros2_common_interfaces)

zephyr_library_sources(
  ${std_msgs_generated_files}
)
