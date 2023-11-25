import 'package:flutter/material.dart';
import 'package:s_a_m_e/admin.dart';

class Symptoms extends StatelessWidget {
  const Symptoms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('S.A.M.E'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Admin()),
            );
          },
          child: const Text('Add another symptom!'),
        ),
      ),
    );
  }
}