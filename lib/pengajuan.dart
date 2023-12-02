import 'package:flutter/material.dart';
import 'mata_pelajaran.dart';
import 'jadwal_pelajaran.dart';
import 'hasil_pengajuan.dart';

class Pengajuan extends StatefulWidget {
  const Pengajuan({Key? key}) : super(key: key);

  @override
  State<Pengajuan> createState() => _PengajuanState();
}

class _PengajuanState extends State<Pengajuan> {
  final TextEditingController _dateController = TextEditingController();
  Subject? _selectedSubject;

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
            color: Colors.black,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Colors.greenAccent,
                Color.fromARGB(255, 111, 164, 190),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 68, 255, 246)),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(vertical: 7.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: const Color.fromARGB(255, 231, 216, 74),
                ),
                child: const Center(
                  child: Column(
                    children: [
                      Text(
                        'Pengajuan',
                        style: TextStyle(fontSize: 30.0, color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        shape: BoxShape.rectangle,
                        color: const Color.fromARGB(255, 255, 249, 205),
                      ),
                      height: 180.0,
                      width: 130.0,
                      child: Column(
                        children: [
                          const SizedBox(height: 10.0),
                          InkWell(
                            onTap: () async {
                              String? selectedDate = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => JadwalPelajaran(),
                                ),
                              );

                              if (selectedDate != null) {
                                setState(() {
                                  _dateController.text = selectedDate;
                                });
                              }
                            },
                            child: const Icon(
                              IconData(0xe122, fontFamily: 'MaterialIcons'),
                              size: 100.0,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          const Text(
                            'Jadwal Pelajaran',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 40.0),
                  InkWell(
                    onTap: () {
                      // Check if both date and subject are selected
                      if (_dateController.text.isNotEmpty &&
                          _selectedSubject != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HasilJadwal(
                              mataPelajaranResult: _selectedSubject!.name,
                              jadwalPelajaranResult: _dateController.text,
                            ),
                          ),
                        );
                      } else {
                        // Show a message or handle the case where either date or subject is not selected
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('ERROR'),
                              content: const Text(
                                  'Jadwal Pelajaran dan Mata Pelajaran Harus Dipilih.'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'),
                                )
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green[900],
                      ),
                      height: 50.0,
                      width: 50.0,
                      child: const Icon(
                        IconData(0xe156, fontFamily: 'MaterialIcons'),
                        size: 50.0,
                        color: Color.fromARGB(255, 149, 252, 153),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Container(
                padding: const EdgeInsets.all(20.0),
                margin: const EdgeInsets.fromLTRB(10, 0, 100, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: _dateController.text.isEmpty
                      ? Color.fromARGB(255, 68, 255, 246)
                      : Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Jadwal yang Anda Pilih:   ${_dateController.text}',
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(10.0, 10.0, 90.0, 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        shape: BoxShape.rectangle,
                        color: const Color.fromARGB(255, 255, 249, 205),
                      ),
                      height: 180.0,
                      width: 130.0,
                      child: Column(
                        children: [
                          const SizedBox(height: 10.0),
                          InkWell(
                            onTap: () async {
                              Subject? selectedSubject = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MataPelajaran(),
                                ),
                              );

                              if (selectedSubject != null) {
                                setState(() {
                                  _selectedSubject = selectedSubject;
                                });
                              }
                            },
                            child: const Icon(
                              IconData(0xe3dd, fontFamily: 'MaterialIcons'),
                              size: 100.0,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          const Text(
                            'Mata Pelajaran',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Container(
                padding: const EdgeInsets.all(20.0),
                margin: const EdgeInsets.fromLTRB(10, 0, 100, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: _selectedSubject?.name.isNotEmpty ?? false
                      ? Colors.white
                      : Color.fromARGB(255, 68, 255, 246),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Mata Pelajaran yang Anda Pilih: ${_selectedSubject?.name ?? ""}',
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  const Padding(padding: EdgeInsets.all(10.0)),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    height: 45.0,
                    width: 45.0,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
