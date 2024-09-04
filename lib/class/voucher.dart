class Voucher {
  final String id;
  final String qrCode;
  final String imagePath;
  final String value;
  final String description;
  final DateTime expiryDate;
  final String status;

  Voucher({
    required this.id,
    required this.qrCode,
    required this.imagePath,
    required this.value,
    required this.description,
    required this.expiryDate,
    required this.status,
  });
}