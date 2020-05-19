import 'package:flutter/material.dart';

import 'package:pick_n_go/src/widgets/common/custom_flat_button.dart';

class SignInButton extends CustomFlatButton {
  SignInButton({
    @required String text,
    Color color,
    Color disabledColor,
    Color textColor,
    VoidCallback onPressed,
  })  : assert(text != null),
        super(
            child: Text(
              text,
              style: TextStyle(color: textColor),
            ),
            color: color,
            disabledColor: disabledColor,
            onPressed: onPressed);
}
