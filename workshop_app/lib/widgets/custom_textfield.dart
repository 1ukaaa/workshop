import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final bool password;
  final Function(String) onChanged;
  const CustomTextFormField(
      {required this.hintText,
      this.password = false,
      required this.onChanged,
      Key? key})
      : super(key: key);

  @override
  State<CustomTextFormField> createState() => CustomTextFormFieldState();
}

class CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isSecret = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        suffixIcon: widget.password
            ? InkWell(
                onTap: () => setState(() {
                  isSecret = !isSecret;
                }),
                child: Icon(
                  !isSecret
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: Colors.black,
                ),
              )
            : null,
        filled: true,
        fillColor: Colors.black.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.orange),
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.black),
      ),
      obscureText: widget.password ? isSecret : false,
    );
  }
}
