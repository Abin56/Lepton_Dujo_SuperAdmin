import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_super_admin/colors/colors.dart';
import 'package:dujo_super_admin/widgets/buttonContainer.dart';
import 'package:dujo_super_admin/widgets/drop_down/select_batch_year.dart';
import 'package:dujo_super_admin/widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/constant.dart';
import '../../../controllers/temp_Collection_controller/temp_students_controller/temp_student_controller.dart';
import '../../../widgets/drop_down/get_class.dart';

class StudenTempCollection extends StatelessWidget {
  TempStudentController tempStudentController =
      Get.put(TempStudentController());
  String schoolID;
  StudenTempCollection({super.key, required this.schoolID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor:  const Color.fromARGB(255, 160, 219, 162)),
        body: SafeArea(
      child: Column(
        children: [
          Container(
            height: 200,
            color: const Color.fromARGB(255, 160, 219, 162),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    height: 100,
                    width: 300,
                    child: GetBatchYearListDropDownButton(schoolID: schoolID)),
                Obx(() {
                  // tempStudentController.batchYear.value =
                  //     schoolBatchYearListValue?['id'] ?? '';
      
                  if (tempStudentController.batchYear.value == '') {
                    return const SizedBox(
                        height: 100,
                        width: 300,
                        child: Text('Please Select batch year'));
                  } else {
                    return SizedBox(
                      height: 100,
                      width: 300,
                      child: GetClassesListDropDownButton(
                        batchyearID: tempStudentController.batchYear.value,
                        schoolID: schoolID,
                      ),
                    );
                  }
                })
              ],
            ),
          ),
          sizedBoxW20,
          Expanded(child: Obx(() {
            if (tempStudentController.classID.value == '') {
              return const Center(
                child: Text("Select Class"),
              );
            } else {
              return StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('SchoolListCollection')
                      .doc(schoolID)
                      .collection(tempStudentController.batchYear.value)
                      .doc(tempStudentController.batchYear.value)
                      .collection('classes')
                      .doc(tempStudentController.classID.value)
                      .collection('TempStudents')
                      .orderBy('studentName', descending: false)
                      .snapshots(),
                  builder: (context, snaps) {
                    if (snaps.hasData) {
                      return ListView.separated(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Container(
                                height: 60,
                                color: const Color.fromARGB(255, 190, 220, 245),
                                child: Row(
                                  children: [
                                    sizedBoxW10,
                                    Text('${index + 1}'),
                                    sizedBoxW10,
                                    Text(
                                        snaps.data!.docs[index]['studentName']),
                                    IconButton(
                                        onPressed: () async {
                                          await tempStudentController
                                              .updateName(
                                                  context: context,
                                                  schoolID: schoolID,
                                                  batchyear:
                                                      tempStudentController
                                                          .batchYear.value,
                                                  classId: tempStudentController
                                                      .classID.value,
                                                  studentDocID: snaps.data!
                                                      .docs[index]['docid']);
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Colors.green,
                                        )),
                                    const Spacer(),
                                    Text(
                                        'Ph :  ${snaps.data!.docs[index]['parentPhoneNumber']}'),
                                    IconButton(
                                        onPressed: () async {
                                          await tempStudentController
                                              .updatePhoneNumber(
                                                  context: context,
                                                  schoolID: schoolID,
                                                  batchyear:
                                                      tempStudentController
                                                          .batchYear.value,
                                                  classId: tempStudentController
                                                      .classID.value,
                                                  studentDocID: snaps.data!
                                                      .docs[index]['docid']);
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Colors.green,
                                        )),
                                    const Spacer(),
                                    Text(
                                        'ID :  ${snaps.data!.docs[index]['admissionNumber']}'),
                                    IconButton(
                                        onPressed: () async {
                                          await tempStudentController
                                              .updateAdmissionNumber(
                                                  context: context,
                                                  schoolID: schoolID,
                                                  batchyear:
                                                      tempStudentController
                                                          .batchYear.value,
                                                  classId: tempStudentController
                                                      .classID.value,
                                                  studentDocID: snaps.data!
                                                      .docs[index]['docid']);
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Colors.green,
                                        )),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: GestureDetector(
                                        onTap: () async {
                                          await tempStudentController
                                              .removeStudent(
                                                  context: context,
                                                  schoolID: schoolID,
                                                  batchyear:
                                                      tempStudentController
                                                          .batchYear.value,
                                                  classId: tempStudentController
                                                      .classID.value,
                                                  studentDocID: snaps.data!
                                                      .docs[index]['docid']);
                                        },
                                        child: ButtonContainerWidget(
                                            curving: 5,
                                            colorindex: 6,
                                            height: 35,
                                            width: 100,
                                            child: const Center(
                                              child: Text(
                                                'Remove',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 8,
                            );
                          },
                          itemCount: snaps.data!.docs.length);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }
                  });
            }
          })),
        ],
      ),
    ));
  }
}
