import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

late List<int?> selectedOptions;
late List<dynamic> questionairre;

extension ColorExtension on String {
  toColor() {
    var hexString = this;
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

Color background_gray = "#F6F6F7".toColor();
Color background_white = "#FFFFFF".toColor();
Color border_gray = "#E3E3E3".toColor();
// Color theme_dark = "#667085".toColor();
Color theme_dark = "#667085".toColor();
Color text_color = "FFFFFF".toColor();

// styles
TextStyle question_style = GoogleFonts.inter(fontSize: 16);
TextStyle option_style = GoogleFonts.inter(fontSize: 14);
TextStyle title_style =
    GoogleFonts.inter(fontSize: 45, color: Colors.grey.shade700);
