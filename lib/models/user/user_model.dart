import 'package:misa_ihost/models/auth/custom_url_model.dart';

class UserModel {
  String? userName;
  String? fullName;
  String? gender;
  String? userID;
  String? tenantID;
  String? tenantCode;
  String? tenantName;
  String? transactionName;
  String? employeeCode;
  String? mISACode;
  String? applications;
  String? jobPositionName;
  String? jobPositionID;
  String? organizationUnitName;
  String? organizationUnitID;
  String? mISAIDEmail;
  String? installedApplications;
  String? sessionID;
  String? refreshToken;
  int? expiresInSeconds;
  CustomUrlModel? customUrls;

  UserModel(
      {this.userName,
      this.fullName,
      this.gender,
      this.userID,
      this.tenantID,
      this.tenantCode,
      this.tenantName,
      this.transactionName,
      this.employeeCode,
      this.mISACode,
      this.applications,
      this.jobPositionName,
      this.jobPositionID,
      this.organizationUnitName,
      this.organizationUnitID,
      this.mISAIDEmail,
      this.installedApplications,
      this.sessionID,
      this.refreshToken,
      this.expiresInSeconds,
      this.customUrls});

  UserModel.fromJson(Map<String, dynamic> json) {
    userName = json['UserName'];
    fullName = json['FullName'];
    gender = json['Gender'];
    userID = json['UserID'];
    tenantID = json['TenantID'];
    tenantCode = json['TenantCode'];
    tenantName = json['TenantName'];
    transactionName = json['TransactionName'];
    employeeCode = json['EmployeeCode'];
    mISACode = json['MISACode'];
    applications = json['Applications'];
    jobPositionName = json['JobPositionName'];
    jobPositionID = json['JobPositionID'];
    organizationUnitName = json['OrganizationUnitName'];
    organizationUnitID = json['OrganizationUnitID'];
    mISAIDEmail = json['MISAIDEmail'];
    installedApplications = json['InstalledApplications'];
    sessionID = json['SessionID'];
    refreshToken = json['RefreshToken'];
    expiresInSeconds = json['ExpiresInSeconds'];
    customUrls = json['CustomUrls'] != null
        ? CustomUrlModel.fromJson(json['CustomUrls'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserName'] = userName;
    data['FullName'] = fullName;
    data['Gender'] = gender;
    data['UserID'] = userID;
    data['TenantID'] = tenantID;
    data['TenantCode'] = tenantCode;
    data['TenantName'] = tenantName;
    data['TransactionName'] = transactionName;
    data['EmployeeCode'] = employeeCode;
    data['MISACode'] = mISACode;
    data['Applications'] = applications;
    data['JobPositionName'] = jobPositionName;
    data['JobPositionID'] = jobPositionID;
    data['OrganizationUnitName'] = organizationUnitName;
    data['OrganizationUnitID'] = organizationUnitID;
    data['MISAIDEmail'] = mISAIDEmail;
    data['InstalledApplications'] = installedApplications;
    data['SessionID'] = sessionID;
    data['RefreshToken'] = refreshToken;
    data['ExpiresInSeconds'] = expiresInSeconds;
    if (customUrls != null) {
      data['CustomUrls'] = customUrls!.toJson();
    }
    return data;
  }
}
