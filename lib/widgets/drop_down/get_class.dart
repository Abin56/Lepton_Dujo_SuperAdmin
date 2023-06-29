import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_super_admin/controllers/temp_Collection_controller/temp_students_controller/temp_student_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/add_student_firebase/add_student_toFirebase_controller.dart';
import '../../controllers/temp_Collection_controller/temp_gurdian_cotroller/temp_guardian_controller.dart';
import '../../controllers/temp_Collection_controller/temp_parent_controller/temp_parent_controller.dart';

var classesListValue;

class GetClassesListDropDownButton extends StatefulWidget {
  TempStudentController tempStudentController =
      Get.put(TempStudentController());
  TempGuardianController tempGuardianController =
      Get.put(TempGuardianController());
  AddStudentToFirebaseController addStudentToFirebase =
      Get.put(AddStudentToFirebaseController());
  TempParentController tempParentController = Get.put(TempParentController());
  String schoolID;
  String batchyearID;
  GetClassesListDropDownButton(
      {Key? key, required this.schoolID, required this.batchyearID})
      : super(key: key);

  @override
  State<GetClassesListDropDownButton> createState() =>
      _GeClasseslListDropDownButtonState();
}

class _GeClasseslListDropDownButtonState
    extends State<GetClassesListDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return dropDownButton();
  }

  StreamBuilder<QuerySnapshot<Map<String, dynamic>>> dropDownButton() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("SchoolListCollection")
            .doc(widget.schoolID)
            .collection(widget.batchyearID)
            .doc(widget.batchyearID)
            .collection("classes")
            .snapshots(),
        // .where('classIncharge', isEqualTo: widget.teacherID)
        // .get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return DropdownButtonFormField(
              hint: classesListValue == null
                  ? const Text(
                      "Select Class",
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
                    )
                  : Text(classesListValue!["className"]),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
              ),
              items: snapshot.data!.docs.map(
                (val) {
                  return DropdownMenuItem(
                    value: val["className"],
                    child: Text(val["className"]),
                  );
                },
              ).toList(),
              onChanged: (val) {
                var categoryIDObject = snapshot.data!.docs
                    .where((element) => element["className"] == val)
                    .toList()
                    .first;
                log(categoryIDObject["className"]);

                setState(
                  () {
                    widget.tempStudentController.classID.value =
                        categoryIDObject['docid'];

                    widget.tempParentController.classID.value =
                        categoryIDObject['docid'];

                    widget.tempGuardianController.classID.value =
                        categoryIDObject['docid'];

                    widget.addStudentToFirebase.classID.value =
                        categoryIDObject['docid'];

                    classesListValue = categoryIDObject;
                  },
                );
              },
            );
          }
          return const SizedBox(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
