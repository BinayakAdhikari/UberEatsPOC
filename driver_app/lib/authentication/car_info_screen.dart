import 'package:driver_app/splashScreen/splash_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../global/global.dart';

class CarInfoScreen extends StatefulWidget {
  @override
  State<CarInfoScreen> createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {


  TextEditingController carModelTextEditingController = TextEditingController();
  TextEditingController carNumberTextEditingController = TextEditingController();
  TextEditingController carColorTextEditingController = TextEditingController(); // to get the data where user write in textfeild


  List<String> carTypesList = ["uber-x", "uber-y", "bike"];
  String? selectedCarType;//string ype variable


saveCarInfo()
{
  Map driverCarInfo = { 

              "car_color": carColorTextEditingController.text.trim(),
              "car_model": carModelTextEditingController.text.trim(),
              "car_number": carNumberTextEditingController.text.trim(),
              "type": selectedCarType,

            };
             DatabaseReference driversRef = FirebaseDatabase.instance.ref().child("drivers");
            driversRef.child(currentFirebaseUser!.uid).child("car_details").set(driverCarInfo);

            Fluttertoast.showToast(msg: "Hello,Car Details has been saved");
             Navigator.push(context, MaterialPageRoute(builder: (c)=> const MySplashScreen())); // changing it into next page 
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[400],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Image.asset("images/logo1.jpg"),
              ),

              const SizedBox(
                height: 10,
              ),
              const Text(
                "Car Details",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

                TextField(
                  controller: carModelTextEditingController,
                  style: const TextStyle(color: Colors.grey),
                  decoration: const InputDecoration(
                    labelText: "Car Model",
                    hintText: "Car Model",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),
                TextField(
                  controller: carNumberTextEditingController,
                  style: const TextStyle(color: Colors.grey),
                  decoration: const InputDecoration(
                    labelText: "Car Number",
                    hintText: "Car Number",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),
                TextField(
                  controller: carColorTextEditingController,
                  style: const TextStyle(color: Colors.grey),
                  decoration: const InputDecoration(
                    labelText: "Car Color",
                    hintText: "Car Color",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),

                const SizedBox(
                height: 20,
              ),

                DropdownButton(
                  hint: const Text ("Please choose car type",
                
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
                    value:selectedCarType,
                    onChanged: (newValue){
                      setState(() {
                        selectedCarType = newValue.toString();
                        
                      });
                    },
                   items: carTypesList.map((car){
                    return DropdownMenuItem(
                      child: Text(
                         car,
                         style: const TextStyle(color: Colors.grey),
                             ),
                          value: car,
                      );
                    }).toList(),
                    ),

                   const SizedBox(
              height: 40,
            ),

            ElevatedButton(
                onPressed: () {
                  if (carColorTextEditingController.text.isNotEmpty && carNumberTextEditingController.text.isNotEmpty 
                  && carModelTextEditingController.text.isNotEmpty && selectedCarType != null)
                  {
                    saveCarInfo();

                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightGreenAccent,
                ),
                child: const Text("Next",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                    ),),),
                   
                    ],

          ),
        ),
    ));
  }
}
