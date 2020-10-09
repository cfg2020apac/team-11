import 'package:blossom/PdfViewer.dart';
import 'package:pdf/pdf.dart';
import 'dart:io';
import 'package:pdf/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart' as material;

reportView(context) async {
  final Document pdf = Document();

  pdf.addPage(MultiPage(
      pageFormat:
      PdfPageFormat.letter.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      build: (Context context) => <Widget>[
        Header(level: 0, text : "CIP Hours"),
        Header(level: 1, text: "Blossom World Society"),
        Paragraph(text: "Blossom World Society is a Charity with Institution of a Public Character (IPC), which focuses on active volunteerism and service learning. Since established in 2008, we have engaged over 123,007 beneficiaries who comprises of low-income families, children and youth and lonely elderly. With our structured programme, we trained 9,863 volunteers and conducted 488 programmes and events. Through these means, we instill moral values and a sense of gratitude in young people. Our goal is to inspire them to be a more gracious generation that contributes positively to enrich lives."),
        Paragraph(text: "This is to verify that Bobby Tan Xiao Ming has completed the following CIP events"),
        Padding(padding: const EdgeInsets.all(10)),
        Table.fromTextArray(context: context, data: const <List<String>>[
          <String>['Date', 'Event', 'Hours Generated'],
          <String>['2020-10-11d ', 'Discovering Treasure Through Stories', '6'],
          <String>['2020-09-11', 'Discovering Treasure Through Stories', '6']
        ]),
        Padding(padding: const EdgeInsets.all(10)),
        Paragraph( text: 'We would like to thank you for your continuous support.'),
      ]));
  //save PDF

  final String dir = (await getApplicationDocumentsDirectory()).path;
  final String path = '$dir/CIPHours.pdf';
  final File file = File(path);
  await file.writeAsBytes(pdf.save());
  material.Navigator.of(context).push(
    material.MaterialPageRoute(
      builder: (_) => PdfViewer(path: path),
    ),
  );
}
