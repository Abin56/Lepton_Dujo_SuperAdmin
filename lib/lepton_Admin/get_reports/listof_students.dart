import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../widgets/buttonContainer.dart';


class InvoiceScreen extends StatefulWidget {
  String schoolID;
  String batchID;
  String classID;
  double price;

  InvoiceScreen(
      {required this.schoolID,
      required this.batchID,
      required this.price,
      required this.classID,
      super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  // Future<List<DocumentSnapshot>> getCollectionData() async {
  //   final collection = FirebaseFirestore.instance
  //       .collection('SchoolListCollection')
  //       .doc(widget.schoolID)
  //       .collection(widget.batchID)
  //       .doc(widget.batchID)
  //       .collection('classes')
  //       .doc(widget.classID)
  //       .collection('Students')
  //       .orderBy('studentName', descending: false);
  //   final snapshot = await collection.get();
  //   return snapshot.docs;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () async {
              Printing.layoutPdf(
                onLayout: (PdfPageFormat format) {
                  return buildPdf(format);
                },
              );
              await nextpage();
            },
            child: ButtonContainerWidget(
              curving: 30,
              colorindex: 0,
              height: 60,
              width: 200,
              child: Center(
                child: Text(
                  "Download Invoice",
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }

  nextpage() async {
    await Future.delayed(const Duration(seconds: 5));
    // Get.offAll(HomeScreen());
  }

  /// This method takes a page format and generates the Pdf file data
  Future<Uint8List> buildPdf(PdfPageFormat format) async {
    // final data = await getCollectionData();

    final pw.Document doc = pw.Document();

    // Add one page with centered text "Hello World"
    doc.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(children: [
            pw.Row(children: [
              pw.Column(children: [
                pw.Container(
                  child: pw.Text("Vectorwind Tech Systems Pvt,Ltd,\n"
                      "Door.No. 4/461,2nd floor,suite#151\n"
                      "valamkottil towers,\n"
                      "judgemukku,Thrikkakkara p.o,\n"
                      "kochi-682021,kerala,India"),
                ),
                pw.SizedBox(height: 30),
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      // pw.Container(
                      //     child: (pw.Text("TO \n\n"
                      //             "${widget.customerName}\n\n" +
                      //         widget.email))),
                    ])
              ]),
              //  pw.Expanded(child: Container(child: ,))
              pw.Spacer(),
              pw.Column(children: [
                pw.Container(
                  child: (pw.Text('INVOICE')),
                ),
                pw.SizedBox(height: 13),
                // pw.Text("NO : VSCI" + widget.inVoiceNumber.toString()),
                pw.SizedBox(height: 9),
              ]),
            ]),
            pw.SizedBox(height: 100),
            pw.Row(children: [
              pw.ListView.separated(
                  itemBuilder: (context, index) {
                    return pw.Container(
                      height: 40,
                      child: pw.Row(children: [
                        pw.Text("data[index]['studentName']"),
                        pw.Text("data[index]['studentemail']"),
                        // pw.Text(data[index]['studentName']),
                        // pw.Text(data[index]['studentemail']),
                      ]),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return pw.Divider();
                  },
                  itemCount: 100),
              pw.Spacer(),
            ]),
          ]);
        },
      ),
    );

    // Build and return the final Pdf file data
    return await doc.save();
  }
}
