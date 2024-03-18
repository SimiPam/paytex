// ignore_for_file: prefer_collection_literals, unnecessary_this

import 'dart:convert';

CreateAccountPayLoad createAccountPayLoadFromJson(String str) =>
    CreateAccountPayLoad.fromJson(json.decode(str));

String createAccountPayLoadToJson(CreateAccountPayLoad data) =>
    json.encode(data.toJson());

class CreateAccountPayLoad {
  CreateAccountPayLoad({
    this.payload,
    this.totalCount,
    this.errors,
    this.hasErrors,
    this.code,
    this.description,
  });

  Payload? payload;
  int? totalCount;
  List<dynamic>? errors;
  bool? hasErrors;
  int? code;
  String? description;

  factory CreateAccountPayLoad.fromJson(Map<String, dynamic> json) =>
      CreateAccountPayLoad(
        payload:
            json["payload"] == null ? null : Payload.fromJson(json["payload"]),
        totalCount: json["totalCount"],
        errors: json["errors"] == null
            ? []
            : List<dynamic>.from(json["errors"]!.map((x) => x)),
        hasErrors: json["hasErrors"],
        code: json["code"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "payload": payload?.toJson(),
        "totalCount": totalCount,
        "errors":
            errors == null ? [] : List<dynamic>.from(errors!.map((x) => x)),
        "hasErrors": hasErrors,
        "code": code,
        "description": description,
      };
}

// class CreateAccountPayLoad {
//   int? code;
//   String? description;
//   List<Payload>? payload;
//   int? totalCount;
//   List<String>? errors;
//   bool? hasErrors;
//
//   CreateAccountPayLoad(
//       {this.code,
//       this.description,
//       this.payload,
//       this.totalCount,
//       this.errors,
//       this.hasErrors});
//
//   CreateAccountPayLoad.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     description = json['description'];
//     if (json['payload'] != null) {
//       payload = <Payload>[];
//       json['payload'].forEach((v) {
//         payload!.add(Payload.fromJson(v));
//       });
//     }
//     totalCount = json['totalCount'];
//     errors = json['errors'].cast<String>();
//     hasErrors = json['hasErrors'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['code'] = this.code;
//     data['description'] = this.description;
//     if (this.payload != null) {
//       data['payload'] = this.payload!.map((v) => v.toJson()).toList();
//     }
//     data['totalCount'] = this.totalCount;
//     data['errors'] = this.errors;
//     data['hasErrors'] = this.hasErrors;
//     return data;
//   }
// }

// class Payload {
//   List<String>? memberNames;
//   String? errorMessage;
//   String? requestId;
//   String? message;
//
//   Payload({
//     this.memberNames,
//     this.errorMessage,
//     this.requestId,
//     this.message,
//   });
//
//   Payload.fromJson(Map<String, dynamic> json) {
//     memberNames =
//         json["memberNames"] == null ? [] : json['memberNames'].cast<String>();
//     errorMessage = json['errorMessage'];
//     requestId = json["requestId"];
//     message = json["message"];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['memberNames'] = this.memberNames;
//     data['errorMessage'] = this.errorMessage;
//     data['requestId'] = this.errorMessage;
//     data['message'] = this.errorMessage;
//     return data;
//   }
// }

class Payload {
  Payload({
    this.requestId,
    this.message,
    this.memberNames,
    this.errorMessage,
  });

  String? requestId;
  String? message;
  List<String>? memberNames;
  String? errorMessage;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        requestId: json["requestId"],
        message: json["message"],
        memberNames: json["memberNames"] == null
            ? []
            : List<String>.from(json["memberNames"]!.map((x) => x)),
        errorMessage: json["errorMessage"],
      );

  Map<String, dynamic> toJson() => {
        "requestId": requestId,
        "message": message,
        "memberNames": memberNames == null
            ? []
            : List<dynamic>.from(memberNames!.map((x) => x)),
        "errorMessage": errorMessage,
      };
}
