import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_rancang/provider.dart';

class JadwalPelajaran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DateProvider(),
      child: _JadwalPelajaranBody(),
    );
  }
}

class _JadwalPelajaranBody extends StatefulWidget {
  @override
  _JadwalPelajaranState createState() => _JadwalPelajaranState();
}

class _JadwalPelajaranState extends State<_JadwalPelajaranBody> {
  final TextEditingController _dateController = TextEditingController();
  bool _isDateSelected = false;

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
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 142, 219, 255),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'PENGAJUAN TANGGAL KURSUS',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30.0),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: _dateController,
                  decoration: const InputDecoration(
                    labelText: 'Pilih Jadwal Kursus yang Anda Inginkan',
                    filled: true,
                    prefixIcon: Icon(
                      Icons.calendar_today,
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                  readOnly: true,
                  onTap: () {
                    _selectDate();
                  },
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            GestureDetector(
              onTap: () {
                if (_isDateSelected) {
                  Navigator.of(context).pop(_dateController.text);
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('ERROR'),
                        content:
                            const Text('Jadwal Harus Dipilih Terlebih Dahulu'),
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
                  border: Border.all(),
                  shape: BoxShape.rectangle,
                ),
                height: 30.0,
                width: 35.0,
                child: Icon(
                  const IconData(0xe156, fontFamily: 'MaterialIcons'),
                  size: 30.0,
                  color: _isDateSelected ? Colors.green : Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
    );

    if (_picked != null) {
      setState(() {
        _dateController.text = _picked.toString().split(' ')[0];
        _isDateSelected = true;
      });
    }
  }
}
