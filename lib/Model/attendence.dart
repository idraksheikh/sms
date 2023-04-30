class Attendence {
  Map<String, Dates>? dates;

  Attendence.fromJson(Map<String, dynamic> json) {
    if (json['dates'] != null) {
      print('h1');
      dates = <String, Dates>{};
      json['dates'].forEach((key, value) {
        dates?.putIfAbsent(key, () => Dates.fromJson(value));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (dates != null) {
      data['dates'] = dates!.map((key, value) => MapEntry(key, value.toJson()));
    }
    return data;
  }
}

class Dates {
  String? teacher_id;
  Map<String, bool>? attendence;

  Dates({
    this.teacher_id,
    this.attendence,
  });
  Dates.fromJson(Map<String, dynamic> json) {
    teacher_id = json['teacher_id'];
    if (json['attendence'] != null) {
      attendence = <String, bool>{};
      json['attendence'].forEach((key, value) {
        attendence?.putIfAbsent(key, () => value);
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['teacher_id'] = teacher_id;
    if (attendence != null) {
      data['attendence'] =
          attendence!.map((key, value) => MapEntry(key, value));
    }
    return data;
  }
}