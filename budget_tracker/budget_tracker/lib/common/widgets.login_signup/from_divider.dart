import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/text_strings.dart';

extension StringExtension on String {
  String get capitalize {
    if (this.isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1);
  }
}

class AppFormDivider extends StatelessWidget {
  const AppFormDivider({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Divider(
            color: dark ? AppColors.darkGrey : AppColors.grey,
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(
          AppTexts.orSignInWith.capitalize,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            color: dark ? AppColors.darkGrey : AppColors.grey,
            thickness: 0.5,
            indent: 5,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}
