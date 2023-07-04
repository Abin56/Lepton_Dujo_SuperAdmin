import 'package:dujo_super_admin/lepton_Admin/temp_collections/parents/parent_collection.dart';
import 'package:dujo_super_admin/lepton_Admin/temp_collections/students/student_collection.dart';
import 'package:dujo_super_admin/lepton_Admin/temp_collections/teachers/teacher_collection.dart';
import 'package:dujo_super_admin/widgets/buttonContainer.dart';
import 'package:flutter/material.dart';

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
                height: 600,
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
                        height: 100,
                        width: 200,
                        child: const Center(child: Text('Student')),
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
                        height: 100,
                        width: 200,
                        child: const Center(child: Text('Parent')),
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
                        height: 100,
                        width: 200,
                        child: const Center(child: Text('Guardain')),
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
                        height: 100,
                        width: 200,
                        child: const Center(child: Text('Teachers')),
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
                        height: 100,
                        width: 200,
                        child:
                            const Center(child: Text('Add Students AutoMatic')),
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
            child: const Text('ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
