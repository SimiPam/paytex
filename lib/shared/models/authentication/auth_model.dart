// ignore_for_file: prefer_collection_literals, unnecessary_new, unnecessary_this

class AuthPayload<T> {
  String? accessToken;
  String? tokenType;
  int? expiresIn;

  AuthPayload({this.accessToken, this.tokenType, this.expiresIn});

  AuthPayload.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    return data;
  }
}

class AuthErrorPayload<T> {
  String? error;
  String? errorDescription;

  AuthErrorPayload({this.error, this.errorDescription});

  AuthErrorPayload.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    errorDescription = json['error_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['error_description'] = this.errorDescription;
    return data;
  }
}

// class AuthPayload {
//   AuthPayload(
//       {
//       // this.id,
//       // this.token,
//       // this.updatedAt,
//       // this.refreshedAt,
//       // this.refreshToken,
//       this.tokenType,
//       this.expiresIn,
//       this.accessToken});

//   factory AuthPayload.fromJson(dynamic json,
//       [DateTime? updated, DateTime? refreshed]) {
//     if (json == null) {
//       // return null;
//       throw Exception;
//     }

//     int updateTime = DateTime.now().millisecondsSinceEpoch;
//     if (updated != null) {
//       updateTime = updated.millisecondsSinceEpoch;
//     } else if (json['updatedAt'] != null) {
//       updateTime = json['updatedAt'] as int;
//     }

//     int refreshTime = DateTime.now().millisecondsSinceEpoch;
//     if (refreshed != null) {
//       refreshTime = refreshed.millisecondsSinceEpoch;
//     } else if (json['expires_in'] != null) {
//       refreshTime = json['expires_in'] as int;
//     }

//     return AuthPayload(
//       tokenType: json['token_type'] as String,
//       accessToken: json['access_token'] as String,
//       expiresIn: updateTime,
//       // expiresIn: json['expires_in'] as int,
//       // updatedAt: updateTime,
//       // refreshedAt: refreshTime,
//     );
//   }

//   String? tokenType;
//   String? accessToken;
//   int? expiresIn; // milliseconds since epoch
//   // String? id;
//   // String? token;
//   // String? updatedAt;
//   // String? refreshToken;
//   // int? refreshedAt;

//   Map<String, dynamic> toJson() {
//     return <String, dynamic>{
//       // 'id': id,
//       // 'token': token,
//       // 'updatedAt': updatedAt,
//       // 'refresh_token': refreshToken,
//       // 'refreshedAt': refreshedAt,
//     };
//   }
// }

// class SignInData {
//   String email, password;

//   SignInData({this.email = "", this.password = ""});
// }
