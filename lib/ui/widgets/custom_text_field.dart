import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatefulWidget {
  final String? prefixIcon;
  final String hint;
  final bool isPassword;
  final int minLines;

  const CustomTextField(
      {super.key,
      this.prefixIcon,
      required this.hint,
      this.minLines = 1,
      this.isPassword = false});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: widget.minLines,
      maxLines: widget.minLines + 1,
      decoration: InputDecoration(
          hintText: widget.hint,
          prefixIcon: widget.prefixIcon != null
              ? Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: SvgPicture.asset(widget.prefixIcon!))
              : null,
          suffixIcon: widget.isPassword ? InkWell(
              onTap: (){
                obscureText = !obscureText;
                setState(() {});
              },
              child: Icon(obscureText ? Icons.remove_red_eye: Icons.visibility_off)) : null),
      obscureText: widget.isPassword ? obscureText : false,
    );
  }
}
