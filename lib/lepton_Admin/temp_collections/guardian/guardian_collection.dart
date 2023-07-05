import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_super_admin/controllers/temp_Collection_controller/temp_parent_controller/temp_parent_controller.dart';
import 'package:dujo_super_admin/fonts/google_monstre.dart';
import 'package:dujo_super_admin/widgets/buttonContainer.dart';
import 'package:dujo_super_admin/widgets/drop_down/select_batch_year.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constant/constant.dart';
import '../../../controllers/temp_Collection_controller/temp_gurdian_cotroller/temp_guardian_controller.dart';
import '../../../widgets/drop_down/get_class.dart';

class GuardianTempCollection extends StatelessWidget {
  TempGuardianController tempGuardianController = Get.put(TempGuardianController());
  String schoolID;
  GuardianTempCollection({super.key, required this.schoolID});

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
                  if (tempGuardianController.batchYear.value == '') {
                    return const SizedBox(
                        height: 100,
                        width: 300,
                        child: Text('Please Select batch year'));
                  } else {
                    return SizedBox(
                      height: 100,
                      width: 300,
                      child: GetClassesListDropDownButton(
                        batchyearID: tempGuardianController.batchYear.value,
                        schoolID: schoolID,
                      ),
                    );
                  }
                })
              ],
            ),
          ),
          Expanded(child: Obx(() {
            if (tempGuardianController.classID.value == '') {
              return const Center(
                child: Text("Select Class"),
              );
            } else {
              return StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('SchoolListCollection')
                      .doc(schoolID)
                      .collection(tempGuardianController.batchYear.value)
                      .doc(tempGuardianController.batchYear.value)
                      .collection('classes')
                      .doc(tempGuardianController.classID.value)
                      .collection('Temp_GuardianCollection')
                      .orderBy('guardianName', descending: false)
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
                                        child: GoogleMonstserratWidgets(text: 
                                            snaps.data!.docs[index]['guardianName'],fontsize: 15.w),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () async {
                                          await tempGuardianController.updateName(
                                              context: context,
                                              schoolID: schoolID,
                                              batchyear: tempGuardianController
                                                  .batchYear.value,
                                              classId: tempGuardianController
                                                  .classID.value,
                                              parentDocID: snaps
                                                  .data!.docs[index]['docid']);
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
                                            'Ph :  ${snaps.data!.docs[index]['guardianPhoneNumber']}'),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () async {
                                          await tempGuardianController
                                              .updatePhoneNumber(
                                                  context: context,
                                                  schoolID: schoolID,
                                                  batchyear:
                                                      tempGuardianController
                                                          .batchYear.value,
                                                  classId: tempGuardianController
                                                      .classID.value,
                                                  parentDocID: snaps.data!
                                                      .docs[index]['docid']);
                                        },
                                        icon:       Icon(
                                          Icons.edit,
                                          color: Colors.green,
                                          size: 25.w,
                                        )),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: GestureDetector(
                                        onTap: () async {
                                          await tempGuardianController
                                              .removeStudent(
                                                  context: context,
                                                  schoolID: schoolID,
                                                  batchyear:
                                                      tempGuardianController
                                                          .batchYear.value,
                                                  classId: tempGuardianController
                                                      .classID.value,
                                                  parentDocID: snaps.data!
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
