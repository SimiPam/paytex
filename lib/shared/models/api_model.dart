// ignore_for_file: prefer_if_null_operators, unnecessary_overrides

import 'dart:convert';

ApiResponse apiResponseFromJson(String str) =>
    ApiResponse.fromJson(json.decode(str));

String apiResponseToJson(ApiResponse data) => json.encode(data.toJson());

class ApiResponse<T> {
  ApiResponse({
    this.payload,
    this.totalCount,
    this.errors,
    this.hasErrors,
    this.code,
    this.description,
  });

  T? payload;
  int? totalCount;
  List<String>? errors;
  bool? hasErrors;
  int? code;
  String? description;

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        payload: json["payload"] == null ? null : json["payload"],
        totalCount: json["totalCount"] == null ? null : json["totalCount"],
        errors: json["errors"] == null
            ? null
            : List<String>.from(json["errors"].map((x) => x)),
        hasErrors: json["hasErrors"] == null ? null : json["hasErrors"],
        code: json["code"] == null ? null : json["code"],
        description: json["description"] == null ? null : json["description"],
      );

  Map<String, dynamic> toJson() => {
        "payload": payload == null ? null : payload,
        "totalCount": totalCount == null ? null : totalCount,
        "errors":
            errors == null ? null : List<dynamic>.from(errors!.map((x) => x)),
        "hasErrors": hasErrors == null ? null : hasErrors,
        "code": code == null ? null : code,
        "description": description == null ? null : description,
      };

  @override
  String toString() {
    return super.toString();
  }
}
