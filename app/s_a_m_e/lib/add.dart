import 'package:flutter/material.dart';
import 'package:s_a_m_e/colors.dart';
import 'package:s_a_m_e/Symptoms.dart';

class Add extends StatelessWidget {
  const Add({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('S.A.M.E'),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            const Text('Add Symptom, Chief Complaint, and Diagnosis'),
            const Padding(padding: EdgeInsets.all(10.0)),
            const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: navy,
                    width: 2.0,
                  )),
                  labelText: 'Enter Symptom',
                  hintText: 'Enter Symptom Name'),
            ),
            const Padding(padding: EdgeInsets.all(8.0)),
            const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: navy,
                    width: 2.0,
                  )),
                  labelText: 'Enter Chief Complaint',
                  hintText: 'Enter Complaint Category'),
            ),
            const Padding(padding: EdgeInsets.all(16.0)),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(navy),
              ),
              child: const Text('Add to Database'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Symptoms()),
                );
              },
            ),
          ])),
    );
  }
}
