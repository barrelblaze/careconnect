class ChildHealthReportModel {
  String medicalStatus;
  String diseases;
  String disabilities;
  String heght;
  String weight;
  String medicines;
  dynamic childid;
  ChildHealthReportModel(
      {this.childid,
      required this.disabilities,
      required this.diseases,
      required this.heght,
      required this.medicalStatus,
      required this.medicines,
      required this.weight});

  Map<String, dynamic> toJson(id) => {
        "childId": id,
        "disabilities": disabilities,
        "diseases": diseases,
        "heght": heght,
        "medicalStatus": medicalStatus,
        "medicines": medicines,
        "weight": weight
      };
  factory ChildHealthReportModel.fromJson(Map<String, dynamic> json) =>

      ChildHealthReportModel(
        disabilities: json["disabilities"],
        diseases: json["diseases"],
        heght: json["heght"],
        medicalStatus: json["medicalStatus"],
        medicines: json["medicines"],
        weight: json["weight"],
        childid: json["childId"],
      );
}
