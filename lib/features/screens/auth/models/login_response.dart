class LoginResponse {
  LoginResponse({
    this.id,
    this.name,
    this.email,
    this.type,
    this.language,
    this.status,
    this.customerCompanyId,
    this.role,
    this.token,
  });

  LoginResponse.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    type = json['type'];
    language =
        json['language'] != null ? Language.fromJson(json['language']) : null;
    status = json['status'];
    customerCompanyId = json['customer_company_id'];
    role = json['role'];
    token = json['token'];
  }
  int? id;
  String? name;
  String? email;
  String? type;
  Language? language;
  String? status;
  int? customerCompanyId;
  String? role;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['type'] = type;
    if (language != null) {
      map['language'] = language?.toJson();
    }
    map['status'] = status;
    map['customer_company_id'] = customerCompanyId;
    map['role'] = role;
    map['token'] = token;
    return map;
  }
}

class Language {
  Language({
    this.id,
    this.name,
    this.code,
    this.createdAt,
    this.updatedAt,
  });

  Language.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;
  String? code;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['code'] = code;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
