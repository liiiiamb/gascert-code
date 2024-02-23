import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DocumentPage extends StatelessWidget {
  late pw.Font interFont;
  // late pw.Font oswaldFont;

  Future<pw.Document> generateDocument() async {
    interFont = await pw.Font.ttf(
      await rootBundle.load('fonts/RobotoSlab-VariableFont_wght.ttf'),
    );
    // oswaldFont = await pw.Font.ttf(
    //     await rootBundle.load('fonts/Oswald-VariableFont_wght.ttf'));
    final pdf = pw.Document();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String engineerName = prefs.getString('Name') ?? '';
    String imagePath = prefs.getString('ImagePath') ?? '';
    bool isLogoSet = prefs.getBool('isLogoSet') ?? false;

    ByteData imageData = await rootBundle.load('assets/defaultlogo.jpg');
    pw.MemoryImage logoImage = pw.MemoryImage(imageData.buffer.asUint8List());

    // Only update logoImage if isLogoSet is true and imagePath is not empty
    if (isLogoSet && imagePath.isNotEmpty) {
      File imageFile = File(imagePath);
      if (imageFile.existsSync()) {
        Uint8List bytes = await imageFile.readAsBytes();
        logoImage = pw.MemoryImage(bytes);
      }
    }

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Stack(
            children: [
              pw.Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                top: 10,
                child: pw.Text(
                  'GAS SAFETY RECORD',
                  style: pw.TextStyle(
                    fontSize: 23,
                    fontWeight: pw.FontWeight.bold,
                    // font: oswaldFont,
                  ),
                ),
              ),
              if (isLogoSet)
                pw.Positioned(
                  left: 400,
                  right: 0,
                  bottom: 660,
                  child: pw.Container(
                    width: 65,
                    height: 65,
                    child: pw.Image(logoImage),
                  ),
                ),
              pw.Positioned(
                left: 0,
                right: 0,
                bottom: 650,
                child: pw.Container(
                  height: 1,
                  color: PdfColors.black,
                ),
              ),
              pw.Positioned(
                left: 0,
                right: 0,
                top: 100,
                bottom: 600,
                child: pw.Text(
                  'Engineer Details',
                  style: pw.TextStyle(
                    fontSize: 13,
                    fontWeight: pw.FontWeight.bold,
                    // font: oswaldFont,
                  ),
                ),
              ),
              pw.Positioned(
                left: 0,
                right: 0,
                top: 130,
                bottom: 600,
                child: pw.Text(
                  '$engineerName',
                  style: pw.TextStyle(
                    fontSize: 13,
                    // font: oswaldFont,
                  ),
                ),
              ),
              pw.Positioned(
                left: 370,
                right: 0,
                top: 100,
                bottom: 600,
                child: pw.Text(
                  'Customer Details',
                  style: pw.TextStyle(
                    fontSize: 13,
                    fontWeight: pw.FontWeight.bold,
                    // font: oswaldFont,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );

    return pdf;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Document')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final pdf = await generateDocument();

            // Display the generated PDF document
            Printing.layoutPdf(
              onLayout: (PdfPageFormat format) async => pdf.save(),
            );
          },
          child: Text('Generate Document'),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: DocumentPage()));
