import 'package:flutter/material.dart';
import 'package:testpaper_task/view/home_screen/home_screen.dart';

class Login_screen extends StatelessWidget {
  const Login_screen(
      {super.key, required this.storedemail, required this.storedpass});
  final String storedemail;
  final String storedpass;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();

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
                validator: (value) {
                  if (value == storedemail) {
                    return null;
                  } else {
                    return "wrong email";
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
                validator: (value) {
                  if (value == storedpass) {
                    return null;
                  } else {
                    return "wrong password";
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
                    },
                    child: Text(
                      "Sign in",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
