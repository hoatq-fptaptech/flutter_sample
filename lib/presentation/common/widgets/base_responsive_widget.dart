import 'package:flutter/material.dart';

class BaseResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const BaseResponsiveWidget({
    required this.mobile,
    this.tablet,
    this.desktop,
    Key? key,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800 &&
      MediaQuery.of(context).size.width < 1100;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  Widget _getCurrentWidget(BuildContext context) {
    if (isMobile(context)) {
      return mobile;
    } else if (isTablet(context)) {
      return tablet ?? mobile;
    } else {
      return desktop ?? mobile;
    }
  }

  @override
  Widget build(BuildContext context) {
    return _getCurrentWidget(context);
  }
}
