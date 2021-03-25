import 'package:flutter/material.dart';
import 'package:networking/model/Employee.dart';
import 'package:networking/network/api.dart';

import 'add_employee.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Employee>> authors;
  @override
  void initState() {
    super.initState();
    setState(() {
      authors = API.getAllEmployees();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Networking lesson 2'),
      ),
      body: FutureBuilder<List<Employee>>(
        future: authors,
        builder: (context, snapshot) {

          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return Card(
                    child: ListTile(
                      title: Text(snapshot.data[i].employee_name),
                      subtitle: Row(
                        children: <Widget>[

                          SizedBox(
                            width: 100,
                          ),
                          Text('${snapshot.data[i].employee_age}'),
                        ],
                      ),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Text('Sorry there is an error');
          }else{
            return Center(child: CircularProgressIndicator());
          }

        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddAuthor(),
            ),
          );
          setState(() {
            authors = API.getAllEmployees();
          });
        },
      ),
    );
  }
}
