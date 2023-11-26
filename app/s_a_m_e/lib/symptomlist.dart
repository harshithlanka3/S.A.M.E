import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:s_a_m_e/colors.dart';
import 'dart:convert';

class SymptomsListPage extends StatefulWidget {
  @override
  _SymptomsListPageState createState() => _SymptomsListPageState();
}

class _SymptomsListPageState extends State<SymptomsListPage> {
  late Future<List<Symptom>> symptoms;

  @override
  void initState() {
    super.initState();
    symptoms = fetchSymptoms();
  }

  Future<List<Symptom>> fetchSymptoms() async {
    final response =
        await http.get(Uri.parse('http://localhost:3000/api/symptoms'));

    if (response.statusCode == 200) {
      List symptomsJson = json.decode(response.body);
      return symptomsJson.map((json) => Symptom.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load symptoms');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("S.A.M.E"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FutureBuilder<List<Symptom>>(
          future: symptoms,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: teal),
                          color: boxinsides,
                          borderRadius: BorderRadius.circular(20),
                        ), //BoxDecoration
                        child: ListTile(
                          title: Text(snapshot.data![index].name, style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: const Text('Symptom Description'), // this will need to be integrated later with the API
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                },
              );
            } else {
              return const Center(child: Text('No symptoms found'));
            }
          },
        ),
      )  
    );
  }
}

class Symptom {
  final String id;
  final String name;

  Symptom({required this.id, required this.name});

  factory Symptom.fromJson(Map<String, dynamic> json) {
    return Symptom(
      id: json['_id'],
      name: json['name'],
    );
  }
}