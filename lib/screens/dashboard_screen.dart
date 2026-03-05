import 'package:flutter/material.dart';
import 'create_dispatch_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  List<Map<String, String>> dispatches = [
    {
      "id": "D001",
      "patient": "Ali Raza",
      "house": "B17",
      "status": "Enroute"
    },
    {
      "id": "D002",
      "patient": "Ahmed Khan",
      "house": "C12",
      "status": "Pickup"
    },
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Ambulance Dispatch Dashboard"),
      ),

      body: Column(
        children: [

          // Ambulance Status Section
          Padding(
            padding: EdgeInsets.all(8),
            child: Card(
              child: ListTile(
                title: Text("Ambulance 1"),
                trailing: Text(
                  "Available",
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(8),
            child: Card(
              child: ListTile(
                title: Text("Ambulance 2"),
                trailing: Text(
                  "Busy",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          ),

          Divider(),

          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              "Active Dispatches",
              style: TextStyle(fontSize: 20),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: dispatches.length,
              itemBuilder: (context, index) {

                final d = dispatches[index];

                return Card(
                  child: ListTile(
                    title: Text("${d['patient']} (House ${d['house']})"),
                    subtitle: Text("Dispatch ID: ${d['id']}"),
                    trailing: Text(d['status']!),
                  ),
                );

              },
            ),
          ),

          Padding(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateDispatchScreen(),
                  ),
                );

              },
              child: Text("NEW DISPATCH"),
            ),
          )

        ],
      ),
    );
  }
}
