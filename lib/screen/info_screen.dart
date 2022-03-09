// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({
    Key? key,
    required this.name,
    required this.email,
    required this.prn,
    required this.isMale,
  }) : super(key: key);

  final String name, email, prn;
  final int isMale;

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    String gender = 'Male';
    if (widget.isMale == 0) {
      setState(() {
        gender = 'Female';
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Data is here'),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome, ${widget.name}',
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  // backgroundColor: Colors.green,
                  // decorationStyle: TextDecorationStyle.dotted,
                  decorationColor: Colors.red,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email:- ${widget.email}',
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'City:- ${widget.prn}',
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
