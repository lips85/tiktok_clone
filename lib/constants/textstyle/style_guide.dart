import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class StyleGuide {
  // 기본 스타일
  static TextStyle baseStyle() {
    return const TextStyle(
      fontFamily: "Helvetica Neue",
      fontSize: 14.0,
      color: Colors.black,
    );
  }

  // 타이틀 스타일
  static TextStyle titleStyle() {
    return baseStyle().copyWith(
      fontSize: Sizes.size28,
      fontWeight: FontWeight.w800,
    );
  }

  // 서브타이틀 스타일
  static TextStyle subtitleStyle() {
    return baseStyle().copyWith(
      fontSize: Sizes.size20,
      fontWeight: FontWeight.w800,
    );
  }

  // 서브타이틀 스타일
  static TextStyle explainStyle() {
    return baseStyle().copyWith(
      fontSize: 16.0,
      color: Colors.grey[700],
    );
  }

  // 커스텀 스타일 예시
  static TextStyle customStyle(
      Color color, double fontSize, FontWeight fontWeight) {
    return baseStyle().copyWith(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    );
  }

  static TextStyle buttonTextStyle() {
    return baseStyle().copyWith(
      fontSize: 16.0,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
  }
}
