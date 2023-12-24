import 'package:flutter/material.dart';

extension PaddingWidgte on Widget {
  Widget paddingAll(double padding) => Padding(
        padding: EdgeInsets.all(padding),
        child: this,
      );

  Widget toButton(
    Function()? onPressed,
  ) {
    return Center(
      child: GestureDetector(
        onTap: onPressed,
        child: this,
      ),
    );
  }

  //to eleveedButton
  Widget toElevatedButton(
    Function()? onPressed,
    Color? color,
    Color? textColor,
    double? elevation,
    double? borderRadius,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: textColor,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
      ),
      child: this,
    );
  }

  Widget paddingSymmetric({double horizontal = 0.0, double vertical = 0.0}) =>
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: this,
      );

  Widget paddingOnly(
          {double left = 0.0,
          double right = 0.0,
          double top = 0.0,
          double bottom = 0.0}) =>
      Padding(
        padding:
            EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
        child: this,
      );

  Widget paddingFromLTRB(
          {double left = 0.0,
          double right = 0.0,
          double top = 0.0,
          double bottom = 0.0}) =>
      Padding(
        padding: EdgeInsets.fromLTRB(left, top, right, bottom),
        child: this,
      );
  //margin
  Widget marginAll(double margin) => Container(
        margin: EdgeInsets.all(margin),
        child: this,
      );

  Widget marginSymmetric({double horizontal = 0.0, double vertical = 0.0}) =>
      Container(
        margin:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: this,
      );

  Widget marginOnly(
          {double left = 0.0,
          double right = 0.0,
          double top = 0.0,
          double bottom = 0.0}) =>
      Container(
        margin:
            EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
        child: this,
      );

  Widget marginFromLTRB(
          {double left = 0.0,
          double right = 0.0,
          double top = 0.0,
          double bottom = 0.0}) =>
      Container(
        margin: EdgeInsets.fromLTRB(left, top, right, bottom),
        child: this,
      );

  //to SizedBox

  SizedBox toheightSizedBox(double value) => SizedBox(
        height: value,
        child: this,
      );
  SizedBox towidthSizedBox(double value) => SizedBox(
        width: value,
        child: this,
      );
  SizedBox toSizedBox({double height = 0.0, double width = 0.0}) => SizedBox(
        height: height,
        width: width,
        child: this,
      );
}

//extension statelessWidget on Widget {

//lottie

