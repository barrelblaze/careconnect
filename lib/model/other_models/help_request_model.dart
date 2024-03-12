class HelpRequestModel {
  String? helpreqId;
  String orphanId;
  String reqType;
  String data;
  String reqStatus;
  String image;
  String name;
  String dataAndDay;
  String time;
  HelpRequestModel(
      {required this.data,
      this.helpreqId,
      required this.dataAndDay,
      required this.time,
      required this.image
     ,required this.name,
      required this.orphanId,
      required this.reqStatus,
      required this.reqType});
  Map<String, dynamic> toJson(id) => {
        "helpreqId": id,
        "orphanId": orphanId,
        "reqType": reqType,
        "data": data,
        "reqStatus": reqStatus,
        "name":name,
        "image":image,
        "dataAndDay":dataAndDay,
        "time":time,

      };

  factory HelpRequestModel.fromJson(Map<String, dynamic> json) =>
      HelpRequestModel(
        time:json["time"],
        dataAndDay: json["dataAndDay"],
        image: json["image"],
        name: json["name"],
          data: json["data"],
          helpreqId: json["helpreqId"],
          orphanId: json["orphanId"],
          reqStatus: json["reqStatus"],
          reqType: json["reqType"]);
}
