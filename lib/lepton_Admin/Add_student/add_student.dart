import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_super_admin/widgets/drop_down/select_batch_year.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/drop_down/get_class.dart';
import '../../constant/constant.dart';
import '../../controllers/add_student_firebase/add_student_toFirebase_controller.dart';
import '../../model/add_student_model/add_student_model.dart';
import '../../widgets/buttonContainer.dart';
import '../get_reports/excel.dart';

class AddStudentToFirebase extends StatelessWidget {
  List<AddStudentModel> studentModelList = [];
  AddStudentToFirebaseController addStudentToFirebase =
      Get.put(AddStudentToFirebaseController());
  String schoolID;
  AddStudentToFirebase({super.key, required this.schoolID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  // addStudentToFirebase.batchYear.value =
                  //     schoolBatchYearListValue?['id'] ?? '';

                  if (addStudentToFirebase.batchYear.value == '') {
                    return const SizedBox(
                        height: 100,
                        width: 300,
                        child: Text('Please Select batch year'));
                  } else {
                    return SizedBox(
                      height: 100,
                      width: 300,
                      child: GetClassesListDropDownButton(
                        batchyearID: addStudentToFirebase.batchYear.value,
                        schoolID: schoolID,
                      ),
                    );
                  }
                }),
                Obx(() {
                  if (addStudentToFirebase.classID.value == '') {
                    return const Center(
                      child: Text("Select Class"),
                    );
                  } else {
                    return GestureDetector(
                      onTap: () async {
                        addStudentToFirebase.addStudentToServerINAutomatic(
                            context,
                            addStudentToFirebase.batchYear.value,
                            addStudentToFirebase.classID.value,
                            schoolID,
                            studentModelList);
                      },
                      child: Row(
                        children: [
                          ButtonContainerWidget(
                              curving: 10,
                              colorindex: 0,
                              height: 60,
                              width: 200,
                              child: const Center(
                                child: Text('Automatic Adding Students'),
                              )),
                          sizedBoxW20,
                          GestureDetector(
                            onTap: () async {
                              exportDataToCSV(
                                  schoolID,
                                  addStudentToFirebase.batchYear.value,
                                  addStudentToFirebase.classID.value);

                            },
                            child: ButtonContainerWidget(
                                curving: 10,
                                colorindex: 0,
                                height: 60,
                                width: 200,
                                child: const Center(
                                  child: Text('Get Reports'),
                                )),
                          ),
                        ],
                      ),
                    );
                  }
                }),
                
              ],
            ),
          ),
          Expanded(child: Obx(() {
            if (addStudentToFirebase.classID.value == '') {
              return const Center(
                child: Text("Select Class"),
              );
            } else {
              return StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('SchoolListCollection')
                      .doc(schoolID)
                      .collection(addStudentToFirebase.batchYear.value)
                      .doc(addStudentToFirebase.batchYear.value)
                      .collection('classes')
                      .doc(addStudentToFirebase.classID.value)
                      .collection('TempStudents')
                      .orderBy('studentName', descending: false)
                      .snapshots(),
                  builder: (context, snaps) {
                    if (snaps.hasData) {
                      studentModelList = snaps.data!.docs
                          .map((e) => AddStudentModel.fromMap(e.data()))
                          .toList();

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
                                    const Spacer(),
                                    Text(
                                        'Ph :  ${snaps.data!.docs[index]['parentPhoneNumber']}'),
                                    const Spacer(),
                                    Text(
                                        'ID :  ${snaps.data!.docs[index]['admissionNumber']}'),
                                    const Spacer(),
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
