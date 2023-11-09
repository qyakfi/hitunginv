import 'package:flutter/material.dart';
import 'package:hitungin/sidebar/sibar.dart';
import 'package:hitungin/calculator/calc.dart';
import 'package:hitungin/bmi/bmi_calc.dart';
import 'package:hitungin/suhu/suhu.calc.dart';
import 'package:hitungin/tentang/profile.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child : Scaffold(
          drawer: NavDrawer(),
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.black,
                  pinned: true,
                  floating: true,
                  title: Text('Hitungin',
                    textAlign: TextAlign.center ,)
                ),
              ];
            },
            body: GridView.count(crossAxisCount: 2,
            padding: const EdgeInsets.all(25),
            children: <Widget>[
              Card(
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => SimpleCalculator()));
                  },
                  child: const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const <Widget>[
                        Icon(Icons.calculate_outlined,
                        size: 70,
                            color: Colors.black),
                        Text("Kalkulator",style: TextStyle(fontSize: 18.0),),
                      ],
                    ),
                  ),
                ),
              ),Card(
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => BMI()));
                  },
                  child: const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const <Widget>[
                        Icon(Icons.monitor_weight_outlined,
                            size: 70,
                            color: Colors.black),
                        Text("Kalkulator BMI",style: TextStyle(fontSize: 18.0),),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Suhu()));
                  },
                  child: const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const <Widget>[
                        Icon(Icons.device_thermostat_outlined,
                            size: 70,
                            color: Colors.black),
                        Text("Konversi Suhu",style: TextStyle(fontSize: 18.0),),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Profile()));
                  },
                  child: const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const <Widget>[
                        Icon(Icons.info_outline,
                            size: 70,
                            color: Colors.black),
                        Text("Tentang",style: TextStyle(fontSize: 18.0),),
                      ],
                    ),
                  ),
                ),
              ),
            ],)
            ,),
        )
    );
  }
}