import 'package:flutter/material.dart';
import 'package:hitungin/sidebar/sibar.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // background image and bottom contents
          Column(
            children: <Widget>[
              Container(
                height: 200.0,
                color: Colors.white,
                child: Center(
                  child: Image.asset(
                    "assets/img/3480785.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 70.0,),
              Text('Mohammad Yakfi Mukarom AL-Ayubi'),
              SizedBox(height: 10.0,),
              Text('Saya Mohammad Yakfi Mukarom Al-Ayubi, sering dipanggil Yakfi. Saya merupakan mahasiswa semester 7 dengan NIM 152020098 di Institut Teknologi Nasional Bandung. Saya memiliki ketertarikan terhadap dunia IT seperti programming, design, dan editing. ',textAlign:
                TextAlign.center,),
              SizedBox(height: 10.0,),
              Text('Aplikasi ini dibuat untuk memenuhi tugas Ujian Tengah Semester Pemrograman Mobile.',textAlign:
              TextAlign.center,),
            ],
          ),
          // Profile image
          Positioned(
            top: 150.0, // (background container size) - (circle height / 2)
            child: Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      // image: AssetImage("assets/images/cover.jpg")
                      image: AssetImage("assets/img/IMG_ffhjoh.jpg"
                      )
                  )
              ),
            ),
          )
        ],
      ),
    ));
  }
}