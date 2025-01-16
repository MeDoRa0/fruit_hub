import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';

//stateful widget for the password field with a suffix icon to toggle the visibility of the password text field
class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.onSaved,
  });
  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: obsecureText,
      // Save the value of the text field
      onSaved: widget.onSaved,
      hintText: 'كلمة المرور',
      keyboardType: TextInputType.visiblePassword,
      //suffix icon to toggle the visibility of the password text field
      suffixIcon: IconButton(
        onPressed: () {
          //toggle the visibility of the password text field
          obsecureText = !obsecureText;
          //update the state of the widget
          setState(() {});
        },
        icon: Icon(
          //change the icon based on the visibility of the password text field
          obsecureText ? Icons.visibility_off : Icons.visibility,
        ),
      ),
    );
  }
}
