import 'package:flutter/material.dart';
import 'package:flutter_x_sheet/API/sheetapi.dart';
import 'package:flutter_x_sheet/Screens/show.dart';

class Initial_Page extends StatefulWidget {
  const Initial_Page({Key? key}) : super(key: key);

  @override
  State<Initial_Page> createState() => _Initial_PageState();
}

class _Initial_PageState extends State<Initial_Page> {
  late TextEditingController controllercash;
  late TextEditingController controllerbank;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    initUser();
    super.initState();
  }

  void initUser() {
    controllerbank = TextEditingController();
    controllercash = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FlutterSheet"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey, // Add a GlobalKey to the form
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20), // Increase padding for better spacing
          child: Column(
            children: [
              TextFormField(
                controller: controllercash,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Amount in Cash",
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 3, color: Colors.purpleAccent),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an amount in cash';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controllerbank,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Amount in Bank",
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 3, color: Colors.purpleAccent),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an amount in bank';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await sheetapi.insert(controllercash.text, controllerbank.text);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Show()),
                    );
                  }
                },
                child: Text("Save Data"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurpleAccent,
                  elevation: 1.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
