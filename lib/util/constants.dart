import 'package:flutter/material.dart';

const Color kLoginButtonColor = Colors.grey;
const Color kRegisterButtonColor = Colors.deepOrangeAccent;
const Color kContinueButtonColor = Colors.brown;
const Color kRedButtonColor = Color(0xFFFF3333);
const Color kTabSliderColorLeft = Color(0xCC6655FF);
const Color kProductBoxColor = Color(0x88FFFDE3);
const Color kNavShadowColor = Color(0x88000000);

const double kRadius = 24.0;
const double kNavBarHeight = 60;

const InputDecoration kLoginTextFieldDecoration = InputDecoration(
  hintText: 'Enter a Value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(kRadius)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kLoginButtonColor, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(kRadius)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kLoginButtonColor, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(kRadius)),
  ),
);

const InputDecoration kResetTextFieldDecoration = InputDecoration(
  hintText: 'Enter a Value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(kRadius)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kRedButtonColor, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(kRadius)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kRedButtonColor, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(kRadius)),
  ),
);

const InputDecoration kRegisterTextFieldDecoration = InputDecoration(
  hintText: 'Enter a Value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(kRadius)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kRegisterButtonColor, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(kRadius)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kRegisterButtonColor, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(kRadius)),
  ),
);

const kAnimatedTextStyle = TextStyle(
  letterSpacing: 1,
  color: Colors.white,
  fontSize: 24.0,
  fontWeight: FontWeight.w900,
  fontFamily: "Rodin",
);

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

// Error Messages
const kEmailAlreadyExists = "ERROR_EMAIL_ALREADY_IN_USE";
const kPasswordTooShort = "ERROR_WEAK_PASSWORD";
const kInvalidEmail = "ERROR_INVALID_EMAIL";
const kWrongEmail = "ERROR_USER_NOT_FOUND";
const kWrongPass = "ERROR_WRONG_PASSWORD";

const kNavBarButtonShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(kRadius),
  ),
);

const Duration kAnimationDuration = Duration(milliseconds: 500);
const Duration kErrorAnimationDuration = Duration(milliseconds: 200);
