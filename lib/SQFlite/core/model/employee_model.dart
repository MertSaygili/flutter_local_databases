class EmployeeModel {
  int? id;
  String name;
  String surname;
  String department;
  String phoneNumber;
  String eMail;
  bool gender;
  DateTime entryYear;

  EmployeeModel({
    this.id,
    required this.name,
    required this.surname,
    required this.department,
    required this.phoneNumber,
    required this.eMail,
    required this.gender,
    required this.entryYear,
  });

  // we are mapping the employee model to insert SQFLite
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'surname': surname,
      'department': department,
      'phoneNumber': phoneNumber,
      'eMail': eMail,
      'gender': gender ? 1 : 0, // 1 is woman, 0 is men
      'entryYear': entryYear.toString(), // sqflite doest not support date time
    };
  }

  @override
  String toString() {
    return 'Employee($id, $name, $surname, $department, $phoneNumber, $eMail, $gender, $entryYear)';
  }
}
