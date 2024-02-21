import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:gascert/Appliance1_Details.dart';
import 'package:gascert/Appliance2_Details.dart';
import 'package:gascert/Appliance3_Details.dart';
import 'package:gascert/Appliance4_Details.dart';
import 'package:gascert/CustomerDetails.dart';
import 'package:gascert/FinalChecks.dart';
import 'package:gascert/PostReportOptions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart';
import 'package:telephony/telephony.dart';

import 'package:pdf/pdf.dart';
import 'BackupData.dart';
import 'FirestoreDataDisplay';
import 'PrevReport.dart';
import 'dart:convert';
import 'dart:io';
import 'package:pdf/widgets.dart' as pdfWid;
import 'package:excel/excel.dart' as excel;
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:printing/printing.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'main.dart';
import 'TestingScreen.dart';
import 'package:permission_handler/permission_handler.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   runApp(CreateReport());
// }

final pdf = pdfWid.Document(version: PdfVersion.pdf_1_4, compress: true);

class UserInfo {
  late String name;
  late String address;
  late String surname;
  late String password1;
  late String password2;
  late String tradingTitle;
  late String email;
  late String phoneNum;
  late String gasNum;
  late String postcode;
}

class CreateReport extends StatefulWidget {
  @override
  _CreateReportState createState() => _CreateReportState();
}

class _CreateReportState extends State<CreateReport> {
  late String userId;
  String emailAdd = '';

  var titleController = TextEditingController();
  var fNameController = TextEditingController();
  var lNameController = TextEditingController();
  var postController = TextEditingController();
  var addressController = TextEditingController();

  var cityController = TextEditingController();
  var locOneController = TextEditingController();
  var locOneController_2 = TextEditingController();
  var locOneController_3 = TextEditingController();
  var locOneController_4 = TextEditingController();
  var FlueTypeController = TextEditingController();
  var outcomeGasInstallController = TextEditingController();
  var outcomeGasSafeController = TextEditingController();
  var outcomeGasTightController = TextEditingController();
  var emergencyControlController = TextEditingController();
  var protectiveController = TextEditingController();
  var coAlarmController = TextEditingController();
  var smokeAlarmController = TextEditingController();
  var ApplianceInspectController = TextEditingController();
  var OwnedByController = TextEditingController();
  var operatePressureController = TextEditingController();
  var ModelController = TextEditingController();
  var ManafacturerController = TextEditingController();
  var TypeController = TextEditingController();
  var customLocController = TextEditingController();
  var safetyController = TextEditingController();
  var satisController = TextEditingController();
  var visualController = TextEditingController();
  var terminationController = TextEditingController();
  var fluePerformController = TextEditingController();
  var applianceServiceController = TextEditingController();
  var applianceSafeController = TextEditingController();
  var coController1 = TextEditingController();
  var remedialController = TextEditingController();
  var defectsController = TextEditingController();
  var warningController = TextEditingController();
  var co2Controller1 = TextEditingController();
  var ratioController1 = TextEditingController();
  var coController2 = TextEditingController();
  var co2Controller2 = TextEditingController();
  var ratioController2 = TextEditingController();
  var FlueTypeController_2 = TextEditingController();
  var ApplianceInspectController_2 = TextEditingController();
  var OwnedByController_2 = TextEditingController();
  var operatePressureController_2 = TextEditingController();
  var ModelController_2 = TextEditingController();
  var ManafacturerController_2 = TextEditingController();
  var TypeController_2 = TextEditingController();
  var customLocController_2 = TextEditingController();
  var safetyController_2 = TextEditingController();
  var satisController_2 = TextEditingController();
  var visualController_2 = TextEditingController();
  var terminationController_2 = TextEditingController();
  var fluePerformController_2 = TextEditingController();
  var applianceServiceController_2 = TextEditingController();
  var applianceSafeController_2 = TextEditingController();
  var coController1_2 = TextEditingController();
  var remedialController_2 = TextEditingController();
  var defectsController_2 = TextEditingController();
  var warningController_2 = TextEditingController();
  var co2Controller1_2 = TextEditingController();
  var ratioController1_2 = TextEditingController();
  var coController2_2 = TextEditingController();
  var co2Controller2_2 = TextEditingController();
  var ratioController2_2 = TextEditingController();
  var FlueTypeController_3 = TextEditingController();
  var ApplianceInspectController_3 = TextEditingController();
  var OwnedByController_3 = TextEditingController();
  var operatePressureController_3 = TextEditingController();
  var ModelController_3 = TextEditingController();
  var ManafacturerController_3 = TextEditingController();
  var TypeController_3 = TextEditingController();
  var customLocController_3 = TextEditingController();
  var safetyController_3 = TextEditingController();
  var satisController_3 = TextEditingController();
  var visualController_3 = TextEditingController();
  var terminationController_3 = TextEditingController();
  var fluePerformController_3 = TextEditingController();
  var applianceServiceController_3 = TextEditingController();
  var applianceSafeController_3 = TextEditingController();
  var coController1_3 = TextEditingController();
  var remedialController_3 = TextEditingController();
  var defectsController_3 = TextEditingController();
  var warningController_3 = TextEditingController();
  var co2Controller1_3 = TextEditingController();
  var ratioController1_3 = TextEditingController();
  var coController2_3 = TextEditingController();
  var co2Controller2_3 = TextEditingController();
  var ratioController2_3 = TextEditingController();
  var FlueTypeController_4 = TextEditingController();
  var ApplianceInspectController_4 = TextEditingController();
  var OwnedByController_4 = TextEditingController();
  var operatePressureController_4 = TextEditingController();
  var ModelController_4 = TextEditingController();
  var ManafacturerController_4 = TextEditingController();
  var TypeController_4 = TextEditingController();
  var customLocController_4 = TextEditingController();
  var safetyController_4 = TextEditingController();
  var satisController_4 = TextEditingController();
  var visualController_4 = TextEditingController();
  var terminationController_4 = TextEditingController();
  var fluePerformController_4 = TextEditingController();
  var applianceServiceController_4 = TextEditingController();
  var applianceSafeController_4 = TextEditingController();
  var coController1_4 = TextEditingController();
  var remedialController_4 = TextEditingController();
  var defectsController_4 = TextEditingController();
  var warningController_4 = TextEditingController();
  var co2Controller1_4 = TextEditingController();
  var ratioController1_4 = TextEditingController();
  var coController2_4 = TextEditingController();
  var co2Controller2_4 = TextEditingController();
  var ratioController2_4 = TextEditingController();
  final firestore = FirebaseFirestore.instance;
  get data => null;
  String dropdownValue = "-";
  String locValue = "-";
  String typeValue = "-";
  String currentText = "";
  String currentTextTwo = "";
  String currentTextThree = "";
  String flueValue = "-";
  bool isOwnedOne = false;
  bool isInspectOne = false;
  bool isWarning = false;
  bool isSafe = false;
  bool isSatis = false;
  bool isVisual = false;
  bool isTerminate = false;
  bool isFluePerform = false;
  bool isApplianceService = false;
  bool isApplianceSafe = false;
  bool isApp1Pressed = false;
  bool isApp2Pressed = false;
  bool isApp3Pressed = false;
  bool isApp4Pressed = false;
  String dropdownValue_2 = "-";
  String locValue_2 = "-";
  String typeValue_2 = "-";
  String currentText_2 = "";
  String currentTextTwo_2 = "";
  String currentTextThree_2 = "";
  String flueValue_2 = "-";
  bool isOwnedOne_2 = false;
  bool isInspectOne_2 = false;
  bool isWarning_2 = false;
  bool isSafe_2 = false;
  bool isSatis_2 = false;
  bool isVisual_2 = false;
  bool isTerminate_2 = false;
  bool isFluePerform_2 = false;
  bool isApplianceService_2 = false;
  bool isApplianceSafe_2 = false;
  bool isOwnedOne_3 = false;
  bool isInspectOne_3 = false;
  bool isWarning_3 = false;
  bool isSafe_3 = false;
  bool isSatis_3 = false;
  bool isVisual_3 = false;
  bool isTerminate_3 = false;
  bool isFluePerform_3 = false;
  bool isApplianceService_3 = false;
  bool isApplianceSafe_3 = false;
  String dropdownValue_3 = "-";
  String locValue_3 = "-";
  String typeValue_3 = "-";
  String currentText_3 = "";
  String currentTextTwo_3 = "";
  String currentTextThree_3 = "";
  String flueValue_3 = "-";
  bool isOwnedOne_4 = false;
  bool isInspectOne_4 = false;
  bool isWarning_4 = false;
  bool isSafe_4 = false;
  bool isSatis_4 = false;
  bool isVisual_4 = false;
  bool isTerminate_4 = false;
  bool isFluePerform_4 = false;
  bool isApplianceService_4 = false;
  bool isApplianceSafe_4 = false;
  String dropdownValue_4 = "-";
  String locValue_4 = "-";
  String typeValue_4 = "-";
  String currentText_4 = "";
  String currentTextTwo_4 = "";
  String currentTextThree_4 = "";
  String flueValue_4 = "-";
  bool isOutcomeGasInstall = false;
  bool isOutcomeGasSupply = false;
  bool isOutcomeGasTight = false;
  bool isEmergencyAccess = false;
  bool isProtective = false;
  bool alarmPresent = false;
  bool smokePresent = false;
  String isUpdate = "";

