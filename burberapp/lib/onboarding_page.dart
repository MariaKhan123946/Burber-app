
import 'package:flutter/material.dart';

import 'home_page.dart';

class OnBoardingPage extends StatefulWidget {


  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}
class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF2b1615),
      body: Container(
        margin: EdgeInsets.only(top: 120.0),
        child: Column(
          children: [
            Image.asset("images/barber.png",),
            SizedBox(height: 50,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>HomePage() ,));
              },

              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,borderRadius: BorderRadius.circular(30),
                ),
                child: Text("Get a stylish Haircut",
                  style:  TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
              ),
            ),
          ],

      ),),
    );
  }
}
