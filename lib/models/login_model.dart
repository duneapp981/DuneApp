class LoginModel {
  LoginModel({
    required this.message,
    required this.data,
    required this.token,
  });
  late final String message;
  late final Data data;
  late final String token;

  LoginModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = Data.fromJson(json['data']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['data'] = data.toJson();
    _data['token'] = token;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    this.name,
    this.email,
    required this.password,
    required this.phone,
    this.address,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String id;
  late final dynamic name;
  late final dynamic email;
  late final String password;
  late final String phone;
  late final dynamic address;
  late final String createdAt;
  late final String updatedAt;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = null;
    email = null;
    password = json['password'];
    phone = json['phone'];
    address = null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['password'] = password;
    _data['phone'] = phone;
    _data['address'] = address;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}
