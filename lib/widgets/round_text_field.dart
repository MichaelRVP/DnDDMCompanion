import 'package:flutter/material.dart';

class RoundTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final bool? enabled;
  final double? widthInput;
  final Function(String?)? validator;
  final bool obscureText;
  final Function? onFieldSubmitted;
  final FocusNode? focusNode;
  final double? heightInput;
  final int? maxLines;
  final TextAlignVertical? textAlignVertical;
  final TextAlign? textAlign;
  final void Function(String)? onChanged;
  final String? dividerText;

  const RoundTextField({
    this.labelText = "",
    this.controller,
    this.enabled = true,
    this.widthInput,
    this.validator,
    this.obscureText = false,
    this.onFieldSubmitted,
    this.focusNode,
    this.heightInput,
    this.maxLines = 1,
    this.textAlign,
    this.textAlignVertical,
    this.onChanged,
    this.dividerText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthInput,
      height: heightInput,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(40.0),
        ),
        color: Colors.grey.withOpacity(.8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              dividerText ?? '',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Divider(
              color: Colors.white,
              thickness: 2,
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(40.0),
                ),
                color: Colors.blue.withOpacity(.8),
              ),
              child: TextFormField(
                textAlign: textAlign ?? TextAlign.center,
                maxLines: maxLines,
                key: key,
                textAlignVertical:
                    textAlignVertical ?? TextAlignVertical.bottom,
                focusNode: focusNode,
                obscureText: obscureText,
                enabled: enabled,
                decoration: InputDecoration(
                  labelText: labelText,
                  border: InputBorder.none,
                ),
                controller: controller,
                validator: validator as String? Function(String?)?,
                onFieldSubmitted: onFieldSubmitted as void Function(String)?,
                onChanged: onChanged,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
