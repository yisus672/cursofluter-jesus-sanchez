import 'package:flutter/material.dart';


const Color _customColor = Color(0xFF6750A4);

const List<Color> _colorThemes
  = [
    _customColor,
    Color(0xFF6750A4),
    Color(0xFFB00020),
    Color(0xFF03DAC6),
    Color(0xFF018786),
    Color(0xFF6200EE),
    Color(0xFF3700B3),
    Color(0xFF03DAC5),
    Color(0xFFBB86FC),
  ];
class AppTheme {
 final int selectedColor;

 AppTheme({
this.selectedColor = 0,
  }) : assert(
selectedColor >= 0 && selectedColor <= _colorThemes.length, 
'Colors must be between 0 and ${ _colorThemes.length - 1}'
);

  ThemeData themeData() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
    );
  }

}