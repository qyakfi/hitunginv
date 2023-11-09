import 'package:flutter/material.dart';
import 'dart:io';
import 'package:hitungin/home.dart';
import 'package:hitungin/calculator/calc.dart';
import 'package:hitungin/bmi/bmi_calc.dart';
import 'package:hitungin/suhu/suhu.calc.dart';
import 'package:hitungin/tentang/profile.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor : Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Hitungin Menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                    fit: BoxFit.contain,
                    colorFilter:
                    ColorFilter.mode(Colors.black.withOpacity(0.4),
                        BlendMode.dstATop),
                    // image: AssetImage("assets/images/cover.jpg")
                    image: AssetImage("assets/img/logo.png"
                    )
                )
            ),
          ),
          ListTile(
              leading: Icon(Icons.home_outlined),
              title: Text('Beranda'),
              onTap: () { Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              }
          ),
          ListTile(
              leading: Icon(Icons.calculate_outlined),
              title: Text('Kalkulator'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SimpleCalculator()));
              }
          ),
          ListTile(
              leading: Icon(Icons.monitor_weight_outlined),
              title: Text('Kalkulator BMI'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) =>BMI()));
              }
          ),
          ListTile(
              leading: Icon(Icons.device_thermostat_outlined),
              title: Text('Konversi Suhu'),
              onTap: () {
                Navigator.pop(context);
                 Navigator.push(context, MaterialPageRoute(builder: (context) => Suhu()));
              }
          ),
          ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('Tentang'),
              onTap: () {
                Navigator.pop(context);
                 Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
              }
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Keluar'),
            onTap: () {  Navigator.pop(exit(0));
            },
          ),
        ],
      ),
    );
  }
}