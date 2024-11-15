import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  Size get getSize => MediaQuery.of(this).size;
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;

  bool get isDesktop => MediaQuery.of(this).size.width > 1200 && kIsWeb;
  bool get isLeptop => MediaQuery.of(this).size.width > 1000 && MediaQuery.of(this).size.width <= 1200 && kIsWeb;
  bool get isTablet => MediaQuery.of(this).size.width > 820 && MediaQuery.of(this).size.width <= 1000;
  bool get isMobile =>   MediaQuery.of(this).size.width <= 820;

  double get responsiveWidth => isMobile ? width * 0.9 : isTablet ? width * 0.7 : isLeptop ? width * 0.8 : 1200;
  double get responsiveDialogWidth => isMobile ? height * 0.9 : isTablet ? 400 : 400;
  int get gridCount => isMobile ? 2 : isTablet ? 3 : isLeptop ? 4 : 5;
}


extension DateExtension on DateTime {
  String get date => '${this.day.toString().padLeft(2,'0')}-${this.month.toString().padLeft(2,'0')}-${this.year}';
  String get time => "${this.hour}:${this.minute}";
  String get dateTime => "${this.date} ${this.time}";

  DateTime get dateNow => DateTime(this.year, this.month, this.day);


}


extension StringExtension on String {
  String get toFirstUpperCase => "${this[0].toUpperCase()}${this.substring(1)}";
  String get toFirstLowerCase => "${this[0].toLowerCase()}${this.substring(1)}";

  String get date => DateTime.parse(this).date;
  String get dateTime => DateTime.parse(this).dateTime;
}







