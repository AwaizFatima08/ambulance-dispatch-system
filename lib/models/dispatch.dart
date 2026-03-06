class Dispatch {
  final String id;
  final String employeeNumber;
  final String patientName;
  final String houseNumber;
  final String condition;
  final String ambulance;
  final String notes;
  String status;

  Dispatch({
    required this.id,
    required this.employeeNumber,
    required this.patientName,
    required this.houseNumber,
    required this.condition,
    required this.ambulance,
    required this.notes,
    this.status = "Pending",
  });
}
