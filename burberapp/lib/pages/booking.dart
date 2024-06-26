
import 'package:burberapp/service/database.dart';
import 'package:burberapp/service/sharedpref.dart';
import 'package:flutter/material.dart';

class Booking extends StatefulWidget {
  final String service;

  Booking({Key? key, required this.service}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  String? name,image, email;
  gethedatafromsharedpref()async{
    name=await SharedPreferencesHelper().getUserName();
    image=await SharedPreferencesHelper().getUserImage();
    email=await SharedPreferencesHelper().getUserEmail();

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







  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }
  TimeOfDay  _selectedTime=TimeOfDay.now();
  Future<void> _selectTime(BuildContext context)async{
    final TimeOfDay? picked=await showTimePicker(context: context, initialTime: _selectedTime);
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF2b1615),
      body: Container(
        margin: EdgeInsets.only(left: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "Let's the\n journey begin",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "images/discount.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                widget.service,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              GestureDetector(
                onTap: () {
                  _selectDate(context); // Call _selectDate function
                },
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFb4817e),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10,),
                      Text(
                        "Set a Date",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
          
                        ),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                            size: 30.0,
                          ),
                          SizedBox(width: 20.0),
                          Text(
                            "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              GestureDetector(
                onTap: () {
                  _selectTime(context); // Call _selectDate function
                },

                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFb4817e),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10,),
                        Text(
                          "Set a Time",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 20,

                          ),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.alarm,
                              color: Colors.white,
                              size: 30.0,
                            ),
                            SizedBox(width: 20.0),
                            Text(
                              _selectedTime.format(context),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
          

              SizedBox(height: 40,),
              GestureDetector(
                 onTap: ()async{
                   Map<String,dynamic>userBookingmap={
                "service":widget.service,
                "Date":  "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}".toString(),
                     "Time":_selectedTime.format(context).toString(),
                     "Username":name,
                "Image":image,
                     "Email":email,
                   };
                   await DatabaseMethods().addUserBooking(userBookingmap).then((value) {
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                       content: Text(
                         "Servic have been bookied Successfully!!",
                         style: TextStyle(fontSize: 20.0),
                       ),
                     ));
                   });

                 },
          
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 15.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFfe8f33),borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text("BOOk NOW",
                        style:  TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
                    ),
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
