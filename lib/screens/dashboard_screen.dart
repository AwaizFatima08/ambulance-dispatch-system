import 'package:flutter/material.dart';
import '../services/dispatch_service.dart';
import '../models/dispatch.dart';
import 'create_dispatch_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  final DispatchService dispatchService = DispatchService();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ambulance Dispatch Dashboard"),
      ),

      body: Column(
        children: [

          const SizedBox(height: 10),

          const Text(
            "Active Dispatches",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: dispatchService.dispatches.isEmpty
                ? const Center(
                    child: Text(
                      "No active dispatches",
                      style: TextStyle(fontSize: 16),
                    ),
                  )

                : ListView.builder(
                    itemCount: dispatchService.dispatches.length,
                    itemBuilder: (context, index) {

                      Dispatch dispatch =
                          dispatchService.dispatches[index];

                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),

                        child: Padding(
                          padding: const EdgeInsets.all(12),

                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: [

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,

                                children: [

                                  Text(
                                    dispatch.patientName,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  Text(
                                    dispatch.status,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 8),

                              Text(
                                "House: ${dispatch.houseNumber}",
                                style:
                                    const TextStyle(fontSize: 16),
                              ),

                              Text(
                                "Condition: ${dispatch.condition}",
                                style:
                                    const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),

          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.all(12),

            child: SizedBox(
              width: double.infinity,
              height: 50,

              child: ElevatedButton(
                onPressed: () async {

                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const CreateDispatchScreen(),
                    ),
                  );

                  setState(() {});
                },

                child: const Text(
                  "NEW DISPATCH",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
