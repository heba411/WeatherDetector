import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_app/core/style/colors.dart';

void showToast({required String msg, required ToastStates state})
{
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor:  ToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0
  );
}

enum ToastStates {SUCCESS, ERROR, WARNING}

Color ToastColor(ToastStates state)
{
  Color color;
  switch(state)
  {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;

    case ToastStates.ERROR:
      color = Colors.red;
      break;

    case ToastStates.WARNING:
      color = Colors.yellow;
      break;
  }
  return color;
}

Widget defaultButton({
  double width = double.infinity,
  double height = 55,
  Color color = PRIMARY_COLOR,
  Color txtColor = Colors.white,
  required Function() function,
  required String text,
  bool isElevated = false,
  double radius = 10,
  double fontSize = 18,
}) => Material(
  elevation: (isElevated == false) ? 0 : 5,
  color: color,
  borderRadius: BorderRadius.circular(10),
  child: MaterialButton(onPressed: function,
    height: height,
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      // padding: EdgeInsetsDirectional.symmetric(vertical: 15),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: txtColor,
        ),
      ),
    ),
  ),
);

Widget defaultTextFormField({
  bool isPassword = false,
  bool isEnabled = true,
  Color color = PRIMARY_COLOR,
  required TextEditingController control,
  required IconData prefIcon,
  IconData? suffxIcon,
  void Function()? onPressedSuffix,
  required String label,
  required String? Function(String?)? validate,
  void Function(String?)? onSubmit,
  void Function()? ontap,
  required TextInputType textInputType,

}) => Material(
  elevation: 5, // The elevation level, controlling shadow depth
  shadowColor: Colors.grey.withOpacity(0.9), // Shadow color
  borderRadius: BorderRadius.circular(10),
  child: TextFormField(
    obscureText: isPassword,
    style: TextStyle(color: Colors.black),
    cursorColor: color,
    controller: control,
    keyboardType: textInputType,
    decoration: InputDecoration(
      prefixIcon: Icon(
        prefIcon,
        color: Colors.grey,
      ),
      suffixIcon: IconButton(
        icon: Icon(
          suffxIcon,
          color: Colors.grey,
        ),
        onPressed: onPressedSuffix,),
      labelText: label,
      enabled: isEnabled,
      // contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      labelStyle: TextStyle(
          color: Colors.grey,
          fontSize: 14
      ),
      fillColor: Colors.white,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none, // Remove default border outline
      ),

    ),
    validator: validate,
    onTap: ontap,
    onFieldSubmitted: onSubmit,
  ),
);