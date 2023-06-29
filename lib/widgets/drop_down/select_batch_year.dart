import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/add_student_firebase/add_student_toFirebase_controller.dart';
import '../../controllers/temp_Collection_controller/temp_gurdian_cotroller/temp_guardian_controller.dart';
import '../../controllers/temp_Collection_controller/temp_parent_controller/temp_parent_controller.dart';
import '../../controllers/temp_Collection_controller/temp_students_controller/temp_student_controller.dart';

var schoolBatchYearListValue;

class GetBatchYearListDropDownButton extends StatefulWidget {
  var schoolID;
  TempStudentController tempStudentController =
      Get.put(TempStudentController());
  TempGuardianController tempGuardianController =
      Get.put(TempGuardianController());
  AddStudentToFirebaseController addStudentToFirebase = Get.put(AddStudentToFirebaseController());
  TempParentController tempParentController = Get.put(TempParentController());
  GetBatchYearListDropDownButton({required this.schoolID, Key? key})
      : super(key: key);

  @override
  State<GetBatchYearListDropDownButton> createState() =>
      _GeClasseslListDropDownButtonState();
}

class _GeClasseslListDropDownButtonState
    extends State<GetBatchYearListDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return dropDownButton();
  }

  StreamBuilder<QuerySnapshot<Map<String, dynamic>>> dropDownButton() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("SchoolListCollection")
            .doc(widget.schoolID)
            .collection("BatchYear")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return DropdownButtonFormField(
              hint: schoolBatchYearListValue == null
                  ? const Text(
                      "Select BatchYear",
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
                    )
                  : Text(schoolBatchYearListValue!["id"]),
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
                    value: val["id"],
                    child: Text(val["id"]),
                  );
                },
              ).toList(),
              onChanged: (val) {
                var categoryIDObject = snapshot.data!.docs
                    .where((element) => element["id"] == val)
                    .toList()
                    .first;
                log(categoryIDObject["id"]);

                setState(
                  () {
                    widget.tempStudentController.batchYear.value =
                        categoryIDObject['id'];

                    widget.tempParentController.batchYear.value =
                        categoryIDObject['id'];

                    widget.tempGuardianController.batchYear.value =
                        categoryIDObject['id'];

                 
                    widget.addStudentToFirebase.batchYear.value =
                        categoryIDObject['id'];
                        
                           schoolBatchYearListValue = categoryIDObject;
                    // log('Getx batchyear ${widget.tempStudentController.batchYear.value}');
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
