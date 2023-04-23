class Admins {
  String? name;
  String? password;
  String? registration_id;

  Admins({
    this.name,
    this.password,
    this.registration_id,
  });
  Admins.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    password = json['password'];
    registration_id = json['registration_id'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['password'] = password;
    data['registration_id'] = registration_id;
    return data;
  }
}
