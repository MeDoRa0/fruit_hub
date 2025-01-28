import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/utils/assets.dart';
import 'package:fruit_hub/core/utils/text_styles.dart';

class SearchTextField extends StatelessWidget {
  //final TextEditingController controller;

  //final ValueChanged<String>? onChanged;

  const SearchTextField({
    super.key,
    //required this.controller,
    // this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            offset: Offset(0, 2),
            blurRadius: 9,
          ),
        ],
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        //controller: controller,
        decoration: InputDecoration(
          hintText: 'إبحث عن.....',
          hintStyle: AppTextStyle.font13w400.copyWith(
            color: Color(0xFF949D9E),
          ),
          prefixIcon: SizedBox(
            width: 20,
            child: Center(
              child: SvgPicture.asset(
                Assets.iconsSearchIcon,
              ),
            ),
          ),
          suffixIcon: SizedBox(
            width: 20,
            child: Center(
              child: SvgPicture.asset(
                Assets.iconsSearchFilter,
              ),
            ),
          ),
          border: buildBorder(),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
        ),
        //  onChanged: onChanged,
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        width: 1,
        color: Color(0xFFE6E9E9),
      ),
    );
  }
}
