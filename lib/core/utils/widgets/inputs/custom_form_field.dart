import 'package:chat_gpt/core/static/app_styles.dart';
import 'package:chat_gpt/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: large ? 100.h : 50.h,
          child: TextFormField(
            readOnly: readonly,
            style: AppStyles.semiBold15white.copyWith(fontSize: 16.sp),

            showCursor: !readonly,
            onTap: onTap,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            cursorColor: Theme.of(context).colorScheme.primary,
            autocorrect: true,
            keyboardType: keyboardType,
            controller: controller,
            minLines: large ? 5 : 1,
            maxLines: large ? 5 : 1,
            // onTapOutside: (event) => FocusScope.of(context).unfocus(),
            obscureText: obscureText,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: (isBordered ?? true)
                        ? AppColors.white
                        : Colors.transparent),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              filled: true,

              fillColor: AppColors.white.withOpacity(0.1),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: (isBordered ?? true)
                        ? Colors.transparent
                        : AppColors.primary),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),

              errorStyle: const TextStyle(
                height: 0.05,
                fontSize: 15,
              ),
              errorMaxLines: 2,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 19, horizontal: 13),

              hintMaxLines: large ? 5 : 1,
              hintStyle: TextStyle(color: Colors.grey[300], fontSize: 14),
              prefixIcon: prefixIC != null
                  ? large
                      ? Padding(
                          padding: const EdgeInsets.all(8),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: prefixIC,
                          ),
                        )
                      : prefixIC
                  : null,
              prefixIconConstraints: large
                  ? const BoxConstraints(
                      maxWidth: 48,
                      minWidth: 48,
                      maxHeight: double.infinity,
                      minHeight: 100,
                    )
                  : null,

              // suffixIcon: suffixIC,
              // suffixIconColor: AppColors.grey4A,
            ),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
