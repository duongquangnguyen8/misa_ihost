class LoginRequest {
  String? deviceId;
  String? password;
  String? userName;

  LoginRequest({this.deviceId, this.password, this.userName});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    deviceId = json['DeviceId'];
    password = json['Password'];
    userName = json['UserName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['DeviceId'] = deviceId;
    data['Password'] = password;
    data['UserName'] = userName;
    return data;
  }
}