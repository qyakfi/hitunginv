import 'package:flutter/material.dart';
import 'package:hitungin/sidebar/sibar.dart';

class Suhu extends StatefulWidget {
  @override
  _SuhuState createState() => _SuhuState();
}

class _SuhuState extends State<Suhu> {
  double val=0;
  String from='c',to='r';
//  bool ftc = false;
//  bool ctf = false;
  String finalAnswer='';

  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Celcius"),value: "c"),
      DropdownMenuItem(child: Text("Reamur"),value: "r"),
      DropdownMenuItem(child: Text("Kelvin"),value: "k"),
      DropdownMenuItem(child: Text("Fahrenheit"),value: "f"),
    ];
    return menuItems;
  }

  handleTemperature(String from,to) {
    setState(() {
      if (from == "f" && to == "c") {
        //fahrenheit to celsius
        from = 'f';
        to = 'c';
        var ans = (val - 32.0) / 1.8;
        finalAnswer = ans.toString() + " C";
      } else if (from == "c" && to =="f") {
        //celsius to fahrenheit
        from = 'c';
        to = 'f';
        var ans = (val * 1.8) + 32;
        finalAnswer = ans.toString() + " F";
      }else if (from == "c" && to =="r") {
        //celsius to reamur
        from = 'c';
        to = 'r';
        var ans = (val * 0.8);
        finalAnswer = ans.toString() + " R";
      }
      else if (from == "c" && to =="k") {
        //celsius to kelvin
        from = 'c';
        to = 'k';
        var ans = (val + 273);
        finalAnswer = ans.toString() + " K";
      }else if (from == "r" && to =="c") {
        //reamur to celcius
        from = 'r';
        to = 'c';
        var ans = (val * 1.25);
        finalAnswer = ans.toString() + " C";
      }
      else if (from == "r" && to =="f") {
        //reamur to fahrenheit
        from = 'r';
        to = 'f';
        var ans = (val * 2.25)+32;
        finalAnswer = ans.toString() + " F";
      }else if (from == "r" && to =="k") {
        //reamur to kelvin
        from = 'r';
        to = 'k';
        var ans = (val * 1.25)+273;
        finalAnswer = ans.toString() + " K";
      }else if (from == "f" && to =="r") {
        //fahrenheit to reamur
        from = 'f';
        to = 'r';
        var ans = (val * 0.4)-32;
        finalAnswer = ans.toString() + " R";
      }else if (from == "f" && to =="k") {
        //fahrenheit to kelvin
        from = 'f';
        to = 'k';
        var ans = ((val * 0.56)-32)+273;
        finalAnswer = ans.toString() + " K";
    }else if (from == "k" && to =="c") {
        //kelvin to celcius
        from = 'k';
        to = 'c';
        var ans = (val -273);
        finalAnswer = ans.toString() + " C";
      }else if (from == "k" && to =="r") {
        //kelvin to reamur
        from = 'k';
        to = 'r';
        var ans = (val * 0.8)-273;
        finalAnswer = ans.toString() + " R";
      }else if (from == "k" && to =="f") {
        //kelvin to fahrenheit
        from = 'k';
        to = 'f';
        var ans = ((val * 1.8)-273)+32;
        finalAnswer = ans.toString() + " F";
      }else{
        finalAnswer ="Tidak bisa mengkonversi ke jenis suhu yang sama";
      }
    });
  }

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
    body: Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Masukan nilai derajat suhu'),
            onChanged: (String value) {
              if (value.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Mohon masukan nilai derajat suhu')));
                finalAnswer = '';
                return;
              } else {
                val = double.parse(value);
              }
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: <Widget>[
              DropdownButton(
              value: from,
              icon: Icon(Icons.device_thermostat_outlined),
              onChanged: (String? newValue){
                setState(() {
                  from = newValue!;
                });
              },
              items: dropdownItems
          ),
              Icon(Icons.swap_horiz),
              DropdownButton(
                  value: to,
                  icon: Icon(Icons.device_thermostat_outlined),
                  onChanged: (String? newValue){
                    setState(() {
                      to = newValue!;
                    });
                  },
                  items: dropdownItems
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
              onPressed: () {handleTemperature(from, to);},
              child: Text("Hitung")
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(finalAnswer == null ? '' : finalAnswer)
        ],
      ),
    ));
  }
}