
class RoleAppModel {
  String? appCode;
  String? roleCode;
  String? roleName;

  RoleAppModel({this.appCode, this.roleCode, this.roleName});

  RoleAppModel.fromJson(Map<String, dynamic> json) {
    appCode = json['app_code'];
    roleCode = json['role_code'];
    roleName = json['role_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['app_code'] = appCode;
    data['role_code'] = roleCode;
    data['role_name'] = roleName;
    return data;
  }
}