set(TARGET action_msgs)
set(non_idl_tuples
  "${SUBMODULE_SRC_DIR}/${TARGET}:msg/GoalInfo.msg"
  "${SUBMODULE_SRC_DIR}/${TARGET}:msg/GoalStatus.msg"
  "${SUBMODULE_SRC_DIR}/${TARGET}:msg/GoalStatusArray.msg"
  "${SUBMODULE_SRC_DIR}/${TARGET}:srv/CancelGoal.srv"
)
set(output_files
  ${SUBMODULE_BIN_DIR}/include/${TARGET}/msg/goal_info.h
)

rosidl_gen_files(
  TARGET ${TARGET}
  NON_IDL_TUPLES ${non_idl_tuples}
  OUTPUT_FILES ${output_files}
)
