import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';

void showToast({required String msg}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 2,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

String stringTimeToDateConvert(String date) {
  //String dateandtime convert to "dd-mm-yyyy" this format
  try {
    final DateTime dateFormat = DateTime.parse(date);
    return "${dateFormat.day}-${dateFormat.month}-${dateFormat.year}";
  } catch (e) {
    showToast(msg: "Something Went Wrong");
  }
  return '';
}

const uuid = Uuid();
const sizedBoxH10 = SizedBox(
  height: 10,
);
const sizedBoxH20 = SizedBox(
  height: 20,
);
const sizedBoxH30 = SizedBox(
  height: 30,
);
const sizedBoxW10 = SizedBox(
  width: 10,
);
const sizedBoxW20 = SizedBox(
  width: 20,
);

class BatchYearSelection {
  static String batchID = '';
}

// class AddingStudentAutomatic {
//   static String studentID = '';
//   static String parentID = '';
//   static String parentEmail = '';
//   static String parentName = '';
// }
