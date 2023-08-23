import 'dart:convert';
import 'dart:html' as html;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';

void exportDataToCSV(String schoolID, String batchID, String classID) async {
  Future<List<QueryDocumentSnapshot>> getCollectionData() async {
    final collection = FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(schoolID)
        .collection(batchID)
        .doc(batchID)
        .collection('classes')
        .doc(classID)
        .collection('Students')
        .orderBy('studentName', descending: false);
    final snapshot = await collection.get();
    return snapshot.docs;
  }

  final data = await getCollectionData();

  final csvData = [
    [
      'Name',
      'E-mail',
      'Admission Number',
      'Parent E mail'
    ], // CSV header row
    ...data.map((document) => [
          document['studentName'],
          document['studentemail'],
          document['admissionNumber'],
          document['parentName'],
        ]) // Extract the fields you want to export from each document
  ];

  final csv = const ListToCsvConverter().convert(csvData);

  final bytes = utf8.encode(csv);
  final blob = html.Blob([bytes]);
  final url = html.Url.createObjectUrlFromBlob(blob);

  final anchor = html.document.createElement('a') as html.AnchorElement
    ..href = url
    ..style.display = 'none'
    ..download = 'data.csv';

  html.document.body?.children.add(anchor);
  anchor.click();

  html.document.body?.children.remove(anchor);
  html.Url.revokeObjectUrl(url);
}
