part of 'app_bottom_sheet.dart';

class AppDatePicker extends StatefulWidget {
  const AppDatePicker({super.key});

  @override
  State<AppDatePicker> createState() => _AppDatePickerState();
}

class _AppDatePickerState extends State<AppDatePicker> {
  DateTime? _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CalendarDatePicker2(
          config: CalendarDatePicker2Config(
            calendarType: CalendarDatePicker2Type.multi,
            centerAlignModePicker: true,
            controlsHeight: 50,
            controlsTextStyle: GoogleFonts.manrope(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.black5,
            ),
            lastMonthIcon: const Icon(Icons.chevron_left, size: 24),
            nextMonthIcon: const Icon(Icons.chevron_right, size: 24),
            selectedDayHighlightColor: AppColors.primary,
            dayTextStyle: GoogleFonts.manrope(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: AppColors.black5,
            ),
            selectedDayTextStyle: GoogleFonts.manrope(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: AppColors.button,
            ),
          ),
          value: [_selectedDate],
          onValueChanged: (dates) {
            setState(() {
              _selectedDate = dates.isNotEmpty ? dates.first : null;
            });
          },
        ),
        const Gap(10),
        AppButton(
          buttonText: 'Lọc',
          sizeButton: 'large',
          onPressed: () {
            if (_selectedDate != null) {
              print('Ngày đã chọn: $_selectedDate');
            }
          },
        ),
        const Gap(10),
        AppButton(
          buttonText: 'Làm mới',
          sizeButton: 'large',
          onPressed: () {
            setState(() {
              _selectedDate = DateTime.now();
            });
          },
        ),
      ],
    );
  }
}
