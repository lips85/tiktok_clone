import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class CommonButton extends StatelessWidget {
  final bool validate, textChange, colorChange;
  final int? falseWidthFactor, trueWidthFactor;
  final String? text;
  final Color? changeColor;
  final VoidCallback? onPressed;

  const CommonButton({
    super.key,
    required this.textChange,
    required this.validate,
    required this.colorChange,
    this.falseWidthFactor,
    this.trueWidthFactor,
    this.text,
    this.changeColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: validate ? (falseWidthFactor ?? 1) : (trueWidthFactor ?? 1),
          child: AnimatedContainer(
            alignment: Alignment.center,
            duration: const Duration(milliseconds: 300),
            height: Sizes.size48,
            decoration: BoxDecoration(
              color: validate
                  ? (colorChange ? Colors.black : (changeColor ?? Colors.black))
                  : Colors.grey[500],
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(Sizes.size40),
            ),
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              style: TextStyle(
                fontSize: Sizes.size16,
                fontFamily: "Helvetica Neue medium",
                fontWeight: FontWeight.w800,
                color: validate ? Colors.black : Colors.white,
              ),
              child: TextButton(
                onPressed: validate ? onPressed : null,
                child: Text(
                  textChange ? "Next" : (text ?? "Next"),
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Helvetica Neue medium",
                    fontWeight: FontWeight.w800,
                    color: validate ? Colors.white : Colors.grey[300],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
