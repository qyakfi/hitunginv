import 'package:flutter/material.dart';
import 'package:hitungin/sidebar/sibar.dart';

class BMI extends StatefulWidget {
  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double _result=0;
  var _kesimpulan='';

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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Tinggi dalam cm',
                icon: Icon(Icons.trending_up),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Berat dalam kg',
                icon: Icon(Icons.line_weight),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
              child: Text(
                "Hitung",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: calculateBMI,
            ),
            SizedBox(height: 15),
            Text(
              _result == 0 ? "Masukan Berat dan Tinggi Badan" : "${_result.toStringAsFixed(2)}",
              style: TextStyle(
                color: Colors.red,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 15),
            Text(_kesimpulan,style: TextStyle(
              fontSize: 18,
            ),
            )
          ],
        ),
      ),
    ));
  }

  void calculateBMI() {
    double height = double.parse(_heightController.text) / 100;
    double weight = double.parse(_weightController.text);

    double heightSquare = height * height;
    double result = weight / heightSquare;

    _result = result;
    if(_result>=30.0){
      setState(() {_kesimpulan = 'Anda termasuk obesitas';});
    }else if(_result>=25 && _result< 30.0){
      setState(() {_kesimpulan = 'Anda termasuk kelebihan berat badan';});
    }else if(_result>=18.5 && _result< 25.0){
      setState(() {_kesimpulan = 'Anda termasuk sehat';});
    }else{
      setState(() {_kesimpulan = 'Anda termasuk kekurangan berat badan';});
    }
    ;
  }
}