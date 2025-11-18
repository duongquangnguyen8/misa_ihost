
import 'package:misa_ihost/models/auth/amis_infor_model.dart';
import 'package:misa_ihost/models/auth/role_model.dart';

class ContextModel {
  String? userId;
  String? userName;
  String? tenantId;
  String? tenantName;
  String? sessionId;
  String? budgetCode;
  String? fullName;
  String? email;
  String? deviceId;
  String? avatar;
  List<RoleAppModel>? roleApps;
  bool? useQLCB;
  int? gender;
  AmisLoginInfoModel? amisLoginInfo;
  String? jobPositionName;
  String? departmentId;
  String? departmentName;
  bool? isCheckLicense;
  String? employeeId;
  bool? isEmployee;

  ContextModel(
      {this.userId,
      this.userName,
      this.tenantId,
      this.tenantName,
      this.sessionId,
      this.budgetCode,
      this.fullName,
      this.email,
      this.deviceId,
      this.avatar,
      this.roleApps,
      this.useQLCB,
      this.gender,
      this.amisLoginInfo,
      this.jobPositionName,
      this.departmentId,
      this.departmentName,
      this.isCheckLicense,
      this.employeeId,
      this.isEmployee});

  ContextModel.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    userName = json['UserName'];
    tenantId = json['TenantId'];
    tenantName = json['TenantName'];
    sessionId = json['SessionId'];
    budgetCode = json['BudgetCode'];
    fullName = json['FullName'];
    email = json['Email'];
    deviceId = json['DeviceId'];
    avatar = json['Avatar'];
    if (json['RoleApps'] != null) {
      roleApps = <RoleAppModel>[];
      json['RoleApps'].forEach((v) {
        roleApps!.add(RoleAppModel.fromJson(v));
      });
    }
    useQLCB = json['UseQLCB'];
    gender = json['Gender'];
    amisLoginInfo = json['AmisLoginInfo'] != null
        ? AmisLoginInfoModel.fromJson(json['AmisLoginInfo'])
        : null;
    jobPositionName = json['JobPositionName'];
    departmentId = json['DepartmentId'];
    departmentName = json['DepartmentName'];
    isCheckLicense = json['IsCheckLicense'];
    employeeId = json['EmployeeId'];
    isEmployee = json['IsEmployee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserId'] = userId;
    data['UserName'] = userName;
    data['TenantId'] = tenantId;
    data['TenantName'] = tenantName;
    data['SessionId'] = sessionId;
    data['BudgetCode'] = budgetCode;
    data['FullName'] = fullName;
    data['Email'] = email;
    data['DeviceId'] = deviceId;
    data['Avatar'] = avatar;
    if (roleApps != null) {
      data['RoleApps'] = roleApps!.map((v) => v.toJson()).toList();
    }
    data['UseQLCB'] = useQLCB;
    data['Gender'] = gender;
    if (amisLoginInfo != null) {
      data['AmisLoginInfo'] = amisLoginInfo!.toJson();
    }
    data['JobPositionName'] = jobPositionName;
    data['DepartmentId'] = departmentId;
    data['DepartmentName'] = departmentName;
    data['IsCheckLicense'] = isCheckLicense;
    data['EmployeeId'] = employeeId;
    data['IsEmployee'] = isEmployee;
    return data;
  }
}