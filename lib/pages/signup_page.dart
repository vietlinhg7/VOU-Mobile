import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:untitled/pages/login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _phoneNumberController = TextEditingController();
  String _selectedCountryCode = '+84'; // Mặc định là Việt Nam

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(24),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            _header(context),
            _inputFields(context),
            _loginInfo(context),
          ]),
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Column(
      children: [
        Text(
          "Tạo tài khoản",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text("Vui lòng nhập các thông tin dưới đây"),
      ],
    );
  }

  Widget _inputFields(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          keyboardType: TextInputType.phone,
          controller: _phoneNumberController,
          decoration: InputDecoration(
            labelText: "Số điện thoại",
            labelStyle: TextStyle(color: Colors.grey),
            prefixIcon: CountryCodePicker(
              initialSelection: 'VN',
              favorite: ['+84'],
              onChanged: (code) {
                setState(() {
                  _selectedCountryCode = code.dialCode!;
                });
              },
            ),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            // Thực hiện hành động khi nhấn nút Đăng ký
            print("Đã nhấn nút Đăng ký");
            print("Số điện thoại: $_selectedCountryCode${_phoneNumberController.text}");
          },
          child: Text(
            "Đăng ký",
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

  Widget _loginInfo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Đã có tài khoản?"),
        TextButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage())),
          child: Text("Đăng nhập"),
        ),
      ],
    );
  }
}
