set(TARGET builtin_interfaces)
set(non_idl_tuples
  "${SUBMODULE_SRC_DIR}/${TARGET}:msg/Duration.msg"
  "${SUBMODULE_SRC_DIR}/${TARGET}:msg/Time.msg"
)
set(output_files
  ${SUBMODULE_BIN_DIR}/include/${TARGET}/msg/duration.h
  ${SUBMODULE_BIN_DIR}/include/${TARGET}/msg/time.h
)

rosidl_gen_files(
  TARGET ${TARGET}
  NON_IDL_TUPLES ${non_idl_tuples}
  OUTPUT_FILES ${output_files}
)

