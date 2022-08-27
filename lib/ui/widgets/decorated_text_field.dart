import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:icab/configs/theme.dart';

class DecoratedTextFormField extends StatelessWidget {
  const DecoratedTextFormField({
    Key? key,
    required this.context,
    required this.hintText,
    required this.keyboardType,
    required this.controller,
    this.isPasswordField = false,
    this.validator,
    this.text,
    this.enabledBorder,
    this.filledBorder,
    this.suffixText,
    this.errorMessage,
    this.textDirection,
    this.maxLines = 1,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);
  final BuildContext context;
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? text;
  final InputBorder? enabledBorder;
  final InputBorder? filledBorder;
  final bool isPasswordField;
  final String? suffixText;
  final String? errorMessage;
  final ui.TextDirection? textDirection;
  final int? maxLines;
  final int? maxLength;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      cursorColor: AppColors.secondary,
      keyboardType: keyboardType,
      obscureText: isPasswordField,
      obscuringCharacter: '*',
      maxLines: maxLines,
      maxLength: maxLength,
      style:
          Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        suffixText: suffixText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        counterText: '',
        suffixStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Colors.black),
        hintStyle: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: Theme.of(context).hintColor.withOpacity(0.5)),
        hintText: hintText,
        fillColor: Colors.transparent,
        focusedBorder: filledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                width: 1,
                color: AppColors.secondary,
              ),
            ),
        errorText: errorMessage,
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                width: 1,
                color: Theme.of(context).hintColor.withOpacity(0.2),
              ),
            ),
      ),
    );
  }
}
