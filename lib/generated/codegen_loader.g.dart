// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "appName": "SnowBnB",
  "languageSelection": {
    "title": "Choose the language you\nprefer",
    "arabic": "العربية",
    "english": "English",
    "next": "Next"
  },
  "login": {
    "title": "Welcome back!",
    "subtitle": "Sign in to your account",
    "username": "Email",
    "password": "Password",
    "login": "Login",
    "forgotPassword": "Forgot password?",
    "alreadyHaveAnAccount": "Don't have an account?",
    "signUp": "Sign Up",
    "or": "OR"
  },
  "signup": {
    "title": "Create an account",
    "subtitle": "Let's get started",
    "username": "Email",
    "password": "Password",
    "name": "Name",
    "signup": "Sign Up",
    "alreadyHaveAnAccount": "Already have an account?",
    "login": "Sign In",
    "or": "OR"
  },
  "forgetPassword": {
    "forget": "Forget Password",
    "email": "Email",
    "title": "Forgot Password",
    "subTitle": "Enter your email address. You will receive a link to create a new password via email."
  },
  "addUnit": {
    "title": "Add Unit",
    "subTitle": "Welcome to SnowBnB. Add your first unit to get started.",
    "unitName": "Unit Name",
    "modelId": "Model Id",
    "password": "Password",
    "location": "Location",
    "save": "Save",
    "cancel": "Cancel"
  },
  "mapView": {
    "title": "Address details",
    "confirm": "Confirm location",
    "position": "My Position"
  },
  "addReservation": {
    "title": "Add Reservation",
    "subTitle": "didn't make any reservation, let's make one!",
    "name": "Name",
    "email": "Email",
    "phone": "Phone",
    "skip": "Skip",
    "date": "Date",
    "save": "Save",
    "cancel": "Cancel"
  },
  "drawer": {
    "profile": "Profile",
    "deleteAccount": "Delete Account",
    "addUnit": "Add Unit",
    "rateApp": "Rate App",
    "reservations": "Reservations",
    "settings": "Settings",
    "logout": "Logout"
  },
  "logout": {
    "title": "Logout",
    "subTitle": "Are you sure you want to logout?",
    "cancel": "Cancel",
    "logout": "Logout"
  },
  "settings": {
    "title": "Settings",
    "deleteAccountTitle": "Delete Account",
    "deleteAccountSubTitle": "Are you sure you want to delete your account?",
    "delete": "Delete",
    "cancel": "Cancel"
  },
  "profile": {
    "title": "Profile",
    "name": "Name",
    "email": "Email",
    "save": "Save",
    "cancel": "Cancel"
  },
  "deleteReservation": {
    "title": "Delete Reservation",
    "subTitle": "Are you sure you want to delete this reservation?",
    "cancel": "Cancel",
    "delete": "Delete"
  },
  "deleteUnit": {
    "title": "Delete Unit",
    "subTitle": "Are you sure you want to delete this unit?",
    "cancel": "Cancel",
    "delete": "Delete"
  },
  "units": {
    "welcome": "Welcome,",
    "deleteUnit": "Delete Unit",
    "unitId": "Unit Id: ",
    "degree": "°C",
    "fahrenheit": "°F",
    "reservations": "Reservations",
    "humidity": "Humidity",
    "pressure": "Pressure",
    "temp": "Temperature",
    "wind": "Wind",
    "wetBulbTemp": "°F WB",
    "addReservation": "Add Reservation",
    "editReservation": "Edit Reservation",
    "swingController": "Swing Controller",
    "on": "On",
    "off": "Off",
    "connect": "Connect",
    "lastUpdated": "Last Updated: "
  }
};
static const Map<String,dynamic> ar = {
  "appName": "SnowBnB",
  "languageSelection": {
    "title": "أختر اللغة التي تفضلها",
    "arabic": "العربية",
    "english": "English",
    "next": "التالي"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ar": ar};
}
