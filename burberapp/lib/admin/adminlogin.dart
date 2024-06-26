import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'booking_admin.dart';

class AdminLogin extends StatefulWidget {

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController usernameController=TextEditingController();
  TextEditingController passwordControler=TextEditingController();
  @override
  Widget build(BuildContext context) {





    return  Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 50.0, left: 30.0),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF891635),
                      Color(0xff621d3c),
                      Color(0xFF311937)
                    ],
                  ),
                ),
                child: Text(
                  "Admin\nPanel!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 40.0,
                  left: 30.0,
                  right: 30.0,
                  bottom: 20.0,
                ),
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 4,
                ),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "UserName",
                        style: TextStyle(
                          color: Color(0xFF891635),
                          fontSize: 23.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextFormField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          hintText: "UserName",
                          prefixIcon: Icon(Icons.mail_outline),
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Text(
                        "password",
                        style: TextStyle(
                          color: Color(0xFF891635),
                          fontSize: 23.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextFormField(
                      controller: passwordControler,
        
                        decoration: InputDecoration(
                          hintText: "password",
                          prefixIcon: Icon(Icons.password_outlined),
                        ),
                        obscureText: true,
                      ),
        
                      SizedBox(height: 50.0),
                      GestureDetector(
                        onTap: () {
                          AdminLogin();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF891635),
                                Color(0xff621d3c),
                                Color(0xFF311937),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
        
                    ],
                  ),
                ),
        
            ],
          ),
        ),
      ),
    );
  }
  AdminLogin(){
    FirebaseFirestore.instance.collection("Admin").get().then((snapahot) {
snapahot.docs.forEach((result) {
  if(result.data()['id']!=usernameController.text.trim()) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        "Your id is not correct",
        style: TextStyle(fontSize: 20.0),
      ),

    ));
  }

   else if(result.data()["password"]!=passwordControler.text.trim()){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Your password is not correct",
          style: TextStyle(fontSize: 20.0),
        ),
      ));
  }
   else{
     Navigator.push(context, MaterialPageRoute(builder: (context) => BookingAdmin(),));
  }
  }
);
    } );
  }
}