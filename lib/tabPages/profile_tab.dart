import 'package:drivers_app/global/global.dart';
import 'package:drivers_app/splashScreen/splash_screen.dart';
import 'package:flutter/material.dart';

class ProfileTabPage extends StatefulWidget {
  const ProfileTabPage({Key? key}) : super(key: key);

  @override
  State<ProfileTabPage> createState() => _ProfileTabPageState();
}

class _ProfileTabPageState extends State<ProfileTabPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: ElevatedButton(

        onPressed: (){
          fAuth.signOut();
          Navigator.push(
              context, MaterialPageRoute(builder: (c) => const MySplashScreen()));
        }, child: const Text("Sign Out")),);
  }
}
