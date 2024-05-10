import 'package:chat_gpt/core/static/app_styles.dart';
import 'package:chat_gpt/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.keyboardType,
    this.hint,
    this.prefixIC,
    this.suffixIC,
    this.title,
    this.obscureText = false,
    this.validator,
    this.onChanged,
    this.large = false,
    this.readonly = false,
    this.onTap,
    this.backgroundColor,
    this.isBordered,
  });

  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? hint;
  final Widget? prefixIC;
  final Color? backgroundColor;
  final Widget? suffixIC;
  final bool? isBordered;
  final String? title;
  final bool obscureText;
  final bool large;
  final bool readonly;
  final void Function()? onTap;
  final String? Function(String? text)? validator;
  final void Function(String text)? onChanged;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late FocusNode _focusNode;
  final bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  // void _onFocusChange() {
  //   // setState(() {
  //   _isFocused = _focusNode.hasFocus;
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _isFocused
          ? BoxDecoration(
              border: Border.all(
                color: AppColors.grey5D,
                width: 5,
              ),
              borderRadius: BorderRadius.circular(13))
          : null,
      height: widget.large ? 100.h : 52.r,
      child: TextFormField(
        focusNode: _focusNode,
        // autofocus: true,

        readOnly: widget.readonly,
        style: AppStyles.semiBold15white.copyWith(fontSize: 16.r),

        showCursor: !widget.readonly,
        onTap: widget.onTap,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: Theme.of(context).colorScheme.primary,
        autocorrect: true,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        minLines: widget.large ? 5 : 1,
        maxLines: widget.large ? 5 : 1,
        // onTapOutside: (event) => FocusScope.of(context).unfocus(),
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: (widget.isBordered ?? true)
                      ? AppColors.white.withOpacity(0.8)
                      : Colors.transparent),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              )),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: (widget.isBordered ?? true)
                    ? AppColors.white.withOpacity(0.32)
                    : Colors.transparent),
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          filled: true,

          fillColor: AppColors.white.withOpacity(0.1),
          border: OutlineInputBorder(
            borderSide: BorderSide(
                color: (widget.isBordered ?? true)
                    ? Colors.transparent
                    : AppColors.white.withOpacity(0.8)),
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),

          errorStyle: const TextStyle(
            height: 0.05,
            fontSize: 15,
          ),
          errorMaxLines: 2,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 19, horizontal: 13),

          hintMaxLines: widget.large ? 5 : 1,
          hintStyle: TextStyle(color: Colors.grey[300], fontSize: 14),
          prefixIcon: widget.prefixIC != null
              ? widget.large
                  ? Padding(
                      padding: const EdgeInsets.all(8),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: widget.prefixIC,
                      ),
                    )
                  : widget.prefixIC
              : null,

          prefixIconConstraints: widget.large
              ? const BoxConstraints(
                  maxWidth: 48,
                  minWidth: 48,
                  maxHeight: double.infinity,
                  minHeight: 100,
                )
              : null,
          suffixIconConstraints: widget.large
              ? const BoxConstraints(
                  maxWidth: 36,
                  minWidth: 36,
                  maxHeight: double.infinity,
                  minHeight: 100,
                )
              : null,

          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8, top: 3, bottom: 3),
            child: widget.suffixIC,
          ),
          // suffixIconColor: AppColors.grey4A,
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
