import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' show Font, GoogleFonts;

import 'package:shared_preferences/shared_preferences.dart';

class DocumentPage extends StatelessWidget {
  late pw.Font interFont;

  Future<pw.Document> generateDocument() async {
    interFont = await Font.ttf(
      await rootBundle.load('fonts/RobotoSlab-VariableFont_wght.ttf'),
    );
    final pdf = pw.Document();

    //add more sharedprefs here
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String firstName = prefs.getString('firstName') ?? '';
    String imagePath = prefs.getString('ImagePath') ?? '';
    String engineerName = prefs.getString('Name') ?? '';
    String engineerAdd = prefs.getString('address') ?? '';
    String engineerPost = prefs.getString('postcode') ?? '';
    String engineerTele = prefs.getString('telephone') ?? '';
    String engineerTrade = prefs.getString('trading') ?? '';
    String engineerGas = prefs.getString('gas') ?? '';
    String userId = prefs.getString('userID') ?? '';
    String engineerCompany = prefs.getString('company') ?? '';
    bool isLogoSet = prefs.getBool('isLogoSet') ?? false;
    final PdfPageFormat format = PdfPageFormat(792, 612, marginAll: 0);

    ByteData imageData = await rootBundle.load('assets/defaultlogo.jpg');
    pw.MemoryImage logoImage = pw.MemoryImage(Uint8List.view(imageData.buffer));

    // Only update logoImage if isLogoSet is true and imagePath is not empty
    if (isLogoSet && imagePath.isNotEmpty) {
      imageData = (await File(imagePath).readAsBytes()) as ByteData;
      logoImage = pw.MemoryImage(imageData as Uint8List);
    }

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (pw.Context context) {
          return pw.Stack(
            children: [
              // Centered GAS SAFETY REPORT text
              pw.Positioned(
                left: 240,
                top: 40,
                child: pw.Text(
                  'GAS SAFETY REPORT',
                  style: pw.TextStyle(
                      fontSize: 33,
                      fontWeight: pw.FontWeight.bold,
                      font: interFont),
                ),
              ),

              // Positioned First Name text
              pw.Positioned(
                left: 10,
                top: 110,
                child: pw.Text(
                  'Engineer Name: $engineerName',
                  style: pw.TextStyle(fontSize: 18),
                ),
              ),

              pw.Positioned(
                left: 10,
                top: 130,
                child: pw.Text(
                  'UserID: $userId',
                  style: pw.TextStyle(fontSize: 18),
                ),
              ),

              // Positioned logo or default image
              if (isLogoSet)
                pw.Positioned(
                  top: 20,
                  right: 20,
                  child: pw.Container(
                    width: 100, // Adjust width and height as needed
                    height: 100,
                    child: pw.Image(
                      pw.MemoryImage(
                        File(imagePath).readAsBytesSync(),
                      ),
                    ),
                  ),
                ),
              if (!isLogoSet)
                pw.Positioned(
                  top: 20,
                  right: 20,
                  child: pw.Container(
                    width: 100, // Adjust width and height as needed
                    height: 100,
                    child: pw.Image(logoImage), // Display default logo image
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
