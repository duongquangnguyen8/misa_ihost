class CustomUrlModel {
  String? homePageUrl;
  String? logoutUrl;
  String? rootUrl;

  CustomUrlModel({this.homePageUrl, this.logoutUrl, this.rootUrl});

  CustomUrlModel.fromJson(Map<String, dynamic> json) {
    homePageUrl = json['HomePageUrl'];
    logoutUrl = json['LogoutUrl'];
    rootUrl = json['RootUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['HomePageUrl'] = homePageUrl;
    data['LogoutUrl'] = logoutUrl;
    data['RootUrl'] = rootUrl;
    return data;
  }
}