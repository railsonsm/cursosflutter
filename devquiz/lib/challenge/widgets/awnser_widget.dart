import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'package:devquiz/core/app_colors.dart';

class Awnser extends StatelessWidget {
  final String title;
  final bool isRight;
  final bool isSelected;
  const Awnser({
    Key? key,
    required this.title,
    this.isRight = false,
    this.isSelected = false,
  }) : super(key: key);

  Color get _selectedColorRight =>
      isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight =>
      isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: isSelected ? _selectedColorCardRight : AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.fromBorderSide(BorderSide(
              color: isSelected ? _selectedBorderRight : AppColors.border,
            ))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style:
                    isSelected ? _selectedTextStyleRight : AppTextStyles.body,
              ),
            ),
            SizedBox(width: 16),
            Container(
              height: 25,
              width: 24,
              child: isSelected
                  ? Icon(
                      isSelected ? _selectedIconRight : Icons.check,
                      size: 16,
                      color: Colors.white,
                    )
                  : null,
              decoration: BoxDecoration(
                color: isSelected ? _selectedColorRight : AppColors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.fromBorderSide(
                  BorderSide(
                    color: isSelected ? _selectedBorderRight : AppColors.border,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
