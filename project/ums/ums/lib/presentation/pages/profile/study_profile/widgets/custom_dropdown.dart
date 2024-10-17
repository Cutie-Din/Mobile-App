import 'package:flutter/material.dart';
import '../../../../../core/constants/device.dart';
import '../../../../../core/constants/fonts.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    Key? key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: AppFonts.fontSizeSm,
              fontWeight: AppFonts.bold,
              color: Colors.black54,
            ),
          ),
          SizedBox(width: AppDeviceUtils.screenWidth(context) * 0.02),
          Expanded(
            child: DropdownButton<String>(
              value: value,
              hint: Text('Chọn $label'),
              isExpanded: true,
              onChanged: onChanged,
              items: items.map<DropdownMenuItem<String>>((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
