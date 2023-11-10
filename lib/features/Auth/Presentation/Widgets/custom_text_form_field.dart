import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.formValidate,
    required this.unHideObscureIcon,
    required this.hideText, required this.textEditingController, required this.textInputAction,
  });

  final String hintText;
  final String? Function(String?) formValidate;
  final bool unHideObscureIcon;
  final bool hideText;
  final TextEditingController textEditingController;
  final TextInputAction textInputAction;



  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _hideText = false;
  @override
  void dispose() {
    widget.textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 22.0.w, right: 22.0, bottom: 12.0),
      child: TextFormField(
        inputFormatters: [
          FilteringTextInputFormatter.deny(RegExp(r"[ ]")),

        ],
        textInputAction: widget.textInputAction,
        controller: widget.textEditingController,
        onTapOutside: (event) =>
            FocusManager.instance.primaryFocus!.unfocus(),
        decoration: InputDecoration(
            labelStyle: GoogleFonts.urbanist(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: const Color(0xff8391A1),
            ),
            hintText: widget.hintText,
            hintStyle: GoogleFonts.urbanist(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: const Color(0xff8391A1),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: Color(0xffE8ECF4),
              ),
            ),
            fillColor: Theme.of(context).brightness==Brightness.dark? const Color(0xff211F30):const Color(0xffffffff),
            filled: true,
            errorMaxLines: 2,
            errorStyle: const TextStyle(fontSize: 16,overflow: TextOverflow.ellipsis),
            suffixIcon: Visibility(
              visible: widget.unHideObscureIcon,
              child: IconButton(
                icon: const ImageIcon(
                  AssetImage("assets/images/obscure_text_icon.png"),
                ),
                onPressed: () {
                  setState(() {
                    if (widget.hideText == true) {
                      _hideText = !_hideText;
                    }
                  });
                },
              ),
            )),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: widget.hideText ? !_hideText : _hideText,
        validator: widget.formValidate,

      ),
    );
  }
}
