zephyr_interface_library_named(ros2_rosidl_typesupport_microxrcedds)
target_include_directories(ros2_rosidl_typesupport_microxrcedds INTERFACE
  ${SUBMODULE_SRC_DIR}/rosidl_typesupport_microxrcedds_c/include
)
target_link_libraries(ros2_rosidl_typesupport_microxrcedds INTERFACE
  ros2_rosidl
  ros2_rcutils
  eprosima_micro_cdr
)


zephyr_library()
zephyr_library_link_libraries(ros2_rosidl_typesupport_microxrcedds)
zephyr_library_sources(
  ${SUBMODULE_SRC_DIR}/rosidl_typesupport_microxrcedds_c/src/identifier.c
)
