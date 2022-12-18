set(non_idl_tuples
	"${SUBMODULE_SRC_DIR}:msg/UUID.msg"
)
set(output_files
	${SUBMODULE_BIN_DIR}/include/unique_identifier_msgs/msg/uuid.h
)

rosidl_gen_files(
  TARGET unique_identifier_msgs
  NON_IDL_TUPLES ${non_idl_tuples}
  OUTPUT_FILES ${output_files}
)

zephyr_interface_library_named(ros2_unique_identifier_msgs)
target_include_directories(ros2_unique_identifier_msgs INTERFACE ${SUBMODULE_BIN_DIR}/include)
target_link_libraries(ros2_unique_identifier_msgs INTERFACE ros2_rosidl_typesupport)


zephyr_library()
zephyr_library_link_libraries(ros2_unique_identifier_msgs)

zephyr_library_sources(
  ${unique_identifier_msgs_generated_files}
)
