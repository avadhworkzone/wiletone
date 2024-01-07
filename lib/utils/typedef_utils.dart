import 'package:flutter/material.dart';

typedef OnTap = void Function();
typedef OnChangeBool = void Function(bool value);
typedef OnChangeDouble = void Function(double value);
typedef OnChangeInt = void Function(int value);
typedef OnChangeString = void Function(String value);
typedef OnSubmit = void Function(String value);
typedef OnSelectedString = void Function(String value);
typedef OnChangeDateTime = void Function(DateTime value);
typedef OnPopUpTap = void Function(int val);
typedef OnFavTap = void Function(int val);
typedef PopUpItemBuilder = void Function(BuildContext context);
