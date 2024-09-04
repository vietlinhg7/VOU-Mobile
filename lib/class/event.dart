class Event {
  final int id;
  final String name;
  final String imagePath;
  final int vouchers;
  final DateTime startTime;
  final DateTime endTime;

  Event({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.vouchers,
    required this.startTime,
    required this.endTime,
  });
}