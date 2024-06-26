import 'package:burberapp/home_page.dart';
import 'package:burberapp/service/database.dart';
import 'package:burberapp/service/sharedpref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_string/random_string.dart';

import 'login.dart';

class SignUp extends StatefulWidget {
  String? name, email, password;

  TextEditingController namecontroller = TextEditingController();
  TextEditingController gmailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  void registration() async {
    if (widget.password != null && widget.name != null && widget.email != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: widget.email!,
          password: widget.password!,
        );
        String id = randomAlphaNumeric(10);
        await SharedPreferencesHelper().saveUserName(widget.namecontroller.text);
        await SharedPreferencesHelper().saveUserEmail(widget.gmailcontroller.text);
        await SharedPreferencesHelper().saveUserImage("https://firebasestorage.googleapis.com/v0/b/barberapp-ebcc1.appspot.com/o/icon1.png?alt=media&token=0fad24a5-a01b-4d67-b4a0-676fbc75b34a");
        await SharedPreferencesHelper().saveUserId(id);

        Map<String, dynamic> userInfoMap = {
          "Name": widget.namecontroller.text,
          "Email": widget.gmailcontroller.text,
          "password": widget.gmailcontroller.text,
          "Id": id,
          "Image": "https://firebasestorage.googleapis.com/v0/b/barberapp-ebcc1.appspot.com/o/icon1.png?alt=media&token=0fad24a5-a01b-4d67-b4a0-676fbc75b34a",
        };

        await DatabaseMethods().addUserDetails(userInfoMap, id);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Registered successfully",
            style: TextStyle(fontSize: 20.0),
          ),
        ));
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      } on FirebaseAuthException catch (e) {
        if (e.code == "weak-password") {
          showSnackBar("Password Provided is too weak");
        } else if (e.code == "email-already-in-use") {
          showSnackBar("Account Already exists");
        } else {
          showSnackBar("Error: ${e.message}");
        }
      } on PlatformException catch (e) {
        showSnackBar("Error: ${e.message}");
      } catch (e) {
        showSnackBar("Error: $e");
      }
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 50.0, left: 30.0),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xFF891635),
                    Color(0xff621d3c),
                    Color(0xFF311937)
                  ]),
                ),
                child: Text(
                  "Create your\n Account",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 40.0, left: 30.0, right: 30.0, bottom: 20.0),
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 4),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                ),
                child: Form(
                  key: widget._formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(
                            color: Color(0xFF891635),
                            fontSize: 23.0,
                            fontWeight: FontWeight.w500),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Name";
                          }
                          return null;
                        },
                        controller: widget.namecontroller,
                        decoration: InputDecoration(
                            hintText: "Name",
                            prefixIcon: Icon(Icons.person_outlined)),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Text(
                        "Gmail",
                        style: TextStyle(
                            color: Color(0xFF891635),
                            fontSize: 23.0,
                            fontWeight: FontWeight.w500),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Email";
                          }
                          return null;
                        },
                        controller: widget.gmailcontroller,
                        decoration: InputDecoration(
                            hintText: "Gmail",
                            prefixIcon: Icon(Icons.mail_outline)),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Text(
                        "Password",
                        style: TextStyle(
                            color: Color(0xFF891635),
                            fontSize: 23.0,
                            fontWeight: FontWeight.w500),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Password";
                          }
                          return null;
                        },
                        controller: widget.passwordcontroller,
                        decoration: InputDecoration(
                          hintText: "password",
                          prefixIcon: Icon(Icons.password_outlined),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color(0xFF891635),
                            Color(0xff621d3c),
                            Color(0xFF311937)
                          ]),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            if (widget._formKey.currentState!.validate()) {
                              setState(() {
                                widget.name = widget.namecontroller.text;
                                widget.email = widget.gmailcontroller.text;
                                widget.password = widget.passwordcontroller.text;
                              });
                              registration();
                            }
                          },
                          child: Center(
                            child: Text(
                              "SIGN UP",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                                color: Color(0xFF311937),
                                fontSize: 17.0,
                                fontWeight: FontWeight.w500),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                            },
                            child: Text(
                              " Sign In",
                              style: TextStyle(
                                  color: Color(0xff621d3c),
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
