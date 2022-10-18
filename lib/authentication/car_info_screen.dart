import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../global/global.dart';
import '../splashScreen/splash_screen.dart';

class CarInfoScreen extends StatefulWidget {
  @override
  State<CarInfoScreen> createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {
  TextEditingController vehicleModelTextEditingController =
      TextEditingController();
  TextEditingController vehicleNumberTextEditingController =
      TextEditingController();
  TextEditingController vehicleColorTextEditingController =
      TextEditingController();
  List<String> vehicleTypeList = ["veh1", "veh2", "veh3"];
  String? selectedVehicleType;

  saveCarInfo() {
    Map driverVehicleInfoMap = {
      "vehicle_color": vehicleColorTextEditingController.text.trim(),
      "vehicle_number": vehicleNumberTextEditingController.text.trim(),
      "vehicle_model": vehicleModelTextEditingController.text.trim(),
      "type": selectedVehicleType,
    };
    DatabaseReference driversRef =
        FirebaseDatabase.instance.ref().child("drivers");
    driversRef
        .child(currentFirebaseUser!.uid)
        .child("vehicle_details")
        .set(driverVehicleInfoMap);
    Fluttertoast.showToast(msg: "Vehicle details saved successfully");
    if (!mounted) return;
    Navigator.push(
        context, MaterialPageRoute(builder: (c) => const MySplashScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 150, horizontal: 30),
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 2),
                child: Image(
                  image: AssetImage("assets/images/logo4.png"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Write Vehicle Details",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: vehicleModelTextEditingController,
                style: const TextStyle(color: Colors.grey),
                decoration: const InputDecoration(
                  labelText: "Vehicle Model",
                  hintText: "Vehicle Model",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
              TextField(
                controller: vehicleNumberTextEditingController,
                style: const TextStyle(color: Colors.grey),
                decoration: const InputDecoration(
                  labelText: "Vehicle Number",
                  hintText: "Vehicle Number",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
              TextField(
                controller: vehicleColorTextEditingController,
                keyboardType: TextInputType.text,
                style: const TextStyle(color: Colors.grey),
                decoration: const InputDecoration(
                  labelText: "Vehicle Color",
                  hintText: "Vehicle Color",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownButton(
                iconSize: 26,
                dropdownColor: Colors.black54,
                hint: const Text(
                  "Choose Vehicle Type",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                value: selectedVehicleType,
                onChanged: (newValue) {
                  setState(() {
                    selectedVehicleType = toString();
                  });
                },
                items: vehicleTypeList.map((vehicle) {
                  return DropdownMenuItem(
                    value: vehicle,
                    child: Text(
                      vehicle,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                ),
                onPressed: () {
                  if (vehicleColorTextEditingController.text.isNotEmpty &&
                      vehicleNumberTextEditingController.text.isNotEmpty &&
                      vehicleModelTextEditingController.text.isNotEmpty &&
                      selectedVehicleType != null) {
                    saveCarInfo();
                  }
                },
                child: const Text(
                  "Save Now",
                  style: TextStyle(color: Colors.black87, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
