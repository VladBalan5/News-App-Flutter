import 'package:flutter/material.dart';
import 'package:get/get.dart';

const kBlueTheme = Color(0xFF0E68C3);
const kGreenTheme = Color(0xFF84C30E);
const kOrangeTheme = Color(0xFFC3540E);
const kPurpleTheme = Color(0xFF6D3FB7);
const kWhite = Color(0xFFFFFFFF);
const kBlack = Color(0xFF000000);

var customPrimaryColor = kBlueTheme.obs;
var customSecondaryColor = kBlueTheme.withOpacity(0.25).obs;
var customWhite = kWhite.obs;
var customBlack = kBlack.obs;
