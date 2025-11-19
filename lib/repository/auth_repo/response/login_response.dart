import 'package:misa_ihost/models/auth/context_model.dart';

class LoginResponse {
  String? token;
  String? refreshToken;
  int? tokenTimeout;
  ContextModel? context;

  LoginResponse({
    this.token,
    this.refreshToken,
    this.tokenTimeout,
    this.context,
  });

  LoginResponse.fromJson(Map<String, dynamic> json) {
    token = json['Token'];
    refreshToken = json['RefreshToken'];
    tokenTimeout = json['TokenTimeout'];
    context = json['Context'] != null
        ? ContextModel.fromJson(json['Context'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Token'] = token;
    data['RefreshToken'] = refreshToken;
    data['TokenTimeout'] = tokenTimeout;
    if (context != null) {
      data['Context'] = context!.toJson();
    }
    return data;
  }
}

//đăng nhập lần đầu chưa có deviceId trong hệ thống
class LoginResponseFirst {
  String? userName;
  bool? useEmail;
  bool? usePhoneNumber;
  bool? useAppAuthenticator;

  LoginResponseFirst({
    this.userName,
    this.useEmail,
    this.usePhoneNumber,
    this.useAppAuthenticator,
  });

  LoginResponseFirst.fromJson(Map<String, dynamic> json) {
    userName = json['UserName'];
    useEmail = json['UseEmail'];
    usePhoneNumber = json['UsePhoneNumber'];
    useAppAuthenticator = json['UseAppAuthenticator'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserName'] = userName;
    data['UseEmail'] = useEmail;
    data['UsePhoneNumber'] = usePhoneNumber;
    data['UseAppAuthenticator'] = useAppAuthenticator;
    return data;
  }
}
