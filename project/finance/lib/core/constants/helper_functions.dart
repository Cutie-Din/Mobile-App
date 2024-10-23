import '../../../import.dart';

import 'package:flutter/material.dart';

/// Helper function to get the screen width
double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

/// Helper function to get the screen height
double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

/// Helper function to determine if the screen is considered small (e.g., mobile)
bool isSmallScreen(BuildContext context) {
  return getScreenWidth(context) < 600;
}

/// Helper function to determine if the screen is considered medium (e.g., tablet)
bool isMediumScreen(BuildContext context) {
  double width = getScreenWidth(context);
  return width >= 600 && width < 1200;
}

/// Helper function to determine if the screen is considered large (e.g., desktop)
bool isLargeScreen(BuildContext context) {
  return getScreenWidth(context) >= 1200;
}

/// Helper function to get responsive padding based on screen size
EdgeInsets getResponsivePadding(BuildContext context) {
  if (isSmallScreen(context)) {
    return const EdgeInsets.all(8.0);
  } else if (isMediumScreen(context)) {
    return const EdgeInsets.all(16.0);
  } else {
    return const EdgeInsets.all(24.0);
  }
}

/// Helper function to get responsive font size based on screen size
double getResponsiveFontSize(BuildContext context,
    {double small = 14.0, double medium = 18.0, double large = 22.0}) {
  if (isSmallScreen(context)) {
    return small;
  } else if (isMediumScreen(context)) {
    return medium;
  } else {
    return large;
  }
}

/// Helper function to get responsive column count for grid layout
int getResponsiveGridColumnCount(BuildContext context) {
  if (isSmallScreen(context)) {
    return 2;
  } else if (isMediumScreen(context)) {
    return 4;
  } else {
    return 6;
  }
}

/// Helper function to scale widgets based on the screen size
double getResponsiveScale(BuildContext context, double scaleFactor) {
  double screenWidth = getScreenWidth(context);
  // Adjust scale factor based on screen width
  return screenWidth / scaleFactor;
}
