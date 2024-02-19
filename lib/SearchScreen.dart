import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchScreen(),
    );
  }
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  late Query _query;

  @override
  void initState() {
    super.initState();
    _initializeQuery();
  }

  // Function to initialize the query with the current user's UID
  Future<void> _initializeQuery() async {
    _query = FirebaseFirestore.instance
        .collection('customers')
        //.where('userUid', isEqualTo: currentUserUid)
        .orderBy('createdAt', descending: true);
    User? user = FirebaseAuth.instance.currentUser;

    // if (user != null) {
    //   String currentUserUid = user.uid;
    //   _query = FirebaseFirestore.instance
    //       .collection('customers')
    //       //.where('userUid', isEqualTo: currentUserUid)
    //       .orderBy('createdAt', descending: true);
    // } else {
    //   // Handle the case where the user is not signed in
    //   print('User is not signed in.');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search by name or postcode',
          ),
          onChanged: (value) {
            setState(() {
              _query = _query.where('name', isGreaterThanOrEqualTo: value);
            });
          },
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _query.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No results found.'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var document = snapshot.data!.docs[index];
              var name = document['name'];
              var postcode = document['postcode'];

              return ListTile(
                title: Text(name),
                subtitle: Text('Postcode: $postcode'),
              );
            },
          );
        },
      ),
    );
  }
}
