import 'package:dujo_super_admin/colors/colors.dart';
import 'package:dujo_super_admin/fonts/google_monstre.dart';
import 'package:dujo_super_admin/lepton_Admin/temp_collections/parents/parent_collection.dart';
import 'package:dujo_super_admin/lepton_Admin/temp_collections/students/student_collection.dart';
import 'package:dujo_super_admin/lepton_Admin/temp_collections/teachers/teacher_collection.dart';
import 'package:dujo_super_admin/widgets/buttonContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Add_student/add_student.dart';
import 'guardian/guardian_collection.dart';

getTempDilogBox(BuildContext context, String schoolID) {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Select Collections'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              SizedBox(
                height: 500.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return StudenTempCollection(
                              schoolID: schoolID,
                            );
                          },
                        ));
                      },
                      child: ButtonContainerWidget(
                        curving: 20,
                        colorindex: 0,
                        height: 100.h,
                        width: 200.w,
                        child:  Center(child:
                        GoogleMonstserratWidgets(text: 'Student',
                        fontsize: 14.w,color: cWhite,fontWeight: FontWeight.w600,)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return ParentTempCollection(schoolID: schoolID);
                          },
                        ));
                      },
                      child: ButtonContainerWidget(
                        curving: 20,
                        colorindex: 0,
                        height: 100.h,
                        width: 200.w,
                        child:  Center(child:  GoogleMonstserratWidgets(text:
                         'Parent', fontsize: 14.w,color: cWhite,fontWeight: FontWeight.w600,)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return GuardianTempCollection(schoolID: schoolID);
                          },
                        ));
                      },
                      child: ButtonContainerWidget(
                        curving: 20,
                        colorindex: 0,
                        height: 100.h,
                        width: 200.w,
                        child:  Center(child:  GoogleMonstserratWidgets(text:
                        'Guardain', fontsize: 14.w,color: cWhite,fontWeight: FontWeight.w600,)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return TeacherTempCollection(schoolID: schoolID);
                          },
                        ));
                      },
                      child: ButtonContainerWidget(
                        curving: 20,
                        colorindex: 0,
                        height: 100.h,
                        width: 200.w,
                        child:  Center(child:  GoogleMonstserratWidgets(text:
                        'Teachers', fontsize: 14.w,color: cWhite,fontWeight: FontWeight.w600,)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return AddStudentToFirebase(schoolID: schoolID);
                          },
                        ));
                      },
                      child: ButtonContainerWidget(
                        curving: 20,
                        colorindex: 0,
                        height: 100.h,
                        width: 200.w,
                        child:
                             Center(child:
                             GoogleMonstserratWidgets(text: 'Add Students AutoMatic',
                             fontsize: 14.w,color: cWhite,fontWeight: FontWeight.w600,)
                             ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
