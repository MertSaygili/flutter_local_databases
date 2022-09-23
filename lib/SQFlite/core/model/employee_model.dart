class EmployeeModel {
  int? id;
  String? name;
  String? surname;
  String? phoneNumber;
  String? eMail;
  bool? gender;
  DateTime? entryYear;

  EmployeeModel({
    this.id,
    this.name,
    this.surname,
    this.phoneNumber,
    this.eMail,
    this.gender,
    this.entryYear,
  });

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    surname = json['surname'];
    phoneNumber = json['phoneNumber'];
    eMail = json['eMail'];
    gender = json['gender'];
    entryYear = json['entryYear'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['name'] = name;
    data['surname'] = surname;
    data['phoneNumber'] = phoneNumber;
    data['eMail'] = eMail;
    data['gender'] = gender;
    data['entryYear'] = entryYear;

    return data;
  }
}
