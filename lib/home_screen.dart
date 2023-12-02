import 'package:flutter/material.dart';
import 'jadwal_belajar_screen.dart';
import 'materi_video_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
        body: Container(
          color: const Color.fromARGB(255, 244, 230, 119),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Colors.yellowAccent,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Selamat Datang',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Icon(
                      IconData(0x1F604, fontFamily: 'MaterialIcons'),
                      size: 40.0,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      padding:
                          const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.blue,
                      ),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const JadwalBelajar()));
                            },
                            child: const Icon(
                                IconData(0xe122, fontFamily: 'MaterialIcons'),
                                size: 50.0,
                                color: Colors.black),
                          ),
                          const SizedBox(height: 20.0),
                          const Text(
                            'Jadwal Belajar',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      padding:
                          const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.redAccent,
                      ),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MateriDanVideo()));
                            },
                            child: const Icon(
                                IconData(0xe6a8, fontFamily: 'MaterialIcons'),
                                size: 50.0,
                                color: Colors.black),
                          ),
                          const SizedBox(height: 20.0),
                          const Text(
                            'Materi & Video',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ],
          ),
        ));
  }
}
