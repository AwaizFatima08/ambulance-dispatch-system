import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {

  final List<Map<String, String>> dispatches = [
    {"id": "D001", "patient": "Ali Raza", "house": "B17", "status": "Enroute"},
    {"id": "D002", "patient": "Ahmed Khan", "house": "C12", "status": "Pickup"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ambulance Dispatch Dashboard")),
      body: Column(
        children: [

          Card(
            child: ListTile(
              title: Text("Ambulance 1"),
              trailing: Text("Available", style: TextStyle(color: Colors.green)),
            ),
          ),

          Card(
            child: ListTile(
              title: Text("Ambulance 2"),
              trailing: Text("Busy", style: TextStyle(color: Colors.red)),
            ),
          ),

          Divider(),

          Text("Active Dispatches", style: TextStyle(fontSize: 20)),

          Expanded(
            child: ListView.builder(
              itemCount: dispatches.length,
              itemBuilder: (context, index) {
                final d = dispatches[index];

                return Card(
                  child: ListTile(
                    title: Text(d['patient']!),
                    subtitle: Text("House ${d['house']}"),
                    trailing: Text(d['status']!),
                  ),
                );
              },
            ),
          ),

          ElevatedButton(
            onPressed: () {},
            child: Text("NEW DISPATCH"),
          )
        ],
      ),
    );
  }
}
