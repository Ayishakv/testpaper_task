import 'package:flutter/material.dart';
import 'package:testpaper_task/main.dart';
import 'package:testpaper_task/view/home_screen/home_screen.dart';

class Login_screen extends StatelessWidget {
  const Login_screen({
    super.key,
  });
//loginscreen
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passcontroller = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Sign in to your Account",
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
              ListTile(
                leading: Icon(Icons.check_box_outlined),
                title: Text(
                  "Remember Me",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                trailing: Text(
                  "Forgot Password",
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
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
                        if (emailcontroller.text == useremail &&
                            passcontroller.text == userpassword) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Home_screen(),
                              ),
                              (route) => false);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("invalid credentials")));
                        }
                      }
                    },
                    child: Text(
                      "Sign in",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
