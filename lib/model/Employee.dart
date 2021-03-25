class Employee {

  String employee_name;
  String employee_age;
  Employee({ this.employee_name,  this.employee_age});
  factory Employee.fromJson(Map<String, dynamic> author) => Employee(
      employee_name: author['employee_name']??"",
      employee_age: author['employee_age']??"");
  Map<String, dynamic> toJson() =>
      {'name': employee_name,  'age': employee_age};
}
