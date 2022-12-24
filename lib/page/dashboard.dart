// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade800,
      body: Column(
        children: [
          SizedBox(height: 50),
          Center(
            child: Text(
              "Let's Get Start",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 50),
          Image.asset(
            "assets/images/dashboard.png",
            height: 260,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 50),
          InkWell(
            onTap: () {
              Get.toNamed("/register");
            },
            child: Container(
              height: 60,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already Your Account!",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(width: 10),
              TextButton(
                onPressed: () {
                  Get.toNamed("/login");
                },
                child: Text(
                  "Sign In",
                  style: TextStyle(
                      color: Colors.yellow, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
