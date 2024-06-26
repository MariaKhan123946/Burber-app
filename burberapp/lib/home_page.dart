
import 'package:burberapp/service/sharedpref.dart';
import 'package:flutter/material.dart';

import 'pages/booking.dart';

class HomePage extends StatefulWidget {


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? name,image;
  gethedatafromsharedpref()async{
    name=await SharedPreferencesHelper().getUserName();
    image=await SharedPreferencesHelper().getUserImage();
    setState(() {

    });
  }
  getontheload()async{
    await gethedatafromsharedpref();
    setState(() {

    });
  }
  @override
  void initState() {
   getontheload();
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF2b1615),
      body: Padding(
        padding: const EdgeInsets.only(left: 40.0),
        child: Container(
          margin: EdgeInsets.only(top: 40.0,left: 20.0,right: 20.0),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hello,",
                            style: TextStyle(color: Color.fromARGB(197, 255, 255, 255),fontSize: 24.0,fontWeight: FontWeight.w500),),
                          Text(name!,
                            style: TextStyle(
                                color: Colors.white,fontSize: 24.0,fontWeight: FontWeight.bold),),

                        ],
                      ),

                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                          child: Image.network(image!,height: 60,width: 60,fit: BoxFit.cover,)),

                    ],
                  ),
                  Divider(color: Colors.white30,
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Services",
                        style: TextStyle(
                            color: Colors.white,fontSize: 24.0,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: Color(0xFFe29452),borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Booking(service:"Classic Shaving" ),));
                                },
                                  child: Image.asset("images/shaving.png",height: 80,width: 80,fit: BoxFit.cover,)),
                              SizedBox(height: 10.0,),
                              Text("Classic Shaving",style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),),
                            ],
                          ),

                        ),
                      ),
                     SizedBox(width: 15.0,),
                      Flexible(
                        fit: FlexFit.tight,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Booking(service:"Hair washing" ),));
                          },
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                              color: Color(0xFFe29452),borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("images/hair.png",height: 80,width: 80,fit: BoxFit.cover,),
                                SizedBox(height: 10.0,),
                                Text("Hair washing",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),),
                              ],
                            ),

                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Booking(service:"Hair Cutting" ),));
                          },
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                              color: Color(0xFFe29452),borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("images/cutting.png",height: 80,width: 80,fit: BoxFit.cover,),
                                SizedBox(height: 10.0,),
                                Text("Hair Cutting",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),),
                              ],
                            ),

                          ),
                        ),
                      ),
                      SizedBox(width: 15.0,),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: Color(0xFFe29452),borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("images/beard.png",height: 80,width: 80,fit: BoxFit.cover,),
                              SizedBox(height: 10.0,),
                              Text("Beard Trimming",style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),),
                            ],
                          ),

                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: Color(0xFFe29452),borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("images/facials.png",height: 80,width: 80,fit: BoxFit.cover,),
                              SizedBox(height: 10.0,),
                              Text("Facial",style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),),
                            ],
                          ),

                        ),
                      ),
                      SizedBox(width: 15.0,),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: Color(0xFFe29452),borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("images/kids.png",height: 80,width: 80,fit: BoxFit.cover,),
                              SizedBox(height: 10.0,),
                              Text("Kids Hair Cutting",style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),),
                            ],
                          ),

                        ),
                      ),
                    ],
                  ),
                ],
              ),
        ],
          ),
        ),
      ),
    );
  }
}
