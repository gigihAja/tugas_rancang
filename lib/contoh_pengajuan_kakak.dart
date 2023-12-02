import 'package:flutter/material.dart';

class Pengajuan extends StatelessWidget {
  const Pengajuan({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
        body: SingleChildScrollView(
            child: Padding(
                child: Container(
                    decoration: const BoxDecoration(color: Colors.blueAccent),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: size.width,
                            height: size.height - 100.0,
                            decoration: BoxDecoration(
                                border: Border.all(),
                                color: const Color.fromARGB(255, 231, 216, 74)),
                            child: Text('Pengajuan'))
                      ],
                    )),
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                  vertical: size.height * 0.05,
                ))));
  }
}
