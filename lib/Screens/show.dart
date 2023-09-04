import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_x_sheet/API/sheetapi.dart';
import 'package:flutter_x_sheet/Widgets/showcard.dart';

class Show extends StatefulWidget {
  const Show({Key? key}) : super(key: key);

  @override
  State<Show> createState() => _ShowState();
}

class _ShowState extends State<Show> {
  List<String?> data = [];
  int currentRow = 2; // Start with row 2

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch initial data for the first row
  }

  void fetchData() async {
    final rowData = await sheetapi.getdata(currentRow);
    setState(() {
      data.add(rowData);
    });
  }

  void addCard() async {
    currentRow++; // Increment the row number
    final rowData = await sheetapi.getdata(currentRow);
    setState(() {
      data.add(rowData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Sheets Data Display'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(child: ShowCard()),
          
        ],
      ),
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.deepOrange,
        backgroundColor: const Color.fromARGB(255, 226, 120, 87),
        onPressed: addCard,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        elevation: 20.0,
      ),
    );
  }
}
