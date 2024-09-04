import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:untitled/pages/signup_page.dart';
import 'package:untitled/pages/navigationbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneNumberController = TextEditingController();
  String _selectedCountryCode = '+84'; // Mặc định là Việt Nam
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(context),
              _inputField(context),
              _forgotPassword(context),
              _signup(context),
            ],
          ),
        ),
      ),
    );
  }

  _header(context) {
    return Column(
      children: [
        Text(
          "Hệ thống VOU",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text("Vui lòng nhập số điện thoại và mật khẩu"),
      ],
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          keyboardType: TextInputType.phone,
          controller: _phoneNumberController,
          decoration: InputDecoration(
            labelText: "Số điện thoại",
            labelStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: CountryCodePicker(
              initialSelection: 'VN',
              favorite: ['+84'],
              onChanged: (code) {
                setState(() {
                  _selectedCountryCode = code.dialCode!;
                });
              },
            ),
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: _passwordController,
          decoration: InputDecoration(
            labelText: "Mật khẩu",
            labelStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.lock),
          ),
          obscureText: true,
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            // Thực hiện hành động khi nhấn nút Đăng ký
            print("Đã nhấn nút Đăng nhập");
            print("Số điện thoại: $_selectedCountryCode${_phoneNumberController.text}");
            print("Mật khẩu: ${_passwordController.text}");
            Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationBarApp()));
          },
          child: Text(
            "Đăng nhập",
            style: TextStyle(fontSize: 20),
          ),
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
        )
      ],
    );
  }

  _forgotPassword(context) {
    return TextButton(onPressed: () {}, child: Text("Quên mật khẩu?"));
  }

  _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Chưa có tài khoản? "),
        TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage())), child: Text("Đăng ký"))
      ],
    );
  }
}