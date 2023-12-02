import 'package:flutter/material.dart';
import 'pengajuan.dart';
import 'hasil_pengajuan.dart';

class JadwalBelajar extends StatelessWidget {
  const JadwalBelajar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'S T U S A M A',
          style: TextStyle(
              fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.black),
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
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 68, 255, 246)),
        width: size.width,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(100.0, 40.0, 100.0, 40.0),
              child: Container(
                color: const Color.fromARGB(255, 231, 216, 74),
                height: 60.0,
                child: const Center(
                    child: Text(
                  'Jadwal Belajar',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                height: 80.0,
                color: const Color.fromARGB(255, 255, 206, 115),
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Pengajuan()));
                    },
                    child: const Text(
                      'Pengajuan',
                      style: TextStyle(fontSize: 30.0, color: Colors.black),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                height: 80.0,
                color: const Color.fromARGB(255, 255, 206, 115),
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HasilJadwal(
                                mataPelajaranResult: '',
                                jadwalPelajaranResult: '',
                              )));
                    },
                    child: const Text(
                      'Hasil',
                      style: TextStyle(fontSize: 30.0, color: Colors.black),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
