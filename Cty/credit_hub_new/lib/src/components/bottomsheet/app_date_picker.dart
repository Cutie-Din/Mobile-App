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
    final _config = CalendarDatePicker2Config(
      calendarType: CalendarDatePicker2Type.range,
      centerAlignModePicker: true,
      controlsHeight: 65,
      controlsTextStyle: GoogleFonts.manrope(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.black5,
      ),
      lastMonthIcon: _buildIcon(Icons.chevron_left),
      nextMonthIcon: _buildIcon(Icons.chevron_right),
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
      dayBuilder: _buildSelected,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CalendarDatePicker2(
          config: _config,
          value: [_selectedDate],
        ),
        const Gap(15),
        AppButton(
          buttonText: 'Lọc',
          sizeButton: 'large',
          onPressed: () {},
        ),
        const Gap(10),
        AppButton(
          buttonText: 'Làm mới',
          sizeButton: 'large',
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildIcon(IconData icon) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFD0D5DD), width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Icon(icon, size: 16, color: Color(0xFFD0D5DD)),
      ),
    );
  }

  Widget _buildSelected({
    required DateTime date,
    BoxDecoration? decoration,
    bool? isDisabled,
    bool? isSelected,
    bool? isToday,
    TextStyle? textStyle,
  }) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected == true ? AppColors.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(8), // Bo góc nhẹ
      ),
      child: Text(
        '${date.day}',
        style: textStyle ??
            GoogleFonts.manrope(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: isSelected == true ? AppColors.button : AppColors.black5,
            ),
      ),
    );
  }
}
