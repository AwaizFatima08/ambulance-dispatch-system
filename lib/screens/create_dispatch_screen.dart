import 'package:flutter/material.dart';

class CreateDispatchScreen extends StatefulWidget {
  @override
  _CreateDispatchScreenState createState() => _CreateDispatchScreenState();
}

class _CreateDispatchScreenState extends State<CreateDispatchScreen> {

  final employeeController = TextEditingController();
  final patientController = TextEditingController();
  final houseController = TextEditingController();
  final conditionController = TextEditingController();
  final notesController = TextEditingController();

  String ambulance = "Ambulance 1";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Create Dispatch"),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),

        child: ListView(
          children: [

            TextField(
              controller: employeeController,
              decoration: InputDecoration(labelText: "Employee Number"),
            ),

            TextField(
              controller: patientController,
              decoration: InputDecoration(labelText: "Patient Name"),
            ),

            TextField(
              controller: houseController,
              decoration: InputDecoration(labelText: "House Number"),
            ),

            TextField(
              controller: conditionController,
              decoration: InputDecoration(labelText: "Condition"),
            ),

            DropdownButtonFormField(
              value: ambulance,
              items: [
                DropdownMenuItem(
                  value: "Ambulance 1",
                  child: Text("Ambulance 1"),
                ),
                DropdownMenuItem(
                  value: "Ambulance 2",
                  child: Text("Ambulance 2"),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  ambulance = value!;
                });
              },
              decoration: InputDecoration(labelText: "Assign Ambulance"),
            ),

            TextField(
              controller: notesController,
              decoration: InputDecoration(labelText: "Notes"),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {

                Navigator.pop(context);

              },
              child: Text("CREATE DISPATCH"),
            )

          ],
        ),
      ),
    );
  }
}
