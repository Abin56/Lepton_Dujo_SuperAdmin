import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_super_admin/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TempTeacherController extends GetxController {


  final firebase =
      FirebaseFirestore.instance.collection('SchoolListCollection');
  updatePhoneNumber(
      {required context,
      required schoolID,
      required teacherDocID}) async {
    TextEditingController updatevalue = TextEditingController();
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update PhoneNumber'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextFormField(
                  controller: updatevalue,
                  decoration:
                      const InputDecoration(hintText: 'Enter Phone Number'),
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('ok'),
              onPressed: () async {
                await firebase
                    .doc(schoolID)
                    .collection('TempTeacherList')
                    .doc(teacherDocID)
                    .update({
                  'teacherPhNo': updatevalue.text.trim()
                }).then((value) {
                  showToast(msg: 'Phone Number Updated');
                  Navigator.pop(context);
                });
              },
            ),
          ],
        );
      },
    );
  }

  updateAdmissionNumber(
      {required context,
      required schoolID,
      required teacherDocID}) async {
    TextEditingController updatevalue = TextEditingController();
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update AdmissionNumber'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextFormField(
                  controller: updatevalue,
                  decoration:
                      const InputDecoration(hintText: 'Enter Employee'),
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('ok'),
              onPressed: () async {
                await firebase
                    .doc(schoolID)
                    .collection('TempTeacherList')
                    .doc(teacherDocID)
                    .update({'employeeID': updatevalue.text.trim()}).then(
                        (value) {
                  showToast(msg: 'EmployeID Updated');
                  Navigator.pop(context);
                });
              },
            ),
          ],
        );
      },
    );
  }

  updateName(
      {required context,
      required schoolID,
      required teacherDocID}) async {
    TextEditingController updatevalue = TextEditingController();
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update TeacherName'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextFormField(
                  controller: updatevalue,
                  decoration:
                      const InputDecoration(hintText: 'Enter TeacherName'),
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('ok'),
              onPressed: () async {
                await firebase
                    .doc(schoolID)
                    .collection('TempTeacherList')
                    .doc(teacherDocID)
                    .update({'teacherName': updatevalue.text.trim()}).then(
                        (value) {
                  showToast(msg: 'TeacherName Updated');
                  Navigator.pop(context);
                });
              },
            ),
          ],
        );
      },
    );
  }

  removeStudent(
      {required context,
      required schoolID,
      required teacherDocID}) {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are you shure to delete TeacherData ?')
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('ok'),
              onPressed: () async {
                await firebase
                    .doc(schoolID)
                    .collection('TempTeacherList')
                    .doc(teacherDocID)
                    .delete()
                    .then((value) {
                  showToast(msg: 'Removed Teacher');
                  Navigator.pop(context);
                });
              },
            ),
          ],
        );
      },
    );
  }
}
