import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:intl/intl.dart';
import 'package:untitled/class/account_info.dart';

class ManageAccountPage extends StatefulWidget {
  final AccountInfo accountInfo;

  const ManageAccountPage({super.key, required this.accountInfo});

  @override
  State<ManageAccountPage> createState() => _ManageAccountPageState();
}

class _ManageAccountPageState extends State<ManageAccountPage> {
  final _formKey = GlobalKey<FormState>();
  String _selectedCountryCode = '+84';
  late TextEditingController _dateController;

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController(
      text: DateFormat('dd/MM/yyyy').format(widget.accountInfo.birthDate),
    );
  }

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Chỉnh sửa thông tin tài khoản')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: widget.accountInfo.uniqueId,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Mã định danh',
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                initialValue: widget.accountInfo.username,
                decoration: InputDecoration(labelText: 'Tên đăng nhập'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Vui lòng nhập tên đăng nhập';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                initialValue: widget.accountInfo.email,
                decoration: InputDecoration(labelText: 'Địa chỉ email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Vui lòng nhập địa chỉ email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                initialValue: widget.accountInfo.phoneNumber,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Số điện thoại",
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
              SizedBox(height: 16),
              TextFormField(
                controller: _dateController,
                readOnly: true,
                decoration: InputDecoration(labelText: 'Ngày sinh'),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateFormat('dd/MM/yyyy').parse(_dateController.text),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _dateController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
                    });
                  }
                },
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<Gender>(
                value: widget.accountInfo.gender,
                items: Gender.values.map((gender) {
                  return DropdownMenuItem<Gender>(
                    value: gender,
                    child: Text(gender.toString().split('.')[1]),
                  );
                }).toList(),
                onChanged: (Gender? value) {
                  setState(() {
                    widget.accountInfo.gender = value!;
                  });
                },
                decoration: InputDecoration(labelText: 'Giới tính'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Thực hiện cập nhật thông tin tài khoản
                    Navigator.of(context).pop();
                  }
                },
                child: Text('Cập nhật'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
