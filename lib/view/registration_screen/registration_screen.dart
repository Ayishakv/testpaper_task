import 'package:flutter/material.dart';
import 'package:testpaper_task/main.dart';

import 'package:testpaper_task/view/login_screen/login_screen.dart';

class Registration_screen extends StatelessWidget {
  const Registration_screen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    TextEditingController cpasscontroller = TextEditingController();
    TextEditingController passcontroller = TextEditingController();
    TextEditingController emailcontroller = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: formkey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Center(
                      child: Text(
                        "Sign Up for Free",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 30),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: emailcontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter valid email";
                        } else if (value.contains("@")) {
                          return null;
                        } else {
                          return "invalid email";
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "Your Email Address",
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passcontroller,
                      validator: (value) {
                        if (value!.length < 6) {
                          return "password too short";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "Your Password",
                          suffixIcon: Icon(Icons.visibility_off),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: cpasscontroller,
                      validator: (value) {
                        if (passcontroller.text == cpasscontroller.text) {
                          return null;
                        } else {
                          return "wrong password";
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "Your Confirm Password",
                          suffixIcon: Icon(Icons.visibility_off),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              useremail = emailcontroller.text;
                              userpassword = passcontroller.text;
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Login_screen(),
                                  ));
                            }
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.blue),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login_screen(),
                                ));
                          }
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            color: Color(0xff1a75d2),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
