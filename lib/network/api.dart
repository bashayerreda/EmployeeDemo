import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:networking/model/Employee.dart';

class API {

  static Future<Employee> createEmployee(Employee employee) async {
    //business logic to send data to server
    final http.Response response = await  http.post('http://dummy.restapiexample.com/api/v1/create',
        headers: <String, String>{

        },
        body: jsonEncode(employee.toJson()));

    if (response.statusCode == 200) {
      print(response.body);
      return Employee.fromJson(json.decode(response.body));
    } else {
      print('Error');
      throw Exception("Can't load author");
    }
  }

  static Future<List<Employee>> getAllEmployees() async {
    //business logic to send data to server
    final http.Response response = await http.get('http://dummy.restapiexample.com/api/v1/employees');

    if (response.statusCode == 200) {
      //print(response.body);
      //parse json into list of objects
      final parsed = json.decode(response.body);
      return parsed["data"].map<Employee>((item) => Employee.fromJson(item)).toList();
    } else {
      print('Error'+response.body);
      throw Exception("Can't load ");
    }
  }
}
