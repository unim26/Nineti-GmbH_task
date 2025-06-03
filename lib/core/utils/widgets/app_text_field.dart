import 'package:flutter/material.dart';
import 'package:task/core/App_Style/app_text_style.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.minLines,
    this.maxLines,
    this.controller,
    this.onChanged,
    this.prefixIcon,
    this.labelText,
    this.onFieldSubmitted,
    this.hintText, this.validator,
  });

  //variables
  final int? minLines;
  final int? maxLines;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final IconData? prefixIcon;
  final String? labelText;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: minLines,
      maxLines:maxLines ,
      validator: validator,
      controller: controller,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: Icon(prefixIcon),
        labelText: labelText,
        labelStyle: AppTextStyle.infoTextStyle(context),
        hintStyle: AppTextStyle.infoTextStyle(context),
        hintText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
    );
  }
}
