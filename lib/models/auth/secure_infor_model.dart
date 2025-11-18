class SecureInfoModel {
  bool? enable2FA;
  bool? isForce2FA;

  SecureInfoModel({this.enable2FA, this.isForce2FA});

  SecureInfoModel.fromJson(Map<String, dynamic> json) {
    enable2FA = json['Enable2FA'];
    isForce2FA = json['IsForce2FA'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Enable2FA'] = enable2FA;
    data['IsForce2FA'] = isForce2FA;
    return data;
  }
}
