String toExtendedGroupName(String groupName) {
  var entities = groupName.split('e');
  return "Elective ${entities[1]}";
}
