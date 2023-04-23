class Teachers {
  String? address;
  String? subject;
  String? mobile;
  String? name;
  String? password;
  String? registration_id;
  String? year_of_joining;

  Teachers({
    this.address,
    this.mobile,
    this.name,
    this.password,
    this.registration_id,
    this.year_of_joining,
  });
  Teachers.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    mobile = json['mobile'];
    name = json['name'];
    password = json['password'];
    registration_id = json['registration_id'];
    year_of_joining = json['year_of_joining'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['mobile'] = mobile;
    data['name'] = name;
    data['password'] = password;
    data['registration_id'] = registration_id;
    data['year_of_joining'] = year_of_joining;
    return data;
  }
}
