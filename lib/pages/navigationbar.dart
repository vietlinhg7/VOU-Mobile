import 'package:flutter/material.dart';
import 'package:untitled/pages/manageaccount_page.dart';
import 'package:untitled/pages/managevoucher_page.dart';
import 'package:untitled/pages/manageevent_page.dart';
import 'package:untitled/class/account_info.dart';
import 'package:untitled/class/voucher.dart';
import 'package:untitled/class/event.dart';

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const NavigationExample(),
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.black12,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.calendar_today),
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Sự kiện',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.account_balance_wallet),
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: 'Voucher',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.manage_accounts),
            icon: Icon(Icons.manage_accounts_outlined),
            label: 'Tài khoản',
          ),
        ],
      ),
      body: <Widget>[
        /// Event page
        ManageEventPage(events: [
          Event(
            id: 1,
            name: 'Sự kiện Mùa Hè',
            imagePath: 'assets/Starbucks_Corporation_Logo_2011.svg.png',
            vouchers: 100,
            startTime: DateTime(2024, 6, 1),
            endTime: DateTime(2024, 9, 30),
          ),
          Event(
            id: 2,
            name: 'Sự kiện 2024',
            imagePath: 'assets/highlands-coffee-red-logo.webp',
            vouchers: 50,
            startTime: DateTime(2024, 12, 1),
            endTime: DateTime(2024, 12, 31),
          ),
        ]),

        /// Voucher page
        ManageVoucherPage(vouchers: [
          Voucher(
          id: 'SB001',
            qrCode: 'QR12345',
            imagePath: 'assets/Starbucks_Corporation_Logo_2011.svg.png',
            value: '50k',
            description: 'Đơn tối thiểu 200k',
            expiryDate: DateTime(2024, 12, 31),
            status: 'Online',
          ),
          Voucher(
            id: 'HL001',
            qrCode: 'QR12345',
            imagePath: 'assets/highlands-coffee-red-logo.webp',
            value: '10k',
            description: 'Đơn tối thiểu 50k',
            expiryDate: DateTime(2024, 11, 31),
            status: 'Online',
          ),
          Voucher(
            id: 'PMCT001',
            qrCode: 'QR12345',
            imagePath: 'assets/download-logo-vector-pharmacity-mien-phi.jpg',
            value: '30k',
            description: 'Đơn tối thiểu 100k',
            expiryDate: DateTime(2024, 9, 20),
            status: 'Offline',
          ),
        ]),

        /// Manage Account page
        ManageAccountPage(accountInfo: AccountInfo(
          uniqueId: '00001',
          username: 'vietlinhg4',
          password: 'vietlinhg4',
          avatarPath: 'default_avatar_path',
          birthDate: DateTime(2003, 12, 24),
          email: 'vietlinhg7@gmail.com',
          phoneNumber: '899929111',
          gender: Gender.male,
        ))
      ][currentPageIndex],
    );
  }
}
