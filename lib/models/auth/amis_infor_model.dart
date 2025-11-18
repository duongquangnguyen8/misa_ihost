import 'package:misa_ihost/models/auth/secure_infor_model.dart';
import 'package:misa_ihost/models/user/user_model.dart';

class AmisLoginInfoModel {
  UserModel? user;
  bool? isMultiTenants;
  SecureInfoModel? secureInfo;

  AmisLoginInfoModel({this.user, this.isMultiTenants, this.secureInfo});

  AmisLoginInfoModel.fromJson(Map<String, dynamic> json) {
    user = json['User'] != null ? UserModel.fromJson(json['User']) : null;
    isMultiTenants = json['IsMultiTenants'];
    secureInfo = json['SecureInfo'] != null
        ? SecureInfoModel.fromJson(json['SecureInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['User'] = user!.toJson();
    }
    data['IsMultiTenants'] = isMultiTenants;
    if (secureInfo != null) {
      data['SecureInfo'] = secureInfo!.toJson();
    }
    return data;
  }
}
