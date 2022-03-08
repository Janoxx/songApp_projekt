// ignore_for_file: file_names, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:songapp_projekt/providers/api_provider.dart';

class TestPage2 extends StatefulWidget {
  const TestPage2({ Key? key }) : super(key: key);

  @override
  State<TestPage2> createState() => _TestPage2State();
}

class _TestPage2State extends State<TestPage2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: (){ 
            APIProvider().getRequest();
            },
          child: Text("GET Artist"))
      ],
    );
  }
}