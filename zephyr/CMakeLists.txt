if(CONFIG_MICROROS_META)
  set(CMAKE_C_STANDARD 11)

  # pull in helper functions
  include(cmake/add_submodule.cmake)
  include(cmake/rosidl_gen_files.cmake)

  add_submodule(yashi/rcutils)
  add_submodule(ros2/rmw)
  add_submodule(eProsima/Micro-CDR)
  add_submodule(eProsima/Micro-XRCE-DDS-Client)
  add_submodule(ros2/rosidl)
  add_submodule(micro-ROS/rosidl_typesupport_microxrcedds)
  add_submodule(micro-ROS/rosidl_typesupport)
  add_submodule(micro-ROS/rmw_microxrcedds)
  add_submodule(ros2/unique_identifier_msgs)
  add_submodule(ros2/rcl_interfaces)
  add_submodule(ros2/common_interfaces)
  add_submodule(ros2/ros2_tracing)
  add_submodule(micro-ROS/rcl)
  add_submodule(yashi/rclc)

  # Bring all submodule interfaces together in one interface library target
  # so we can easily add a dependency to the 'app' target using the zephyr
  # convention of setting the APP_LINK_WITH_<module name> kconfig option

  zephyr_interface_library_named(microros_meta)
  target_link_libraries(microros_meta INTERFACE ros2_rcl ros2_rclc ros2_common_interfaces eprosima_micro_xrce_dds_client)

endif() # if(CONFIG_MICROROS_META)
