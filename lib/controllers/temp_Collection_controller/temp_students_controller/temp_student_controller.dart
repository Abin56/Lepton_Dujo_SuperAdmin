import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_super_admin/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TempStudentController extends GetxController {
  RxString batchYear = ''.obs;
  RxString classID = ''.obs;

  final firebase =
      FirebaseFirestore.instance.collection('SchoolListCollection');
  updatePhoneNumber(
      {required context,
      required schoolID,
      required batchyear,
      required classId,
      required studentDocID}) async {
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
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Ok'),
              onPressed: () async {
                await firebase
                    .doc(schoolID)
                    .collection(batchyear)
                    .doc(batchyear)
                    .collection('classes')
                    .doc(classId)
                    .collection('TempStudents')
                    .doc(studentDocID)
                    .update({
                  'parentPhoneNumber': updatevalue.text.trim()
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
      required batchyear,
      required classId,
      required studentDocID}) async {
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
                      const InputDecoration(hintText: 'Enter AdmissionNumber'),
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Ok'),
              onPressed: () async {
                await firebase
                    .doc(schoolID)
                    .collection(batchyear)
                    .doc(batchyear)
                    .collection('classes')
                    .doc(classId)
                    .collection('TempStudents')
                    .doc(studentDocID)
                    .update({'admissionNumber': updatevalue.text.trim()}).then(
                        (value) {
                  showToast(msg: 'AdmissionNumber Updated');
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
      required batchyear,
      required classId,
      required studentDocID}) async {
    TextEditingController updatevalue = TextEditingController();
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update studentName'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextFormField(
                  controller: updatevalue,
                  decoration:
                      const InputDecoration(hintText: 'Enter studentName'),
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Ok'),
              onPressed: () async {
                await firebase
                    .doc(schoolID)
                    .collection(batchyear)
                    .doc(batchyear)
                    .collection('classes')
                    .doc(classId)
                    .collection('TempStudents')
                    .doc(studentDocID)
                    .update({'studentName': updatevalue.text.trim()}).then(
                        (value) {
                  showToast(msg: 'studentName Updated');
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
      required batchyear,
      required classId,
      required studentDocID}) {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[Text('Are you shure to delete StudentData ?')],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Ok'),
              onPressed: () async {
                await firebase
                    .doc(schoolID)
                    .collection(batchyear)
                    .doc(batchyear)
                    .collection('classes')
                    .doc(classId)
                    .collection('TempStudents')
                    .doc(studentDocID)
                    .delete()
                    .then((value) {
                  showToast(msg: 'Removed Student');
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
