import 'package:flutter/material.dart';
import 'package:s_a_m_e/colors.dart';

// importing material design library
void main() {
runApp(MaterialApp(
	
	// runApp method
	home: symptoms(),
)); //MaterialApp
}

class symptoms extends StatefulWidget {
@override
_symptomsState createState() => _symptomsState();
}

class _symptomsState extends State<symptoms> {

// value set to false
bool _value = false;

// App widget tree
@override
Widget build(BuildContext context) {
	return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData( // maybe create button theme?
        primarySwatch: teal,
        fontFamily: "PT Serif",
        scaffoldBackgroundColor: background,
        appBarTheme: const AppBarTheme(
          backgroundColor: teal,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: "PT Serif",
            fontSize: 48.0,
            color: Colors.white,
            fontWeight: FontWeight.bold)
        )
      ),
    
    home: Scaffold(
      appBar: AppBar(
        title: Text('S.A.M.E'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Menu',
          onPressed: () {},
        ), //IconButton
      ), //AppBar

      body: SizedBox(
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget> [
              const Text('List of Symptoms', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
              const SizedBox(height: 10),
              const Divider(height: 0),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                border: Border.all(color: teal),
                color: boxinsides,
                borderRadius: BorderRadius.circular(20),
                ), //BoxDecoration
                
                /** CheckboxListTile Widget **/
                child: CheckboxListTile(
                title: const Text('Symptom Name', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text('Symptom Description'),
                autofocus: false,
                activeColor: navy,
                checkColor: Colors.white,
                selected: _value,
                value: _value,
                onChanged: (bool? newValue) {
                  setState(() {
                  _value = newValue!;
                  });
                },
                ), //CheckboxListTile
              ), //Container
            ],
            )
          ), //Padding
        ), //Center
      ), //SizedBox
    ), //Scaffold
  ); //MaterialApp
  }
}