  // String _generateUserId(User? user) {
  //   if (user != null) {
  //     String uid = user.uid;
  //     return uid;
  //   }
  //   return '';
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _initDeviceId();
  // }

  // void _initDeviceId() {
  //   userId = Uuid().v4();
  // }

  @override
  void initState() {
    super.initState();
    _initUserId();
    getEmailFromShared();
  }

  void _initUserId() async {
    userId = await generateUserId();
    setState(() {});
  }

  Future<void> getEmailFromShared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userEmail = prefs.getString('Email') ?? '';

    setState(() {
      emailAdd = userEmail;
    });
  }

  Future<String> generateUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedUserId = prefs.getString('userID');
    if (storedUserId != null && storedUserId.isNotEmpty) {
      return storedUserId;
    } else {
      var uuid = Uuid();
      userId = uuid.v4();
      await prefs.setString('userID', userId);
      return userId;
    }
  }

  void sendEmail() async {
    String recipientEmail =
        'lboyd@hotmail.co.uk'; // Replace with recipient's email
    String subject = 'Report Reminder, for', post; // Replace with your subject
    String body =
        'This is a link to renew the gas safety report using the GasCert application'; // Replace with your email body

    DateTime now = DateTime.now();
    DateTime oneYearLater = now.add(Duration(days: 365));
    String formatDate =
        '${oneYearLater.year}${oneYearLater.month.toString().padLeft(2, '0')}${oneYearLater.day.toString().padLeft(2, '0')}T${oneYearLater.hour.toString().padLeft(2, '0')}${oneYearLater.minute.toString().padLeft(2, '0')}${oneYearLater.second.toString().padLeft(2, '0')}Z';
    String calendarLink =
        'https://www.google.com/calendar/render?action=TEMPLATE&text=Report+Renewal&dates=${formatDate}/${formatDate}&details=Event+details&location=Event+location';

    body += calendarLink;

    String mailtoLink = 'mailto:$recipientEmail?subject=$subject&body=$body';

    if (await canLaunch(mailtoLink)) {
      await launch(mailtoLink);
    } else {
      throw 'Could not launch email';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: SingleChildScrollView(
                child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(left: 25.0, top: 70.0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => HomePageScreen()));
                    },
                    child: Icon(Icons.undo,
                        size: 34.0, semanticLabel: 'Go back'))),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Create Report',
                    style: TextStyle(
                      fontSize: 29.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 90),
            Center(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CustomerDetails()),
                  );
                }, // Add onPressed here for opening the language screen
                style: ButtonStyle(
                  side: MaterialStateProperty.all<BorderSide>(
                    BorderSide(width: 1.0, color: Colors.black),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(
                    Size(300.0, 40.0), // Set the width and height of the button
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.green.shade200,
                  ),
                ),
                child: Text(
                  'Customer Details',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Appliance1()),
                  );
                }, // Add onPressed here for opening the language screen
                style: ButtonStyle(
                  side: MaterialStateProperty.all<BorderSide>(
                    BorderSide(width: 1.0, color: Colors.black),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(
                    Size(300.0, 40.0), // Set the width and height of the button
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.green.shade200,
                  ),
                ),
                child: Text(
                  'Appliance 1',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Appliance2()),
                  );
                }, // Add onPressed here for opening the language screen
                style: ButtonStyle(
                  side: MaterialStateProperty.all<BorderSide>(
                    BorderSide(width: 1.0, color: Colors.black),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(
                    Size(300.0, 40.0), // Set the width and height of the button
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.green.shade200,
                  ),
                ),
                child: Text(
                  'Appliance 2',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Appliance3()),
                  );
                }, // Add onPressed here for opening the language screen
                style: ButtonStyle(
                  side: MaterialStateProperty.all<BorderSide>(
                    BorderSide(width: 1.0, color: Colors.black),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(
                    Size(300.0, 40.0), // Set the width and height of the button
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.green.shade200,
                  ),
                ),
                child: Text(
                  'Appliance 3',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Appliance4()),
                  );
                }, // Add onPressed here for opening the language screen
                style: ButtonStyle(
                  side: MaterialStateProperty.all<BorderSide>(
                    BorderSide(width: 1.0, color: Colors.black),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(
                    Size(300.0, 40.0), // Set the width and height of the button
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.green.shade200,
                  ),
                ),
                child: Text(
                  'Appliance 4',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FinalChecks()),
                  );
                }, // Add onPressed here for opening the language screen
                style: ButtonStyle(
                  side: MaterialStateProperty.all<BorderSide>(
                    BorderSide(width: 1.0, color: Colors.black),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(
                    Size(300.0, 40.0), // Set the width and height of the button
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.green.shade200,
                  ),
                ),
                child: Text(
                  'Final Checks',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: OutlinedButton(
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  String title = prefs.getString('title') ?? '';
                  String firstName = prefs.getString('firstName') ?? '';
                  String lastName = prefs.getString('lastName') ?? '';
                  String post = prefs.getString('post') ?? '';
                  String address = prefs.getString('address') ?? '';
                  String town = prefs.getString('town') ?? '';
                  String location = prefs.getString('location') ?? '';
                  String type = prefs.getString('type') ?? '';
                  String manafacturer = prefs.getString('manafacturer') ?? '';
                  String model = prefs.getString('model') ?? '';
                  String ownedBy = prefs.getString('ownedBy') ?? '';
                  String applianceInspect =
                      prefs.getString('applianceInspect') ?? '';
                  String flueType = prefs.getString('flueType') ?? '';
                  String opPress = prefs.getString('opPress') ?? '';
                  String safetyCorrect = prefs.getString('safetyCorrect') ?? '';
                  String satisfactory = prefs.getString('satisfactory') ?? '';
                  String visual = prefs.getString('visual') ?? '';
                  String termination = prefs.getString('termination') ?? '';
                  String fluePerformance =
                      prefs.getString('fluePerformance') ?? '';
                  String applianceService =
                      prefs.getString('applianceService') ?? '';
                  String applianceSafe = prefs.getString('applianceSafe') ?? '';
                  String CO1 = prefs.getString('CO1') ?? '';
                  String CO2 = prefs.getString('CO2') ?? '';
                  String ratio = prefs.getString('ratio') ?? '';
                  String CO1_2 = prefs.getString('CO1_2') ?? '';
                  String CO2_2 = prefs.getString('CO2_2') ?? '';
                  String ratio_2 = prefs.getString('ratio_2') ?? '';
                  String defects = prefs.getString('defects') ?? '';
                  String remedial = prefs.getString('remedial') ?? '';
                  String warningNotice = prefs.getString('warningNotice') ?? '';
                  String location2 = prefs.getString('location2') ?? '';
                  String type2 = prefs.getString('type2') ?? '';
                  String manafacturer2 = prefs.getString('manafacturer2') ?? '';
                  String model2 = prefs.getString('model2') ?? '';
                  String ownedBy2 = prefs.getString('ownedBy2') ?? '';
                  String applianceInspect2 =
                      prefs.getString('applianceInspect2') ?? '';
                  String flueType2 = prefs.getString('flueType2') ?? '';
                  String opPress2 = prefs.getString('opPress2') ?? '';
                  String safetyCorrect2 =
                      prefs.getString('safetyCorrect2') ?? '';
                  String satisfactory2 = prefs.getString('satisfactory2') ?? '';
                  String visual2 = prefs.getString('visual2') ?? '';
                  String termination2 = prefs.getString('termination2') ?? '';
                  String fluePerformance2 =
                      prefs.getString('fluePerformance2') ?? '';
                  String applianceService2 =
                      prefs.getString('applianceService2') ?? '';
                  String applianceSafe2 =
                      prefs.getString('applianceSafe2') ?? '';
                  String CO12 = prefs.getString('CO1_2') ?? '';
                  String CO22 = prefs.getString('CO2_2') ?? '';
                  String ratio2 = prefs.getString('ratio_2') ?? '';
                  String CO1_2_2 = prefs.getString('CO1_2_2') ?? '';
                  String CO2_2_2 = prefs.getString('CO2_2_2') ?? '';
                  String ratio_2_2 = prefs.getString('ratio_2_2') ?? '';
                  String defects2 = prefs.getString('defects2') ?? '';
                  String remedial2 = prefs.getString('remedial2') ?? '';
                  String warningNotice2 =
                      prefs.getString('warningNotice2') ?? '';
                  String location3 = prefs.getString('location3') ?? '';
                  String type3 = prefs.getString('type3') ?? '';
                  String manafacturer3 = prefs.getString('manafacturer3') ?? '';
                  String model3 = prefs.getString('model3') ?? '';
                  String ownedBy3 = prefs.getString('ownedBy3') ?? '';
                  String applianceInspect3 =
                      prefs.getString('applianceInspect3') ?? '';
                  String flueType3 = prefs.getString('flueType3') ?? '';
                  String opPress3 = prefs.getString('opPress3') ?? '';
                  String safetyCorrect3 =
                      prefs.getString('safetyCorrect3') ?? '';
                  String satisfactory3 = prefs.getString('satisfactory3') ?? '';
                  String visual3 = prefs.getString('visual3') ?? '';
                  String termination3 = prefs.getString('termination3') ?? '';
                  String fluePerformance3 =
                      prefs.getString('fluePerformance3') ?? '';
                  String applianceService3 =
                      prefs.getString('applianceService3') ?? '';
                  String applianceSafe3 =
                      prefs.getString('applianceSafe3') ?? '';
                  String CO13 = prefs.getString('CO1_3') ?? '';
                  String CO23 = prefs.getString('CO2_3') ?? '';
                  String ratio3 = prefs.getString('ratio_3') ?? '';
                  String CO1_2_3 = prefs.getString('CO1_2_3') ?? '';
                  String CO2_2_3 = prefs.getString('CO2_2_3') ?? '';
                  String ratio_2_3 = prefs.getString('ratio_2_3') ?? '';
                  String defects3 = prefs.getString('defects3') ?? '';
                  String remedial3 = prefs.getString('remedial3') ?? '';
                  String warningNotice3 =
                      prefs.getString('warningNotice3') ?? '';
                  String location4 = prefs.getString('location4') ?? '';
                  String type4 = prefs.getString('type4') ?? '';
                  String manafacturer4 = prefs.getString('manafacturer4') ?? '';
                  String model4 = prefs.getString('model4') ?? '';
                  String ownedBy4 = prefs.getString('ownedBy4') ?? '';
                  String applianceInspect4 =
                      prefs.getString('applianceInspect4') ?? '';
                  String flueType4 = prefs.getString('flueType4') ?? '';
                  String opPress4 = prefs.getString('opPress4') ?? '';
                  String safetyCorrect4 =
                      prefs.getString('safetyCorrect4') ?? '';
                  String satisfactory4 = prefs.getString('satisfactory4') ?? '';
                  String visual4 = prefs.getString('visual4') ?? '';
                  String termination4 = prefs.getString('termination4') ?? '';
                  String fluePerformance4 =
                      prefs.getString('fluePerformance4') ?? '';
                  String applianceService4 =
                      prefs.getString('applianceService4') ?? '';
                  String applianceSafe4 =
                      prefs.getString('applianceSafe4') ?? '';
                  String CO14 = prefs.getString('CO1_4') ?? '';
                  String CO24 = prefs.getString('CO2_4') ?? '';
                  String ratio4 = prefs.getString('ratio_4') ?? '';
                  String CO1_2_4 = prefs.getString('CO1_2_4') ?? '';
                  String CO2_2_4 = prefs.getString('CO2_2_4') ?? '';
                  String ratio_2_4 = prefs.getString('ratio_2_4') ?? '';
                  String defects4 = prefs.getString('defects4') ?? '';
                  String remedial4 = prefs.getString('remedial4') ?? '';
                  String warningNotice4 =
                      prefs.getString('warningNotice4') ?? '';
                  String gasInstall = prefs.getString('gasInstall') ?? '';
                  String gasSupply = prefs.getString('gasSupply') ?? '';
                  String gasTight = prefs.getString('gasTight') ?? '';
                  String control = prefs.getString('emergencyControl') ?? '';
                  String protective = prefs.getString('protective') ?? '';
                  String alarm = prefs.getString('alarmPresent') ?? '';
                  String smoke = prefs.getString('smokePresent') ?? '';
                  bool isApp1Used = prefs.getBool('isApp1Used') ?? false;
                  bool isApp2Used = prefs.getBool('isApp2Used') ?? false;
                  bool isApp3Used = prefs.getBool('isApp3Used') ?? false;
                  bool isApp4Used = prefs.getBool('isApp4Used') ?? false;
                  String testing = 'TESTING';
                  String userID = prefs.getString('userID') ?? '';
                  String uniqueId = firstName + lastName + post;
                  await prefs.setString('uniId', uniqueId);
                  Random random = Random();
                  List<int> randomNum =
                      List.generate(10, ((index) => random.nextInt(10)));
                  String reportRefNum = randomNum.join('');
                  var now = new DateTime.now();
                  var format = new DateFormat('dd-MM-yyyy');
                  String formatDate = format.format(now);
                  var nextyear = now.add(Duration(days: 365));
                  String formatNext = format.format(nextyear);
                  print(formatDate);
                  print(formatNext);

                  print(isApp1Used);
                  print(isApp2Used);
                  print(isApp3Used);
                  print(isApp4Used);

                  if (title.isEmpty) {
                    title = "-";
                  }
                  if (firstName.isEmpty) {
                    firstName = "";
                  }
                  if (lastName.isEmpty) {
                    lastName = "-";
                  }
                  if (post.isEmpty) {
                    post = "-";
                  }
                  if (address.isEmpty) {
                    address = "-";
                  }
                  if (town.isEmpty) {
                    town = "-";
                  }
                  if (isApp1Used == false) {
                    firestore.collection("customers").add({
                      "Title": title,
                      "Customer First Name": firstName,
                      "Customer Last Name": lastName,
                      "Customer Postcode": post,
                      "Customer Address": address,
                      "Customer Town/City": town,
                      "Outcome of gas installation pipework visual inspection":
                          gasInstall,
                      "Outcome of gas supply pipework visual inspection":
                          gasSupply,
                      "Outcome of gas tightness test": gasTight,
                      "Is the emergency control valve access satisfactory?":
                          control,
                      "Is the protective equipotential bonding satisfactory?":
                          protective,
                      "CO alarm present & working": alarm,
                      "Smoke alarm present & working": smoke,
                      "ReportID": uniqueId,
                      "UserID": userID,
                      "Report Reference No.": reportRefNum,
                      "Date of report": formatDate,
                      "Date of next report": formatNext,
                    });

                    Map<String, dynamic> reportData = {
                      "Title": title,
                      "Customer First Name": firstName,
                      "Customer Last Name": lastName,
                      "Customer Postcode": post,
                      "Customer Address": address,
                      "Customer Town/City": town,
                      "Outcome of gas installation pipework visual inspection":
                          gasInstall,
                      "Outcome of gas supply pipework visual inspection":
                          gasSupply,
                      "Outcome of gas tightness test": gasTight,
                      "Is the emergency control valve access satisfactory?":
                          control,
                      "Is the protective equipotential bonding satisfactory?":
                          protective,
                      "CO alarm present & working": alarm,
                      "Smoke alarm present & working": smoke,
                      "ReportID": uniqueId,
                      "UserID": userID,
                      "Report Reference No.": reportRefNum,
                      "Date of report": formatDate,
                      "Date of next report": formatNext,
                    };
                    String jsonData = jsonEncode(reportData);
                    final directory = await getApplicationDocumentsDirectory();
                    File reportFile = File('${directory.path}/$uniqueId.json');
                    await reportFile.writeAsString(jsonData);
                    print('Report created at: ${reportFile.path}');
                  }
                  if (isApp1Used == true && isApp2Used == false) {
                    firestore.collection("customers").add({
                      "Title": title,
                      "Customer First Name": firstName,
                      "Customer Last Name": lastName,
                      "Customer Postcode": post,
                      "Customer Address": address,
                      "Customer Town/City": town,
                      "Appliance 1 Location": location,
                      "Appliance 1 Type": type,
                      "Appliance 1 Manafacturer": manafacturer,
                      "Appliance 1 Model": model,
                      "Appliance 1 - Owned By Landlord": ownedBy,
                      "Appliance 1 - Appliance Inspected": applianceInspect,
                      "Appliance 1 - Flue Type": flueType,
                      "Appliance 1 - Operating Pressure": opPress,
                      "Appliance 1 - Safety devices operating correctly":
                          safetyCorrect,
                      "Appliance 1 - Satisfactory Ventilation": satisfactory,
                      "Appliance 1 - Visual Condition of Flue": visual,
                      "Appliance 1 - Termination satisfactory": termination,
                      "Appliance 1 - Flue performance checks complete":
                          fluePerformance,
                      "Appliance 1 - Was Appliance Serviced?": applianceService,
                      "Appliance 1 - Is appliance safe to use?": applianceSafe,
                      "Appliance 1 - Reading 1/Min - CO": CO1,
                      "Appliance 1 - Reading 1/Min - CO2": CO2,
                      "Appliance 1 - Reading 1/Min - Ratio": ratio,
                      "Appliance 1 - Reading 2/Max - CO": CO1_2,
                      "Appliance 1 - Reading 2/Max - CO2": CO2,
                      "Appliance 1 - Reading 2/Max - Ratio": ratio_2,
                      "Appliance 1 - Defects Identified": defects,
                      "Appliance 1 - Remedial Action Taken": remedial,
                      "Appliance 1 - Has warning notice been issued?":
                          warningNotice,
                      "Outcome of gas installation pipework visual inspection":
                          gasInstall,
                      "Outcome of gas supply pipework visual inspection":
                          gasSupply,
                      "Outcome of gas tightness test": gasTight,
                      "Is the emergency control valve access satisfactory?":
                          control,
                      "Is the protective equipotential bonding satisfactory?":
                          protective,
                      "CO alarm present & working": alarm,
                      "Smoke alarm present & working": smoke,
                      "TESTING": testing,
                      "UserID": userID,
                      "ReportID": uniqueId,
                      "Report Reference No.": reportRefNum,
                      "Date of report": formatDate,
                      "Date of next report": formatNext,
                    });

                    Map<String, dynamic> reportData = {
                      "Title": title,
                      "Customer First Name": firstName,
                      "Customer Last Name": lastName,
                      "Customer Postcode": post,
                      "Customer Address": address,
                      "Customer Town/City": town,
                      "Appliance 1 Location": location,
                      "Appliance 1 Type": type,
                      "Appliance 1 Manafacturer": manafacturer,
                      "Appliance 1 Model": model,
                      "Appliance 1 - Owned By Landlord": ownedBy,
                      "Appliance 1 - Appliance Inspected": applianceInspect,
                      "Appliance 1 - Flue Type": flueType,
                      "Appliance 1 - Operating Pressure": opPress,
                      "Appliance 1 - Safety devices operating correctly":
                          safetyCorrect,
                      "Appliance 1 - Satisfactory Ventilation": satisfactory,
                      "Appliance 1 - Visual Condition of Flue": visual,
                      "Appliance 1 - Termination satisfactory": termination,
                      "Appliance 1 - Flue performance checks complete":
                          fluePerformance,
                      "Appliance 1 - Was Appliance Serviced?": applianceService,
                      "Appliance 1 - Is appliance safe to use?": applianceSafe,
                      "Appliance 1 - Reading 1/Min - CO": CO1,
                      "Appliance 1 - Reading 1/Min - CO2": CO2,
                      "Appliance 1 - Reading 1/Min - Ratio": ratio,
                      "Appliance 1 - Reading 2/Max - CO": CO1_2,
                      "Appliance 1 - Reading 2/Max - CO2": CO2,
                      "Appliance 1 - Reading 2/Max - Ratio": ratio_2,
                      "Appliance 1 - Defects Identified": defects,
                      "Appliance 1 - Remedial Action Taken": remedial,
                      "Appliance 1 - Has warning notice been issued?":
                          warningNotice,
                      "Outcome of gas installation pipework visual inspection":
                          gasInstall,
                      "Outcome of gas supply pipework visual inspection":
                          gasSupply,
                      "Outcome of gas tightness test": gasTight,
                      "Is the emergency control valve access satisfactory?":
                          control,
                      "Is the protective equipotential bonding satisfactory?":
                          protective,
                      "CO alarm present & working": alarm,
                      "Smoke alarm present & working": smoke,
                      "TESTING": testing,
                      "UserID": userID,
                      "ReportID": uniqueId,
                      "Report Reference No.": reportRefNum,
                      "Date of report": formatDate,
                      "Date of next report": formatNext,
                    };
                    String jsonData = jsonEncode(reportData);
                    final directory = await getApplicationDocumentsDirectory();
                    File reportFile = File('${directory.path}/$uniqueId.json');

                    await reportFile.writeAsString(jsonData);

                    print('Report created at: ${reportFile.path}');
                  }

                  if (isApp1Used == true &&
                      isApp2Used == true &&
                      isApp3Used == false) {
                    firestore.collection("customers").add({
                      "Title": title,
                      "Customer First Name": firstName,
                      "Customer Last Name": lastName,
                      "Customer Postcode": post,
                      "Customer Address": address,
                      "Customer Town/City": town,
                      "Appliance 1 Location": location,
                      "Appliance 1 Type": type,
                      "Appliance 1 Manafacturer": manafacturer,
                      "Appliance 1 Model": model,
                      "Appliance 1 - Owned By Landlord": ownedBy,
                      "Appliance 1 - Appliance Inspected": applianceInspect,
                      "Appliance 1 - Flue Type": flueType,
                      "Appliance 1 - Operating Pressure": opPress,
                      "Appliance 1 - Safety devices operating correctly":
                          safetyCorrect,
                      "Appliance 1 - Satisfactory Ventilation": satisfactory,
                      "Appliance 1 - Visual Condition of Flue": visual,
                      "Appliance 1 - Termination satisfactory": termination,
                      "Appliance 1 - Flue performance checks complete":
                          fluePerformance,
                      "Appliance 1 - Was Appliance Serviced?": applianceService,
                      "Appliance 1 - Is appliance safe to use?": applianceSafe,
                      "Appliance 1 - Reading 1/Min - CO": CO1,
                      "Appliance 1 - Reading 1/Min - CO2": CO2,
                      "Appliance 1 - Reading 1/Min - Ratio": ratio,
                      "Appliance 1 - Reading 2/Max - CO": CO1_2,
                      "Appliance 1 - Reading 2/Max - CO2": CO2,
                      "Appliance 1 - Reading 2/Max - Ratio": ratio_2,
                      "Appliance 1 - Defects Identified": defects,
                      "Appliance 1 - Remedial Action Taken": remedial,
                      "Appliance 1 - Has warning notice been issued?":
                          warningNotice,
                      "Appliance 2 Location": location2,
                      "Appliance 2 Type": type2,
                      "Appliance 2 Manafacturer": manafacturer2,
                      "Appliance 2 Model": model2,
                      "Appliance 2 - Owned By Landlord": ownedBy2,
                      "Appliance 2 - Appliance Inspected": applianceInspect2,
                      "Appliance 2 - Flue Type": flueType2,
                      "Appliance 2 - Operating Pressure": opPress2,
                      "Appliance 2 - Safety devices operating correctly":
                          safetyCorrect2,
                      "Appliance 2 - Satisfactory Ventilation": satisfactory2,
                      "Appliance 2 - Visual Condition of Flue": visual2,
                      "Appliance 2 - Termination satisfactory": termination2,
                      "Appliance 2 - Flue performance checks complete":
                          fluePerformance2,
                      "Appliance 2 - Was Appliance Serviced?":
                          applianceService2,
                      "Appliance 2 - Is appliance safe to use?": applianceSafe2,
                      "Appliance 2 - Reading 1/Min - CO": CO1_2,
                      "Appliance 2 - Reading 1/Min - CO2": CO2_2,
                      "Appliance 2 - Reading 1/Min - Ratio": ratio_2,
                      "Appliance 2 - Reading 2/Max - CO": CO1_2_2,
                      "Appliance 2 - Reading 2/Max - CO2": CO2_2_2,
                      "Appliance 2 - Reading 2/Max - Ratio": ratio_2_2,
                      "Appliance 2 - Defects Identified": defects2,
                      "Appliance 2 - Remedial Action Taken": remedial2,
                      "Appliance 2 - Has warning notice been issued?":
                          warningNotice2,
                      "Outcome of gas installation pipework visual inspection":
                          gasInstall,
                      "Outcome of gas supply pipework visual inspection":
                          gasSupply,
                      "Outcome of gas tightness test": gasTight,
                      "Is the emergency control valve access satisfactory?":
                          control,
                      "Is the protective equipotential bonding satisfactory?":
                          protective,
                      "CO alarm present & working": alarm,
                      "Smoke alarm present & working": smoke,
                      "UserID": userID,
                      "ReportID": uniqueId,
                      "Report Reference No.": reportRefNum,
                      "Date of report": formatDate,
                      "Date of next report": formatNext,
                    });
                    Map<String, dynamic> reportData = {
                      "Title": title,
                      "Customer First Name": firstName,
                      "Customer Last Name": lastName,
                      "Customer Postcode": post,
                      "Customer Address": address,
                      "Customer Town/City": town,
                      "Appliance 1 Location": location,
                      "Appliance 1 Type": type,
                      "Appliance 1 Manafacturer": manafacturer,
                      "Appliance 1 Model": model,
                      "Appliance 1 - Owned By Landlord": ownedBy,
                      "Appliance 1 - Appliance Inspected": applianceInspect,
                      "Appliance 1 - Flue Type": flueType,
                      "Appliance 1 - Operating Pressure": opPress,
                      "Appliance 1 - Safety devices operating correctly":
                          safetyCorrect,
                      "Appliance 1 - Satisfactory Ventilation": satisfactory,
                      "Appliance 1 - Visual Condition of Flue": visual,
                      "Appliance 1 - Termination satisfactory": termination,
                      "Appliance 1 - Flue performance checks complete":
                          fluePerformance,
                      "Appliance 1 - Was Appliance Serviced?": applianceService,
                      "Appliance 1 - Is appliance safe to use?": applianceSafe,
                      "Appliance 1 - Reading 1/Min - CO": CO1,
                      "Appliance 1 - Reading 1/Min - CO2": CO2,
                      "Appliance 1 - Reading 1/Min - Ratio": ratio,
                      "Appliance 1 - Reading 2/Max - CO": CO1_2,
                      "Appliance 1 - Reading 2/Max - CO2": CO2,
                      "Appliance 1 - Reading 2/Max - Ratio": ratio_2,
                      "Appliance 1 - Defects Identified": defects,
                      "Appliance 1 - Remedial Action Taken": remedial,
                      "Appliance 1 - Has warning notice been issued?":
                          warningNotice,
                      "Appliance 2 Location": location2,
                      "Appliance 2 Type": type2,
                      "Appliance 2 Manafacturer": manafacturer2,
                      "Appliance 2 Model": model2,
                      "Appliance 2 - Owned By Landlord": ownedBy2,
                      "Appliance 2 - Appliance Inspected": applianceInspect2,
                      "Appliance 2 - Flue Type": flueType2,
                      "Appliance 2 - Operating Pressure": opPress2,
                      "Appliance 2 - Safety devices operating correctly":
                          safetyCorrect2,
                      "Appliance 2 - Satisfactory Ventilation": satisfactory2,
                      "Appliance 2 - Visual Condition of Flue": visual2,
                      "Appliance 2 - Termination satisfactory": termination2,
                      "Appliance 2 - Flue performance checks complete":
                          fluePerformance2,
                      "Appliance 2 - Was Appliance Serviced?":
                          applianceService2,
                      "Appliance 2 - Is appliance safe to use?": applianceSafe2,
                      "Appliance 2 - Reading 1/Min - CO": CO1_2,
                      "Appliance 2 - Reading 1/Min - CO2": CO2_2,
                      "Appliance 2 - Reading 1/Min - Ratio": ratio_2,
                      "Appliance 2 - Reading 2/Max - CO": CO1_2_2,
                      "Appliance 2 - Reading 2/Max - CO2": CO2_2_2,
                      "Appliance 2 - Reading 2/Max - Ratio": ratio_2_2,
                      "Appliance 2 - Defects Identified": defects2,
                      "Appliance 2 - Remedial Action Taken": remedial2,
                      "Appliance 2 - Has warning notice been issued?":
                          warningNotice2,
                      "Outcome of gas installation pipework visual inspection":
                          gasInstall,
                      "Outcome of gas supply pipework visual inspection":
                          gasSupply,
                      "Outcome of gas tightness test": gasTight,
                      "Is the emergency control valve access satisfactory?":
                          control,
                      "Is the protective equipotential bonding satisfactory?":
                          protective,
                      "CO alarm present & working": alarm,
                      "Smoke alarm present & working": smoke,
                      "UserID": userID,
                      "ReportID": uniqueId,
                      "Report Reference No.": reportRefNum,
                      "Date of report": formatDate,
                      "Date of next report": formatNext,
                    };
                    String jsonData = jsonEncode(reportData);

                    final directory = await getApplicationDocumentsDirectory();

                    File reportFile = File('${directory.path}/$uniqueId.json');

                    await reportFile.writeAsString(jsonData);

                    print('Report created at: ${reportFile.path}');
                  }

                  if (isApp1Used == true &&
                      isApp2Used == true &&
                      isApp3Used == true &&
                      isApp4Used == false) {
                    firestore.collection("customers").add({
                      "Title": title,
                      "Customer First Name": firstName,
                      "Customer Last Name": lastName,
                      "Customer Postcode": post,
                      "Customer Address": address,
                      "Customer Town/City": town,
                      "Appliance 1 Location": location,
                      "Appliance 1 Type": type,
                      "Appliance 1 Manafacturer": manafacturer,
                      "Appliance 1 Model": model,
                      "Appliance 1 - Owned By Landlord": ownedBy,
                      "Appliance 1 - Appliance Inspected": applianceInspect,
                      "Appliance 1 - Flue Type": flueType,
                      "Appliance 1 - Operating Pressure": opPress,
                      "Appliance 1 - Safety devices operating correctly":
                          safetyCorrect,
                      "Appliance 1 - Satisfactory Ventilation": satisfactory,
                      "Appliance 1 - Visual Condition of Flue": visual,
                      "Appliance 1 - Termination satisfactory": termination,
                      "Appliance 1 - Flue performance checks complete":
                          fluePerformance,
                      "Appliance 1 - Was Appliance Serviced?": applianceService,
                      "Appliance 1 - Is appliance safe to use?": applianceSafe,
                      "Appliance 1 - Reading 1/Min - CO": CO1,
                      "Appliance 1 - Reading 1/Min - CO2": CO2,
                      "Appliance 1 - Reading 1/Min - Ratio": ratio,
                      "Appliance 1 - Reading 2/Max - CO": CO1_2,
                      "Appliance 1 - Reading 2/Max - CO2": CO2,
                      "Appliance 1 - Reading 2/Max - Ratio": ratio_2,
                      "Appliance 1 - Defects Identified": defects,
                      "Appliance 1 - Remedial Action Taken": remedial,
                      "Appliance 1 - Has warning notice been issued?":
                          warningNotice,
                      "Appliance 2 Location": location2,
                      "Appliance 2 Type": type2,
                      "Appliance 2 Manafacturer": manafacturer2,
                      "Appliance 2 Model": model2,
                      "Appliance 2 - Owned By Landlord": ownedBy2,
                      "Appliance 2 - Appliance Inspected": applianceInspect2,
                      "Appliance 2 - Flue Type": flueType2,
                      "Appliance 2 - Operating Pressure": opPress2,
                      "Appliance 2 - Safety devices operating correctly":
                          safetyCorrect2,
                      "Appliance 2 - Satisfactory Ventilation": satisfactory2,
                      "Appliance 2 - Visual Condition of Flue": visual2,
                      "Appliance 2 - Termination satisfactory": termination2,
                      "Appliance 2 - Flue performance checks complete":
                          fluePerformance2,
                      "Appliance 2 - Was Appliance Serviced?":
                          applianceService2,
                      "Appliance 2 - Is appliance safe to use?": applianceSafe2,
                      "Appliance 2 - Reading 1/Min - CO": CO1_2,
                      "Appliance 2 - Reading 1/Min - CO2": CO2_2,
                      "Appliance 2 - Reading 1/Min - Ratio": ratio_2,
                      "Appliance 2 - Reading 2/Max - CO": CO1_2_2,
                      "Appliance 2 - Reading 2/Max - CO2": CO2_2_2,
                      "Appliance 2 - Reading 2/Max - Ratio": ratio_2_2,
                      "Appliance 2 - Defects Identified": defects2,
                      "Appliance 2 - Remedial Action Taken": remedial2,
                      "Appliance 2 - Has warning notice been issued?":
                          warningNotice2,
                      "Appliance 3 Location": location3,
                      "Appliance 3 Type": type3,
                      "Appliance 3 Manafacturer": manafacturer3,
                      "Appliance 3 Model": model3,
                      "Appliance 3 - Owned By Landlord": ownedBy3,
                      "Appliance 3 - Appliance Inspected": applianceInspect3,
                      "Appliance 3 - Flue Type": flueType3,
                      "Appliance 3 - Operating Pressure": opPress3,
                      "Appliance 3 - Safety devices operating correctly":
                          safetyCorrect3,
                      "Appliance 3 - Satisfactory Ventilation": satisfactory3,
                      "Appliance 3 - Visual Condition of Flue": visual3,
                      "Appliance 3 - Termination satisfactory": termination3,
                      "Appliance 3 - Flue performance checks complete":
                          fluePerformance3,
                      "Appliance 3 - Was Appliance Serviced?":
                          applianceService3,
                      "Appliance 3 - Is appliance safe to use?": applianceSafe3,
                      "Appliance 3 - Reading 1/Min - CO": CO13,
                      "Appliance 3 - Reading 1/Min - CO2": CO23,
                      "Appliance 3 - Reading 1/Min - Ratio": ratio3,
                      "Appliance 3 - Reading 2/Max - CO": CO1_2_3,
                      "Appliance 3 - Reading 2/Max - CO2": CO2_2_3,
                      "Appliance 3 - Reading 2/Max - Ratio": ratio_2_3,
                      "Appliance 3 - Defects Identified": defects3,
                      "Appliance 3 - Remedial Action Taken": remedial3,
                      "Appliance 3 - Has warning notice been issued?":
                          warningNotice3,
                      "Outcome of gas installation pipework visual inspection":
                          gasInstall,
                      "Outcome of gas supply pipework visual inspection":
                          gasSupply,
                      "Outcome of gas tightness test": gasTight,
                      "Is the emergency control valve access satisfactory?":
                          control,
                      "Is the protective equipotential bonding satisfactory?":
                          protective,
                      "CO alarm present & working": alarm,
                      "Smoke alarm present & working": smoke,
                      "UserID": userID,
                      "ReportID": uniqueId,
                      "Report Reference No.": reportRefNum,
                      "Date of report": formatDate,
                      "Date of next report": formatNext,
                    });
                    Map<String, dynamic> reportData = {
                      "Title": title,
                      "Customer First Name": firstName,
                      "Customer Last Name": lastName,
                      "Customer Postcode": post,
                      "Customer Address": address,
                      "Customer Town/City": town,
                      "Appliance 1 Location": location,
                      "Appliance 1 Type": type,
                      "Appliance 1 Manafacturer": manafacturer,
                      "Appliance 1 Model": model,
                      "Appliance 1 - Owned By Landlord": ownedBy,
                      "Appliance 1 - Appliance Inspected": applianceInspect,
                      "Appliance 1 - Flue Type": flueType,
                      "Appliance 1 - Operating Pressure": opPress,
                      "Appliance 1 - Safety devices operating correctly":
                          safetyCorrect,
                      "Appliance 1 - Satisfactory Ventilation": satisfactory,
                      "Appliance 1 - Visual Condition of Flue": visual,
                      "Appliance 1 - Termination satisfactory": termination,
                      "Appliance 1 - Flue performance checks complete":
                          fluePerformance,
                      "Appliance 1 - Was Appliance Serviced?": applianceService,
                      "Appliance 1 - Is appliance safe to use?": applianceSafe,
                      "Appliance 1 - Reading 1/Min - CO": CO1,
                      "Appliance 1 - Reading 1/Min - CO2": CO2,
                      "Appliance 1 - Reading 1/Min - Ratio": ratio,
                      "Appliance 1 - Reading 2/Max - CO": CO1_2,
                      "Appliance 1 - Reading 2/Max - CO2": CO2,
                      "Appliance 1 - Reading 2/Max - Ratio": ratio_2,
                      "Appliance 1 - Defects Identified": defects,
                      "Appliance 1 - Remedial Action Taken": remedial,
                      "Appliance 1 - Has warning notice been issued?":
                          warningNotice,
                      "Appliance 2 Location": location2,
                      "Appliance 2 Type": type2,
                      "Appliance 2 Manafacturer": manafacturer2,
                      "Appliance 2 Model": model2,
                      "Appliance 2 - Owned By Landlord": ownedBy2,
                      "Appliance 2 - Appliance Inspected": applianceInspect2,
                      "Appliance 2 - Flue Type": flueType2,
                      "Appliance 2 - Operating Pressure": opPress2,
                      "Appliance 2 - Safety devices operating correctly":
                          safetyCorrect2,
                      "Appliance 2 - Satisfactory Ventilation": satisfactory2,
                      "Appliance 2 - Visual Condition of Flue": visual2,
                      "Appliance 2 - Termination satisfactory": termination2,
                      "Appliance 2 - Flue performance checks complete":
                          fluePerformance2,
                      "Appliance 2 - Was Appliance Serviced?":
                          applianceService2,
                      "Appliance 2 - Is appliance safe to use?": applianceSafe2,
                      "Appliance 2 - Reading 1/Min - CO": CO1_2,
                      "Appliance 2 - Reading 1/Min - CO2": CO2_2,
                      "Appliance 2 - Reading 1/Min - Ratio": ratio_2,
                      "Appliance 2 - Reading 2/Max - CO": CO1_2_2,
                      "Appliance 2 - Reading 2/Max - CO2": CO2_2_2,
                      "Appliance 2 - Reading 2/Max - Ratio": ratio_2_2,
                      "Appliance 2 - Defects Identified": defects2,
                      "Appliance 2 - Remedial Action Taken": remedial2,
                      "Appliance 2 - Has warning notice been issued?":
                          warningNotice2,
                      "Appliance 3 Location": location3,
                      "Appliance 3 Type": type3,
                      "Appliance 3 Manafacturer": manafacturer3,
                      "Appliance 3 Model": model3,
                      "Appliance 3 - Owned By Landlord": ownedBy3,
                      "Appliance 3 - Appliance Inspected": applianceInspect3,
                      "Appliance 3 - Flue Type": flueType3,
                      "Appliance 3 - Operating Pressure": opPress3,
                      "Appliance 3 - Safety devices operating correctly":
                          safetyCorrect3,
                      "Appliance 3 - Satisfactory Ventilation": satisfactory3,
                      "Appliance 3 - Visual Condition of Flue": visual3,
                      "Appliance 3 - Termination satisfactory": termination3,
                      "Appliance 3 - Flue performance checks complete":
                          fluePerformance3,
                      "Appliance 3 - Was Appliance Serviced?":
                          applianceService3,
                      "Appliance 3 - Is appliance safe to use?": applianceSafe3,
                      "Appliance 3 - Reading 1/Min - CO": CO13,
                      "Appliance 3 - Reading 1/Min - CO2": CO23,
                      "Appliance 3 - Reading 1/Min - Ratio": ratio3,
                      "Appliance 3 - Reading 2/Max - CO": CO1_2_3,
                      "Appliance 3 - Reading 2/Max - CO2": CO2_2_3,
                      "Appliance 3 - Reading 2/Max - Ratio": ratio_2_3,
                      "Appliance 3 - Defects Identified": defects3,
                      "Appliance 3 - Remedial Action Taken": remedial3,
                      "Appliance 3 - Has warning notice been issued?":
                          warningNotice3,
                      "Outcome of gas installation pipework visual inspection":
                          gasInstall,
                      "Outcome of gas supply pipework visual inspection":
                          gasSupply,
                      "Outcome of gas tightness test": gasTight,
                      "Is the emergency control valve access satisfactory?":
                          control,
                      "Is the protective equipotential bonding satisfactory?":
                          protective,
                      "CO alarm present & working": alarm,
                      "Smoke alarm present & working": smoke,
                      "UserID": userID,
                      "ReportID": uniqueId,
                      "Report Reference No.": reportRefNum,
                      "Date of report": formatDate,
                      "Date of next report": formatNext,
                    };
                    String jsonData = jsonEncode(reportData);

                    final directory = await getApplicationDocumentsDirectory();

                    File reportFile = File('${directory.path}/$uniqueId.json');

                    await reportFile.writeAsString(jsonData);

                    print('Report created at: ${reportFile.path}');
                  }
                  if (isApp1Used == true &&
                      isApp2Used == true &&
                      isApp3Used == true &&
                      isApp4Used == true) {
                    firestore.collection("customers").add({
                      "Title": title,
                      "Customer First Name": firstName,
                      "Customer Last Name": lastName,
                      "Customer Postcode": post,
                      "Customer Address": address,
                      "Customer Town/City": town,
                      "Appliance 1 Location": location,
                      "Appliance 1 Type": type,
                      "Appliance 1 Manafacturer": manafacturer,
                      "Appliance 1 Model": model,
                      "Appliance 1 - Owned By Landlord": ownedBy,
                      "Appliance 1 - Appliance Inspected": applianceInspect,
                      "Appliance 1 - Flue Type": flueType,
                      "Appliance 1 - Operating Pressure": opPress,
                      "Appliance 1 - Safety devices operating correctly":
                          safetyCorrect,
                      "Appliance 1 - Satisfactory Ventilation": satisfactory,
                      "Appliance 1 - Visual Condition of Flue": visual,
                      "Appliance 1 - Termination satisfactory": termination,
                      "Appliance 1 - Flue performance checks complete":
                          fluePerformance,
                      "Appliance 1 - Was Appliance Serviced?": applianceService,
                      "Appliance 1 - Is appliance safe to use?": applianceSafe,
                      "Appliance 1 - Reading 1/Min - CO": CO1,
                      "Appliance 1 - Reading 1/Min - CO2": CO2,
                      "Appliance 1 - Reading 1/Min - Ratio": ratio,
                      "Appliance 1 - Reading 2/Max - CO": CO1_2,
                      "Appliance 1 - Reading 2/Max - CO2": CO2,
                      "Appliance 1 - Reading 2/Max - Ratio": ratio_2,
                      "Appliance 1 - Defects Identified": defects,
                      "Appliance 1 - Remedial Action Taken": remedial,
                      "Appliance 1 - Has warning notice been issued?":
                          warningNotice,
                      "Appliance 2 Location": location2,
                      "Appliance 2 Type": type2,
                      "Appliance 2 Manafacturer": manafacturer2,
                      "Appliance 2 Model": model2,
                      "Appliance 2 - Owned By Landlord": ownedBy2,
                      "Appliance 2 - Appliance Inspected": applianceInspect2,
                      "Appliance 2 - Flue Type": flueType2,
                      "Appliance 2 - Operating Pressure": opPress2,
                      "Appliance 2 - Safety devices operating correctly":
                          safetyCorrect2,
                      "Appliance 2 - Satisfactory Ventilation": satisfactory2,
                      "Appliance 2 - Visual Condition of Flue": visual2,
                      "Appliance 2 - Termination satisfactory": termination2,
                      "Appliance 2 - Flue performance checks complete":
                          fluePerformance2,
                      "Appliance 2 - Was Appliance Serviced?":
                          applianceService2,
                      "Appliance 2 - Is appliance safe to use?": applianceSafe2,
                      "Appliance 2 - Reading 1/Min - CO": CO1_2,
                      "Appliance 2 - Reading 1/Min - CO2": CO2_2,
                      "Appliance 2 - Reading 1/Min - Ratio": ratio_2,
                      "Appliance 2 - Reading 2/Max - CO": CO1_2_2,
                      "Appliance 2 - Reading 2/Max - CO2": CO2_2_2,
                      "Appliance 2 - Reading 2/Max - Ratio": ratio_2_2,
                      "Appliance 2 - Defects Identified": defects2,
                      "Appliance 2 - Remedial Action Taken": remedial2,
                      "Appliance 2 - Has warning notice been issued?":
                          warningNotice2,
                      "Appliance 3 Location": location3,
                      "Appliance 3 Type": type3,
                      "Appliance 3 Manafacturer": manafacturer3,
                      "Appliance 3 Model": model3,
                      "Appliance 3 - Owned By Landlord": ownedBy3,
                      "Appliance 3 - Appliance Inspected": applianceInspect3,
                      "Appliance 3 - Flue Type": flueType3,
                      "Appliance 3 - Operating Pressure": opPress3,
                      "Appliance 3 - Safety devices operating correctly":
                          safetyCorrect3,
                      "Appliance 3 - Satisfactory Ventilation": satisfactory3,
                      "Appliance 3 - Visual Condition of Flue": visual3,
                      "Appliance 3 - Termination satisfactory": termination3,
                      "Appliance 3 - Flue performance checks complete":
                          fluePerformance3,
                      "Appliance 3 - Was Appliance Serviced?":
                          applianceService3,
                      "Appliance 3 - Is appliance safe to use?": applianceSafe3,
                      "Appliance 3 - Reading 1/Min - CO": CO13,
                      "Appliance 3 - Reading 1/Min - CO2": CO23,
                      "Appliance 3 - Reading 1/Min - Ratio": ratio3,
                      "Appliance 3 - Reading 2/Max - CO": CO1_2_3,
                      "Appliance 3 - Reading 2/Max - CO2": CO2_2_3,
                      "Appliance 3 - Reading 2/Max - Ratio": ratio_2_3,
                      "Appliance 3 - Defects Identified": defects3,
                      "Appliance 3 - Remedial Action Taken": remedial3,
                      "Appliance 3 - Has warning notice been issued?":
                          warningNotice3,
                      "Appliance 4 Location": location4,
                      "Appliance 4 Type": type4,
                      "Appliance 4 Manafacturer": manafacturer4,
                      "Appliance 4 Model": model4,
                      "Appliance 4 - Owned By Landlord": ownedBy4,
                      "Appliance 4 - Appliance Inspected": applianceInspect4,
                      "Appliance 4 - Flue Type": flueType4,
                      "Appliance 4 - Operating Pressure": opPress4,
                      "Appliance 4 - Safety devices operating correctly":
                          safetyCorrect4,
                      "Appliance 4 - Satisfactory Ventilation": satisfactory4,
                      "Appliance 4 - Visual Condition of Flue": visual4,
                      "Appliance 4 - Termination satisfactory": termination4,
                      "Appliance 4 - Flue performance checks complete":
                          fluePerformance4,
                      "Appliance 4 - Was Appliance Serviced?":
                          applianceService4,
                      "Appliance 4 - Is appliance safe to use?": applianceSafe4,
                      "Appliance 4 - Reading 1/Min - CO": CO14,
                      "Appliance 4 - Reading 1/Min - CO2": CO24,
                      "Appliance 4 - Reading 1/Min - Ratio": ratio4,
                      "Appliance 4 - Reading 2/Max - CO": CO1_2_4,
                      "Appliance 4 - Reading 2/Max - CO2": CO2_2_4,
                      "Appliance 4 - Reading 2/Max - Ratio": ratio_2_4,
                      "Appliance 4 - Defects Identified": defects4,
                      "Appliance 4 - Remedial Action Taken": remedial4,
                      "Appliance 4 - Has warning notice been issued?":
                          warningNotice4,
                      "Outcome of gas installation pipework visual inspection":
                          gasInstall,
                      "Outcome of gas supply pipework visual inspection":
                          gasSupply,
                      "Outcome of gas tightness test": gasTight,
                      "Is the emergency control valve access satisfactory?":
                          control,
                      "Is the protective equipotential bonding satisfactory?":
                          protective,
                      "CO alarm present & working": alarm,
                      "Smoke alarm present & working": smoke,
                      "UserID": userID,
                      "ReportID": uniqueId,
                      "Report Reference No.": reportRefNum,
                      "Date of report": formatDate,
                      "Date of next report": formatNext,
                    });
                    Map<String, dynamic> reportData = {
                      "Title": title,
                      "Customer First Name": firstName,
                      "Customer Last Name": lastName,
                      "Customer Postcode": post,
                      "Customer Address": address,
                      "Customer Town/City": town,
                      "Appliance 1 Location": location,
                      "Appliance 1 Type": type,
                      "Appliance 1 Manafacturer": manafacturer,
                      "Appliance 1 Model": model,
                      "Appliance 1 - Owned By Landlord": ownedBy,
                      "Appliance 1 - Appliance Inspected": applianceInspect,
                      "Appliance 1 - Flue Type": flueType,
                      "Appliance 1 - Operating Pressure": opPress,
                      "Appliance 1 - Safety devices operating correctly":
                          safetyCorrect,
                      "Appliance 1 - Satisfactory Ventilation": satisfactory,
                      "Appliance 1 - Visual Condition of Flue": visual,
                      "Appliance 1 - Termination satisfactory": termination,
                      "Appliance 1 - Flue performance checks complete":
                          fluePerformance,
                      "Appliance 1 - Was Appliance Serviced?": applianceService,
                      "Appliance 1 - Is appliance safe to use?": applianceSafe,
                      "Appliance 1 - Reading 1/Min - CO": CO1,
                      "Appliance 1 - Reading 1/Min - CO2": CO2,
                      "Appliance 1 - Reading 1/Min - Ratio": ratio,
                      "Appliance 1 - Reading 2/Max - CO": CO1_2,
                      "Appliance 1 - Reading 2/Max - CO2": CO2,
                      "Appliance 1 - Reading 2/Max - Ratio": ratio_2,
                      "Appliance 1 - Defects Identified": defects,
                      "Appliance 1 - Remedial Action Taken": remedial,
                      "Appliance 1 - Has warning notice been issued?":
                          warningNotice,
                      "Appliance 2 Location": location2,
                      "Appliance 2 Type": type2,
                      "Appliance 2 Manafacturer": manafacturer2,
                      "Appliance 2 Model": model2,
                      "Appliance 2 - Owned By Landlord": ownedBy2,
                      "Appliance 2 - Appliance Inspected": applianceInspect2,
                      "Appliance 2 - Flue Type": flueType2,
                      "Appliance 2 - Operating Pressure": opPress2,
                      "Appliance 2 - Safety devices operating correctly":
                          safetyCorrect2,
                      "Appliance 2 - Satisfactory Ventilation": satisfactory2,
                      "Appliance 2 - Visual Condition of Flue": visual2,
                      "Appliance 2 - Termination satisfactory": termination2,
                      "Appliance 2 - Flue performance checks complete":
                          fluePerformance2,
                      "Appliance 2 - Was Appliance Serviced?":
                          applianceService2,
                      "Appliance 2 - Is appliance safe to use?": applianceSafe2,
                      "Appliance 2 - Reading 1/Min - CO": CO1_2,
                      "Appliance 2 - Reading 1/Min - CO2": CO2_2,
                      "Appliance 2 - Reading 1/Min - Ratio": ratio_2,
                      "Appliance 2 - Reading 2/Max - CO": CO1_2_2,
                      "Appliance 2 - Reading 2/Max - CO2": CO2_2_2,
                      "Appliance 2 - Reading 2/Max - Ratio": ratio_2_2,
                      "Appliance 2 - Defects Identified": defects2,
                      "Appliance 2 - Remedial Action Taken": remedial2,
                      "Appliance 2 - Has warning notice been issued?":
                          warningNotice2,
                      "Appliance 3 Location": location3,
                      "Appliance 3 Type": type3,
                      "Appliance 3 Manafacturer": manafacturer3,
                      "Appliance 3 Model": model3,
                      "Appliance 3 - Owned By Landlord": ownedBy3,
                      "Appliance 3 - Appliance Inspected": applianceInspect3,
                      "Appliance 3 - Flue Type": flueType3,
                      "Appliance 3 - Operating Pressure": opPress3,
                      "Appliance 3 - Safety devices operating correctly":
                          safetyCorrect3,
                      "Appliance 3 - Satisfactory Ventilation": satisfactory3,
                      "Appliance 3 - Visual Condition of Flue": visual3,
                      "Appliance 3 - Termination satisfactory": termination3,
                      "Appliance 3 - Flue performance checks complete":
                          fluePerformance3,
                      "Appliance 3 - Was Appliance Serviced?":
                          applianceService3,
                      "Appliance 3 - Is appliance safe to use?": applianceSafe3,
                      "Appliance 3 - Reading 1/Min - CO": CO13,
                      "Appliance 3 - Reading 1/Min - CO2": CO23,
                      "Appliance 3 - Reading 1/Min - Ratio": ratio3,
                      "Appliance 3 - Reading 2/Max - CO": CO1_2_3,
                      "Appliance 3 - Reading 2/Max - CO2": CO2_2_3,
                      "Appliance 3 - Reading 2/Max - Ratio": ratio_2_3,
                      "Appliance 3 - Defects Identified": defects3,
                      "Appliance 3 - Remedial Action Taken": remedial3,
                      "Appliance 3 - Has warning notice been issued?":
                          warningNotice3,
                      "Appliance 4 Location": location4,
                      "Appliance 4 Type": type4,
                      "Appliance 4 Manafacturer": manafacturer4,
                      "Appliance 4 Model": model4,
                      "Appliance 4 - Owned By Landlord": ownedBy4,
                      "Appliance 4 - Appliance Inspected": applianceInspect4,
                      "Appliance 4 - Flue Type": flueType4,
                      "Appliance 4 - Operating Pressure": opPress4,
                      "Appliance 4 - Safety devices operating correctly":
                          safetyCorrect4,
                      "Appliance 4 - Satisfactory Ventilation": satisfactory4,
                      "Appliance 4 - Visual Condition of Flue": visual4,
                      "Appliance 4 - Termination satisfactory": termination4,
                      "Appliance 4 - Flue performance checks complete":
                          fluePerformance4,
                      "Appliance 4 - Was Appliance Serviced?":
                          applianceService4,
                      "Appliance 4 - Is appliance safe to use?": applianceSafe4,
                      "Appliance 4 - Reading 1/Min - CO": CO14,
                      "Appliance 4 - Reading 1/Min - CO2": CO24,
                      "Appliance 4 - Reading 1/Min - Ratio": ratio4,
                      "Appliance 4 - Reading 2/Max - CO": CO1_2_4,
                      "Appliance 4 - Reading 2/Max - CO2": CO2_2_4,
                      "Appliance 4 - Reading 2/Max - Ratio": ratio_2_4,
                      "Appliance 4 - Defects Identified": defects4,
                      "Appliance 4 - Remedial Action Taken": remedial4,
                      "Appliance 4 - Has warning notice been issued?":
                          warningNotice4,
                      "Outcome of gas installation pipework visual inspection":
                          gasInstall,
                      "Outcome of gas supply pipework visual inspection":
                          gasSupply,
                      "Outcome of gas tightness test": gasTight,
                      "Is the emergency control valve access satisfactory?":
                          control,
                      "Is the protective equipotential bonding satisfactory?":
                          protective,
                      "CO alarm present & working": alarm,
                      "Smoke alarm present & working": smoke,
                      "UserID": userID,
                      "ReportID": uniqueId,
                      "Report Reference No.": reportRefNum,
                      "Date of report": formatDate,
                      "Date of next report": formatNext,
                    };
                    String jsonData = jsonEncode(reportData);

                    final directory = await getApplicationDocumentsDirectory();

                    File reportFile = File('${directory.path}/$uniqueId.json');

                    await reportFile.writeAsString(jsonData);

                    print('Report created at: ${reportFile.path}');
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TestDisplayUser(
                          isAppPressed_One: isApp1Used,
                          isAppPressed_Two: isApp2Used,
                          isAppPressed_Three: isApp3Used,
                          isAppPressed_Four: isApp4Used),
                    ),
                  );
                }, // Add onPressed here for opening the language screen
                style: ButtonStyle(
                  side: MaterialStateProperty.all<BorderSide>(
                    BorderSide(width: 1.0, color: Colors.black),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(
                    Size(150.0, 40.0), // Set the width and height of the button
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.green.shade200,
                  ),
                ),

                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )
          ]),
    ))));
  }
}
