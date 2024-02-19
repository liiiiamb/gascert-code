import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class TestDisplayData extends StatefulWidget {
  TestDisplayData({Key? key}) : super(key: key);

  @override
  _TestDisplayDataState createState() => _TestDisplayDataState();
}

class _TestDisplayDataState extends State<TestDisplayData> {
  final CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('customers');

  late String currentUserID = '';

  @override
  void initState() {
    super.initState();
    fetchCurrentUser();
  }

  // Fetches the current user's ID
  void fetchCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        currentUserID = user.uid;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Documents Display'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _collectionRef
            .where('UserId', isEqualTo: currentUserID)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Loading indicator while fetching data
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
                child: Text(
                    'No matching documents found')); // No matching documents
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> data =
                    snapshot.data!.docs[index].data() as Map<String, dynamic>;
                // Display document values here as needed, for example:
                return ListTile(
                  title: Text(data['name']),
                  subtitle: Text(data['UserId']),
                  // Add more fields as necessary
                );
              },
            );
          }
        },
      ),
    );
  }
}
