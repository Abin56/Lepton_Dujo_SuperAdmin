import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_super_admin/widgets/buttonContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constant/constant.dart';
import '../../../controllers/temp_Collection_controller/temp_teacher_controller/temp_teacher_controller.dart';

class TeacherTempCollection extends StatelessWidget {
  TempTeacherController tempTeacherController =
      Get.put(TempTeacherController());
  String schoolID;
  TeacherTempCollection({super.key, required this.schoolID});

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
              children: const [],
            ),
          ),
          Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('SchoolListCollection')
                      .doc(schoolID)
                      .collection('TempTeacherList')
                      .orderBy('teacherName', descending: false)
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
                                    Container(
                                      height: 59.h,
                                      width: 50.w,
                                      child: Center(child: Text('${index + 1}'))),
                                    sizedBoxW10,
                                    Container(
                                      height: 59.h,
                                      width: 240.w,
                                      child: Center(
                                        child: Text(
                                            snaps.data!.docs[index]['teacherName']),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () async {
                                          await tempTeacherController
                                              .updateName(
                                                  context: context,
                                                  schoolID: schoolID,
                                                  teacherDocID: snaps.data!
                                                      .docs[index]['docid']);
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Colors.green,
                                        )),
                                    const Spacer(),
                                    Container(
                                      height: 59.h,
                                      width: 240.w,
                                      child: Center(
                                        
                                        child: Text(
                                            'Ph :  ${snaps.data!.docs[index]['teacherPhNo']}'),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () async {
                                          await tempTeacherController
                                              .updatePhoneNumber(
                                                  context: context,
                                                  schoolID: schoolID,
                                                  teacherDocID: snaps.data!
                                                      .docs[index]['docid']);
                                        },
                                        icon:  Icon(
                                          Icons.edit,
                                          color: Colors.green,
                                          size: 25.w,
                                        )),
                                    const Spacer(),
                                    Container(
                                      height: 59.h,
                                      width: 240.w,
                                      child: Center(
                                        child: Text(
                                            'ID :  ${snaps.data!.docs[index]['employeeID']}'),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () async {
                                          await tempTeacherController
                                              .updateAdmissionNumber(
                                                  context: context,
                                                  schoolID: schoolID,
                                                  teacherDocID: snaps.data!
                                                      .docs[index]['docid']);
                                        },
                                        icon:  Icon(
                                          Icons.edit,
                                          color: Colors.green,
                                          size: 25.w,
                                        )),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: GestureDetector(
                                        onTap: () async {
                                          await tempTeacherController
                                              .removeStudent(
                                                  context: context,
                                                  schoolID: schoolID,
                                                  teacherDocID: snaps.data!
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
                  })),
        ],
      ),
    ));
  }
}
