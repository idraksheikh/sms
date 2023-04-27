class Teachers {
  String? address;
  String? subject;
  List<String>? classes;
  String? mobile;
  String? name;
  String? password;
  String? registration_id;
  String? year_of_joining;

  Teachers({
    this.address,
    this.subject,
    this.mobile,
    this.classes,
    this.name,
    this.password,
    this.registration_id,
    this.year_of_joining,
  });
  Teachers.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    subject = json['subject'];
    mobile = json['mobile'];
    if (json['classes'] != null) {
      classes=<String>[];
      json['classes'].forEach((v) {
        classes!.add(v.toString());
      });
    }

    name = json['name'];
    password = json['password'];
    registration_id = json['registration_id'];
    year_of_joining = json['year_of_joining'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['subject'] = subject;
    data['mobile'] = mobile;
    data['name'] = name;
    data['password'] = password;
    data['registration_id'] = registration_id;
    data['year_of_joining'] = year_of_joining;
    if (classes != null) {
      data['classes'] = classes!.map((v) => v).toList();
    }
    return data;
  }
}
