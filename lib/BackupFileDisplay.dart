import 'package:flutter/material.dart';

class BackupFileDisplay extends StatelessWidget {
  final String fileName;
  final List<Map<String, dynamic>> dataList;

  BackupFileDisplay({required this.fileName, required this.dataList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Content: $fileName'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: dataList.map((record) {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '$record\n------------------\n',
                style: TextStyle(fontFamily: 'Courier'),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
