import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_super_admin/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TempGuardianController extends GetxController {
  RxString batchYear = ''.obs;
  RxString classID = ''.obs;

  final firebase =
      FirebaseFirestore.instance.collection('SchoolListCollection');
  updatePhoneNumber(
      {required context,
      required schoolID,
      required batchyear,
      required classId,
      required parentDocID}) async {
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
                    .collection(batchyear)
                    .doc(batchyear)
                    .collection('classes')
                    .doc(classId)
                    .collection('Temp_GuardianCollection')
                    .doc(parentDocID)
                    .update({
                  'guardianPhoneNumber': updatevalue.text.trim()
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

  updateName(
      {required context,
      required schoolID,
      required batchyear,
      required classId,
      required parentDocID}) async {
    TextEditingController updatevalue = TextEditingController();
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update GuardianName'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextFormField(
                  controller: updatevalue,
                  decoration:
                      const InputDecoration(hintText: 'Enter GuardianName'),
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
                    .collection(batchyear)
                    .doc(batchyear)
                    .collection('classes')
                    .doc(classId)
                    .collection('Temp_GuardianCollection')
                    .doc(parentDocID)
                    .update({'guardianName': updatevalue.text.trim()}).then(
                        (value) {
                  showToast(msg: 'GuardianName Updated');
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
      required parentDocID}) {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are you shure to delete GuardianData ?')
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
                    .collection(batchyear)
                    .doc(batchyear)
                    .collection('classes')
                    .doc(classId)
                    .collection('Temp_GuardianCollection')
                    .doc(parentDocID)
                    .delete()
                    .then((value) {
                  showToast(msg: 'Removed Guardian');
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
