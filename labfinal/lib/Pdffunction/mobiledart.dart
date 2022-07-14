import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class Pdfservices{
  Future<Uint8List>createPdf(List data)async{
    final ByteData bytes = await rootBundle.load('images/t1.png');
    final Uint8List byteList = bytes.buffer.asUint8List();

    final pw.Document doc = pw.Document();

    doc.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.letter.copyWith(marginBottom: 1 * PdfPageFormat.cm),
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        header: (pw.Context context) {
          return pw.Container(
              alignment: pw.Alignment.center,
              margin: const pw.EdgeInsets.only(bottom: 2.0 * PdfPageFormat.mm),
              padding: const pw.EdgeInsets.only(bottom: 2.0 * PdfPageFormat.mm),
              child: pw.Column(
                  children: [
                    pw.Row(
                        children: [
                          pw.Image(
                            pw.MemoryImage(
                              byteList,
                            ),
                            width: 100.0,
                            height: 100.0,

                          ),

                          pw.Text('Teacher Records',
                            style: pw.TextStyle(
                              color: PdfColors.red,
                              fontSize: 30.0,
                            ),
                          ),


                        ]
                    ),
                    pw.Divider(
                      color: PdfColors.greenAccent,

                      thickness: 20.0,



                    )
                  ]
              ));
        },
        build: (pw.Context context) => <pw.Widget>[
          pw.Table.fromTextArray(
              context: context,
              border: null,
              headerAlignment: pw.Alignment.centerLeft,
              headerDecoration: pw.BoxDecoration(color: PdfColors.red50),
              headerStyle: pw.TextStyle(fontSize: 10.0),
              cellStyle: pw.TextStyle(
                  color: PdfColors.black,
                  fontSize: 10.0
              ),


              data: <List<String>>[

                <String>['name', 'phone','email','subject','classes','passwpord' ],
                for (int i = 0; i <data.length; i++)
                  <String>['${i+1}) ${data.elementAt(i)['name']}','${data.elementAt(i)['phone']}',
                    '${data.elementAt(i)['email']}','${data.elementAt(i)['subject']}','${data.elementAt(i)['classes']}',
                    '${data.elementAt(i)['passwpord']}'],
              ]),
          pw.Paragraph(text: ""),
          pw.Padding(padding: const pw.EdgeInsets.all(5)),
        ]));

    return doc.save();



  }
  Future<void>saveAndLanchFile(List<int>bytes,String fileName)async{
    final path =(await getExternalStorageDirectory())?.path;
    final file=File("$path/$fileName");
    await file.writeAsBytes(bytes,flush: true);
    OpenFile.open("$path/$fileName");

  }
}