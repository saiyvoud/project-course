// ignore_for_file: prefer_const_constructors

import 'package:e_commerces/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _eye = false;
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final form = GlobalKey<FormState>();
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.indigo.shade800,
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade800,
        elevation: 0,
        title: Text(
          "Sign Up",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: form,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              Center(
                child: Image.asset(
                  "assets/images/dashboard.png",
                  fit: BoxFit.cover,
                  height: 150,
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: size.height,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("First Name"),
                      SizedBox(height: 10),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade300,
                        ),
                        child: TextFormField(
                          controller: firstName,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "first Name is require";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'First Name',
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.indigo.shade800,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("Last Name"),
                      SizedBox(height: 10),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade300,
                        ),
                        child: TextFormField(
                          controller: lastName,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "last Name is require";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Last Name',
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.indigo.shade800,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("Email"),
                      SizedBox(height: 10),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade300,
                        ),
                        child: TextFormField(
                          controller: email,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "email is require";
                            } else if (!value.contains("@gmail.com")) {
                              return "email is require @gmail.com";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Email@gmail.com',
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.indigo.shade800,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("Password"),
                      SizedBox(height: 10),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade300,
                        ),
                        child: TextFormField(
                          obscureText: !_eye,
                          controller: password,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "password is require";
                            } else if (value.length < 5) {
                              return "password must be 6 or more";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: Icon(
                              Icons.security,
                              color: Colors.indigo.shade800,
                            ),
                            suffixIcon: IconButton(
                              icon: _eye == false
                                  ? Icon(Icons.remove_red_eye)
                                  : Icon(Icons.remove_red_eye_outlined),
                              onPressed: () {
                                setState(() {
                                  _eye = !_eye;
                                });
                              },
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: InkWell(
                          onTap: () {
                            //  Get.toNamed("/register");
                            if (form.currentState!.validate()) {
                              form.currentState!.save();
                              authController.register(
                                  firstName: firstName.text.trim(),
                                  lastName: lastName.text.trim(),
                                  email: email.text.trim(),
                                  password: password.text.trim());
                              // Get.snackbar(
                              //   "Register",
                              //   "Register successful",
                              //   backgroundColor: Colors.green,
                              //   colorText: Colors.white,
                              // );
                            }
                          },
                          child: Container(
                            height: 60,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.indigo.shade800,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
