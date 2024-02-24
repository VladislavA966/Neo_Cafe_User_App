class BranchEntity {
  final int id;
  final List<SchedulesEntity> schedules;
  final String branchName;
  final String adress;
  final String phoneNumber;
  final String image;
  final String description;
  final String link2gis;
  final int tableQuantity;

  BranchEntity(
      {required this.id,
      required this.schedules,
      required this.branchName,
      required this.adress,
      required this.phoneNumber,
      required this.image,
      required this.description,
      required this.link2gis,
      required this.tableQuantity});
}

class SchedulesEntity {
  final String day;
  final String startTime;
  final String endTime;

  SchedulesEntity(
      {required this.day, required this.startTime, required this.endTime});
}
