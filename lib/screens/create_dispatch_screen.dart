import 'package:flutter/material.dart';
import '../models/dispatch.dart';
import '../services/dispatch_service.dart';

class CreateDispatchScreen extends StatefulWidget {
  const CreateDispatchScreen({super.key});

  @override
  State<CreateDispatchScreen> createState() => _CreateDispatchScreenState();
}

class _CreateDispatchScreenState extends State<CreateDispatchScreen> {

  final TextEditingController employeeNumberController = TextEditingController();
  final TextEditingController patientNameController = TextEditingController();
  final TextEditingController houseNumberController = TextEditingController();
  final TextEditingController conditionController = TextEditingController();
  final TextEditingController ambulanceController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  final DispatchService dispatchService = DispatchService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Dispatch"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [

            TextField(
              controller: employeeNumberController,
              decoration: const InputDecoration(labelText: "Employee Number"),
            ),

            TextField(
              controller: patientNameController,
              decoration: const InputDecoration(labelText: "Patient Name"),
            ),

            TextField(
              controller: houseNumberController,
              decoration: const InputDecoration(labelText: "House Number"),
            ),

            TextField(
              controller: conditionController,
              decoration: const InputDecoration(labelText: "Condition"),
            ),

            TextField(
              controller: ambulanceController,
              decoration: const InputDecoration(labelText: "Assign Ambulance"),
            ),

            TextField(
              controller: notesController,
              decoration: const InputDecoration(labelText: "Notes"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {

                Dispatch newDispatch = Dispatch(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  employeeNumber: employeeNumberController.text,
                  patientName: patientNameController.text,
                  houseNumber: houseNumberController.text,
                  condition: conditionController.text,
                  ambulance: ambulanceController.text,
                  notes: notesController.text,
                );

                dispatchService.addDispatch(newDispatch);

                Navigator.pop(context);
              },

              child: const Text("CREATE DISPATCH"),
            ),
          ],
        ),
      ),
    );
  }
}
