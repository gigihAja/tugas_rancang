import 'package:flutter/material.dart';

class MateriDanVideo extends StatelessWidget {
  const MateriDanVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'S T U S A M A',
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Colors.greenAccent,
                Color.fromARGB(255, 111, 164, 190)
              ],
            )),
          ),
        ),
        body: null //lanjut ini
//icon buat Materi (lightbulb) = IconData(0xe37c, fontFamily: 'MaterialIcons')
//icon buat video (camera) = IconData(0xe6a8, fontFamily: 'MaterialIcons')

        );
  }
}
