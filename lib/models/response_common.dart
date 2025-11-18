class ResponseCommon<T> {
  final int code;
  final String message;
  final T? data;
  final bool status;

  //trả về true là call api thành công
  bool get isSuccess => code == 200;

  ResponseCommon({
    required this.code,
    required this.message,
    this.data,
    required this.status,
  });

  factory ResponseCommon.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return ResponseCommon<T>(
      code: json['Code'] as int? ?? 0,
      message: json['Message'] as String? ?? '',
      data: json['Data'] != null ? fromJsonT(json['Data']) : null,
      status: json['Status'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Code'] = code;
    data['Message'] = message;
    if (this.data != null) {
      data['Data'] = toJsonT(this.data as T);
    }
    data['Status'] = status;
    return data;
  }
}
