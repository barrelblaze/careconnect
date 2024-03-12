class LoginTable {
  String email;
  // String password;
  String loginId;
  String type;
  LoginTable(
      {required this.email,
      // required this.password,
      required this.loginId,
      required this.type});
  Map<String, dynamic> toJson(uid) =>
      {"email": email,
      //  "password": password, 
       "loginId": uid, "type": type};

  factory LoginTable.fromJson(Map<String, dynamic> json) => LoginTable(
      email: "email",
      //  password: "password", 
       loginId: "loginId", type: "type");
}
