import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

customNunitoFont({
  double fontHeight,
  double fontSize,
  FontWeight fontWeight = FontWeight.normal,
  Color fontColor
}) => GoogleFonts.nunitoSans(
    textStyle: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: fontColor,
        height: fontHeight
    )
);