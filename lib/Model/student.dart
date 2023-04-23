class Students {
  String? address;
  String? standard;
  String? dob;
  String? mobile;
  String? name;
  String? password;
  String? registration_id;
  String? year_of_joining;

  Students({
    this.address,
    this.standard,
    this.dob,
    this.mobile,
    this.name,
    this.password,
    this.registration_id,
    this.year_of_joining,
  });
  Students.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    standard = json['standard'];
    dob = json['dob'];
    mobile = json['mobile'];
    name = json['name'];
    password = json['password'];
    registration_id = json['registration_id'];
    year_of_joining = json['year_of_joining'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['standard'] = standard;
    data['dob'] = dob;
    data['mobile'] = mobile;
    data['name'] = name;
    data['password'] = password;
    data['registration_id'] = registration_id;
    data['year_of_joining'] = year_of_joining;
    return data;
  }
}
