import 'package:flutter/material.dart';
import 'package:login/core/viewmodels/home_model.dart';
import 'package:login/ui/shared/globals.dart';
import 'package:provider/provider.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData prefixIconData;
  final IconData? suffixIconData;
  final bool obscureText;
  final Function(String)? onChanged;

  TextFieldWidget({
    required this.hintText,
    required this.prefixIconData,
    this.suffixIconData,
    required this.obscureText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeModel>(context);

    return TextField(

      onChanged: onChanged,
      obscureText: obscureText,
      style: TextStyle(
        color: Global.mediumBlue,
        fontSize: 16.0,
      ),
      cursorColor: Global.mediumBlue,
      decoration: InputDecoration(
        labelText: hintText,
        contentPadding: EdgeInsets.all(5.0),
        prefixIcon: Icon(
          prefixIconData,
          size: 18.0,
          color: Global.mediumBlue,
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Global.mediumBlue)
        ),
        suffixIcon: GestureDetector(
          onTap: (){
            model.isVisible = !model.isVisible;
          },
          child: Icon(
            suffixIconData,
            size: 18.0,
            color: Global.mediumBlue,
          ),
        ),
        labelStyle: TextStyle(
          color: Global.mediumBlue,
          fontSize: 18.0,
        ),
        focusColor: Global.mediumBlue,
      ),
    );
  }
}
