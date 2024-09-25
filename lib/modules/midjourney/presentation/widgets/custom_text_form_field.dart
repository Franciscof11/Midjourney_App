import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final Widget? sufixIcon;
  final bool? isEmail;
  final TextEditingController? controller;
  final bool isSearch;
  const CustomTextFormField({
    super.key,
    required this.label,
    this.sufixIcon,
    this.controller,
    this.isEmail = false,
    this.isSearch = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: null,
      controller: widget.controller,
      style: GoogleFonts.raleway(
        fontSize: 16,
        color: Colors.black87,
        fontWeight: FontWeight.w500,
      ),
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Campo Obrigatório!';
        }
        if (widget.isEmail == true) {
          if (!widget.controller!.text.contains('@') || !widget.controller!.text.contains('.com')) {
            return 'Email inválido!';
          }
        }
        return null;
      },
      cursorColor: Colors.grey,
      cursorErrorColor: Colors.grey,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 23, horizontal: 15),
        suffixIconColor: Colors.grey[500],
        labelStyle: GoogleFonts.raleway(
          fontSize: 16,
          color: Colors.grey[700],
          fontWeight: FontWeight.w600,
        ),
        errorStyle: GoogleFonts.raleway(
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.grey[200],
        filled: false,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide.none,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide.none,
        ),
        labelText: widget.label,
        suffixIcon: widget.sufixIcon,
        suffixIconConstraints: const BoxConstraints(minWidth: 70),
      ),
    );
  }
}
