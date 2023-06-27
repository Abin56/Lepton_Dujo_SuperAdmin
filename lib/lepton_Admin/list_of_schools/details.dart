import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_super_admin/lepton_Admin/temp_collections/show_dilog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/constant.dart';
import '../../controllers/super_admin_Controller/super_admin_controller.dart';
import '../../widgets/buttonContainer.dart';

class DetailsSchoolsScreen extends StatefulWidget {
  static const String route = '/schoolDetails';
  SuperAdminController superAdminController = Get.put(SuperAdminController());
  DetailsSchoolsScreen({super.key, required this.schoolSnap});

  QueryDocumentSnapshot<Map<String, dynamic>> schoolSnap;

  @override
  State<DetailsSchoolsScreen> createState() => _DetailsSchoolsScreenState();
}

class _DetailsSchoolsScreenState extends State<DetailsSchoolsScreen> {
  @override
  Widget build(BuildContext context) {
    log('School Idd${widget.schoolSnap['docid']}');
    int columnCount = 4;
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 40,
                  spreadRadius: 10,
                ),
              ],
            ),
            height: 700,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sizedBoxH10,
                        Text(
                          widget.schoolSnap['schoolName'],
                          style: GoogleFonts.montserrat(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        sizedBoxH10,
                        Text(
                          widget.schoolSnap['postedDate'],
                          style: GoogleFonts.poppins(
                            color: Colors.black.withOpacity(0.4),
                            fontSize: 15,
                          ),
                        ),
                        sizedBoxH20,
                        Text(
                          "Country : India",
                          style: GoogleFonts.poppins(
                            color: Colors.black.withOpacity(0.4),
                            fontSize: 15,
                          ),
                        ),
                        sizedBoxH10,
                        Text(
                          "State : Kerala",
                          style: GoogleFonts.poppins(
                            color: Colors.black.withOpacity(0.4),
                            fontSize: 15,
                          ),
                        ),
                        sizedBoxH10,
                        Text(
                          "City : ${widget.schoolSnap['district']}",
                          style: GoogleFonts.poppins(
                            color: Colors.black.withOpacity(0.4),
                            fontSize: 15,
                          ),
                        ),
                        sizedBoxH10,
                        Text(
                          "Place : ${widget.schoolSnap['place']}",
                          style: GoogleFonts.poppins(
                            color: Colors.black.withOpacity(0.4),
                            fontSize: 15,
                          ),
                        ),
                        sizedBoxH20,
                        Text(
                          "Email  : ${widget.schoolSnap['email']}",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        sizedBoxH10,
                        Text(
                          "Password  : ${widget.schoolSnap['password']}",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        sizedBoxH10,
                        Text(
                          "Phone No  : ${widget.schoolSnap['phoneNumber']}",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        sizedBoxH30,
                        sizedBoxH10,
                        Text(
                          "Status : ${widget.schoolSnap['deactive']}",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            sizedBoxW20,
                            GestureDetector(
                              onTap: () async {
                                widget.superAdminController.activateSchool(
                                    widget.schoolSnap['docid'] ?? '');
                              },
                              child: ButtonContainerWidget(
                                curving: 10,
                                colorindex: 3,
                                height: 40,
                                width: 130,
                                child: Center(
                                  child: Text(
                                    "Activate",
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            sizedBoxW20,
                            GestureDetector(
                              onTap: () async {
                                await widget.superAdminController
                                    .deactivateSchool(
                                        widget.schoolSnap['docid'] ?? '');
                              },
                              child: ButtonContainerWidget(
                                curving: 10,
                                colorindex: 6,
                                height: 40,
                                width: 130,
                                child: Center(
                                  child: Text(
                                    "Deactivate",
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            sizedBoxW20,
                            ButtonContainerWidget(
                              curving: 10,
                              colorindex: 6,
                              height: 40,
                              width: 130,
                              child: Center(
                                child: Text(
                                  "Delete",
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        )
                      ]),
                  sizedBoxW20,
                  Container(
                    height: double.infinity - 10,
                    width: 1,
                    color: Colors.black.withOpacity(0.3),
                  ),
                  Expanded(
                    child: AnimationLimiter(
                      child: GridView.count(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        padding: EdgeInsets.all(w / 60),
                        crossAxisCount: columnCount,
                        children: List.generate(
                          screens.length,
                          (int index) {
                            return AnimationConfiguration.staggeredGrid(
                              position: index,
                              duration: const Duration(milliseconds: 300),
                              columnCount: columnCount,
                              child: ScaleAnimation(
                                duration: const Duration(milliseconds: 900),
                                curve: Curves.fastLinearToSlowEaseIn,
                                child: FadeInAnimation(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        print("object");
                                        if (index == 1) {
                                          getTempDilogBox(context,
                                              widget.schoolSnap['docid']);
                                        } else {}
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.5),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.1),
                                              blurRadius: 40,
                                              spreadRadius: 10,
                                            ),
                                          ],
                                        ),
                                        margin: EdgeInsets.only(
                                            top: w / 40,
                                            bottom: w / 40,
                                            left: w / 40,
                                            right: w / 40),
                                        child:
                                            Center(child: Text(screens[index])),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List<String> screens = [
  'School Controller',
  'TempCollections',
  'Payment History',
  'Students',
  'Teachers',
  'Classes',
  'Admins',
  'Live Stream',
];
