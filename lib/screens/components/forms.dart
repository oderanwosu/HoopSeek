import 'package:flutter/material.dart';
import 'package:hoop_seek/utils/size_helpers.dart';
import 'package:hoop_seek/utils/themes.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String? Function(String?)? validator;
  final bool isObscureText;
  final void Function(String)? onChanged;
  final String hintText;

  CustomTextField(
      {this.label = '',
      required this.validator,
      required this.onChanged,
      this.isObscureText = false,
      this.hintText = ''});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    final SizeHelper sizer = SizeHelper(context);
    return Column(children: [
      Align(
          alignment: Alignment.topLeft,
          child: Text(widget.label.toUpperCase())),
      SizedBox(
        height: sizer.sy(.01),
      ),
      Container(
        decoration: BoxDecoration(
          color: BrandTheme.colorPrimaryLight,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: TextFormField(
          onChanged: widget.onChanged,
          obscureText: widget.isObscureText,
          decoration: new InputDecoration(
            hintText: widget.hintText,
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(8.0),
              borderSide: new BorderSide(),
            ),
          ),
          validator: widget.validator,
          keyboardType: TextInputType.emailAddress,
          style: new TextStyle(
            fontFamily: "Poppins",
          ),
        ),
      ),
    ]);
  }
}

class CustomButton extends StatefulWidget {
  final void Function()? onPressed;
  final String label;
  const CustomButton({required this.onPressed, required this.label});

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    final SizeHelper sizer = SizeHelper(context);
    return Container(
        width: double.infinity,
        height: sizer.sy(.06),
        decoration: BoxDecoration(
          color: BrandTheme.colorPrimary,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: TextButton(
            onPressed: widget.onPressed,
            child: Align(
              alignment: Alignment.center,
              child: Text(widget.label.toUpperCase(),
                  style: TextStyle(color: Colors.white)),
            )));
  }
}
