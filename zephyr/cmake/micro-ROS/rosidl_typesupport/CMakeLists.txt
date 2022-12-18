zephyr_interface_library_named(ros2_rosidl_typesupport)
target_include_directories(ros2_rosidl_typesupport INTERFACE
  ${SUBMODULE_SRC_DIR}/rosidl_typesupport_c/include
)

# We add ros2_rosidl_typesupport_microxrcedds as a convenience
# so that other targets only have to add ros2_ros_idl_typesupport as
# a dependency
target_link_libraries(ros2_rosidl_typesupport INTERFACE
  ros2_rosidl
  ros2_rcutils
  ros2_rosidl_typesupport_microxrcedds  # convenience
)


zephyr_library()
zephyr_library_link_libraries(ros2_rosidl_typesupport)
zephyr_library_sources(
  ${SUBMODULE_SRC_DIR}/rosidl_typesupport_c/src/identifier.c
  ${SUBMODULE_SRC_DIR}/rosidl_typesupport_c/src/message_type_support_dispatch.cpp
  ${SUBMODULE_SRC_DIR}/rosidl_typesupport_c/src/service_type_support_dispatch.cpp
)

zephyr_library_compile_definitions(ROSIDL_TYPESUPPORT_STATIC_TYPESUPPORT)
