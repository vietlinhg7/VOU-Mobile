import 'package:flutter/material.dart';
import 'package:untitled/class/voucher.dart';

class ManageVoucherPage extends StatelessWidget {
  final List<Voucher> vouchers;

  const ManageVoucherPage({super.key, required this.vouchers});

  void _redeemOnline(BuildContext context, Voucher voucher) {
    // Simulate the process of redeeming the voucher online
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Voucher ${voucher.id}'),
          content: Text('Bạn đã nhận voucher thành công.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _redeemOffline(BuildContext context, Voucher voucher) {
    // Simulate the process of redeeming the voucher offline
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Mã QR Voucher ${voucher.id}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Placeholder for the image
              SizedBox(
                width: 300,  // Set desired width
                height: 300, // Set desired height
                child: Image.asset(
                  'assets/QR_code_for_mobile_English_Wikipedia.svg.webp',  // Replace with your placeholder image path
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),  // Space between image and text
              Text('Hãy đưa mã QR này cho nhân viên bán hàng'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ví Voucher'),
      ),
      body: ListView.builder(
        itemCount: vouchers.length,
        itemBuilder: (context, index) {
          final voucher = vouchers[index];
          return Card(
            child: ListTile(
              leading: SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(
                  voucher.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text('Voucher ${voucher.id}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Trị giá: \$${voucher.value}'),
                  Text('Mô tả: ${voucher.description}'),
                  Text('Ngày hết hạn: ${voucher.expiryDate.toString().split(' ')[0]}'),
                  Text('Loại: ${voucher.status}'),
                ],
              ),
              trailing: Column(
                children: [
                  if (voucher.status == 'Online')
                    IconButton(
                      icon: const Icon(Icons.card_giftcard),
                      onPressed: () {
                          _redeemOnline(context, voucher);
                      }
                      ),
                  if (voucher.status == 'Offline')
                    IconButton(
                      icon: const Icon(Icons.qr_code),
                      onPressed: () => _redeemOffline(context, voucher),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
