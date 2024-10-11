import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

class EditProfileDialog extends StatefulWidget {
  @override
  _EditProfileDialogState createState() => _EditProfileDialogState();
}

class _EditProfileDialogState extends State<EditProfileDialog> {
  DateTime? _selectedDate;
  String _gender = 'Nam';
  String _nationality = 'Việt Nam';
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _permanentAddressController = TextEditingController();
  final TextEditingController _currentAddressController = TextEditingController();

  // Function to pick date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Chỉnh sửa thông tin'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text(
                  'Ngày sinh: ${_selectedDate != null ? DateFormat('dd/MM/yyyy').format(_selectedDate!) : 'Chọn ngày'}'),
              trailing: Icon(Icons.calendar_today),
              onTap: () => _selectDate(context),
            ),
            DropdownButton<String>(
              value: _gender,
              onChanged: (String? newValue) {
                setState(() {
                  _gender = newValue!;
                });
              },
              items: <String>['Nam', 'Nữ'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            DropdownButton<String>(
              value: _nationality,
              onChanged: (String? newValue) {
                setState(() {
                  _nationality = newValue!;
                });
              },
              items: <String>['Việt Nam', 'Lào', 'Thái Lan']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Số điện thoại'),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              controller: _permanentAddressController,
              decoration: InputDecoration(labelText: 'HK thường trú'),
            ),
            TextField(
              controller: _currentAddressController,
              decoration: InputDecoration(labelText: 'Nơi ở hiện nay'),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Huỷ'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Xác nhận'),
          onPressed: () {
            // Handle the confirmation logic here
            print(
                'Ngày sinh: ${_selectedDate != null ? DateFormat('dd/MM/yyyy').format(_selectedDate!) : 'Chưa chọn'}');
            print('Giới tính: $_gender');
            print('Quốc tịch: $_nationality');
            print('Số điện thoại: ${_phoneController.text}');
            print('HK thường trú: ${_permanentAddressController.text}');
            print('Nơi ở hiện nay: ${_currentAddressController.text}');

            // Optionally, you could save this data or pass it to a state management solution.

            Navigator.of(context).pop(); // Close the dialog
          },
        ),
      ],
    );
  }
}
