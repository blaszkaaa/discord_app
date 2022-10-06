// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class apiPostCall extends StatefulWidget {
  const apiPostCall({Key? key}) : super(key: key);

  @override
  State<apiPostCall> createState() => _apiPostCallState();
}

class _apiPostCallState extends State<apiPostCall> {
  
    Future<http.Response> doPost() {
    return http.post(
      Uri.parse('https://discord.com/api/v9/channels/1027584170463068213/messages'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: '',
      },
      body: jsonEncode(<String, String>{
        "content": result,
      }),
    );
  }

  void main() async {
    var user = await doPost();
    print(user.body);
  }

  String result = "";

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 11, 12, 14),
        body: Column(
          children: [
            Container(
            padding: EdgeInsets.all(15),
            child: TextField(
              style: TextStyle(color: Colors.grey),
              textInputAction: TextInputAction.search,
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                hoverColor: Colors.grey,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                suffixIcon: InkWell(
                  child: Icon(
                    Icons.search, 
                    color: Colors.grey,
                  ),
                ),
                contentPadding: EdgeInsets.all(15.0),
                hintText: 'Wyślij wiadomość !',
                hintStyle: TextStyle(color: Colors.grey)
              ),
              controller: TextEditingController(text: ""),
              onSubmitted: (String str) {
                setState((){
                      result = str;
                      main();
              });},
            ),
          ),],
        ),
      ),
    );
  }
}


