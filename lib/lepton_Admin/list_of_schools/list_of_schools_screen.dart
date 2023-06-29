// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_super_admin/fonts/google_monstre.dart';
import 'package:dujo_super_admin/lepton_Admin/list_of_schools/details.dart';
import 'package:dujo_super_admin/widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/buttonContainer.dart';

class SchoolsListScreen extends StatefulWidget {
  static const String route = '/SchooList';
  const SchoolsListScreen({super.key});

  @override
  State<SchoolsListScreen> createState() => _SchoolsListScreenState();
}

class _SchoolsListScreenState extends State<SchoolsListScreen> {
  @override
  Widget build(BuildContext context) {
    int columnCount = 3;
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
 backgroundColor: Colors.white,
  leading: const BackButton(
    color: Colors.black, // <-- SEE HERE
  ),
      ),
     
        body: SafeArea(
      child: Column(
        children: [
           Padding(
            padding: EdgeInsets.only(top: 30.h
            ),
            child: GoogleMonstserratWidgets(text: 
              "LIST OF SCHOOLS",
              fontsize: 32.w
            ),
          ),
          Expanded(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('SchoolListCollection')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                            bottom: 20,
                          ),
                          child: SizedBox(
                            height: 120.h,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                    width: 100.w,
                                    // color: Colors.amber,
                                    child: Center(child: Text('${index + 1}'))),
                                SizedBox(
                                  width: 800.w,
                                  // color: Colors.blueAccent,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        // width: 800.w,
                                        // color: Colors.blueAccent,
                                        child: Center(
                                          child: Text(
                                            snapshot.data!.docs[index]
                                                ['schoolName'],
                                            style: GoogleFonts.montserrat(
                                                color: Colors.black,
                                                fontSize: 14.w,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        // width: 800.w,
                                        child: Center(
                                          child: Text(
                                            snapshot.data!.docs[index]['place'],
                                            style: GoogleFonts.montserrat(
                                                color: Colors.black,
                                                fontSize: 14.w,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 100.w,
                                  // color: Colors.red,
                                  child: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return DetailsSchoolsScreen(
                                                  schoolSnap: snapshot
                                                      .data!.docs[index]);
                                            },
                                          ),
                                        );
                                      },
                                      icon: const Icon(Icons.info_outline)),
                                ),
                                SizedBox(
                                  width: 200.w,
                                  // color: Colors.cyanAccent,
                                  child: Center(
                                    child: Text(
                                        "Status : ${snapshot.data?.docs[index]['deactive'] ?? ""}"),
                                  ),
                                ),
                                SizedBox(
                                  width: 180.w,
                                  child: ButtonContainerWidget(
                                    curving: 10,
                                    colorindex: 3,
                                    height: 40.h,
                                    width: 130.w,
                                    child: Center(
                                      child: Text(
                                        "Active",
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 12.w,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: snapshot.data!.docs.length);
                }),
          )
        ],
      ),
));
  }
}