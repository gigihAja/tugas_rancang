import 'package:flutter/material.dart';

class Subject {
  final String name;

  Subject(this.name);
}

class MataPelajaran extends StatefulWidget {
  const MataPelajaran({Key? key}) : super(key: key);

  @override
  State<MataPelajaran> createState() => _MataPelajaranState();
}

class _MataPelajaranState extends State<MataPelajaran> {
  List<bool> isSubjectPressed = List.generate(3, (index) => false);

  final List<Subject> subjects = [
    Subject('Matematika'),
    Subject('Bahasa Indonesia'),
    Subject('Bahasa Inggris'),
  ];

  int selectedSubjectIndex = -1;
  late Subject selectedSubject; // Declare selectedSubject here

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
      body: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 68, 255, 246)),
        width: size.width,
        child: ListView(
          physics: const ScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(100.0, 40.0, 100.0, 40.0),
              child: Container(
                color: const Color.fromARGB(255, 255, 249, 205),
                height: 60.0,
                child: const Center(
                  child: Text(
                    'Mata Pelajaran',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            for (int i = 0; i < subjects.length; i++)
              buildSubjectContainer(subjects[i], i),
            Container(
              padding: const EdgeInsets.all(30.0),
              margin: const EdgeInsets.fromLTRB(100.0, 0, 100.0, 0),
              child: ElevatedButton(
                onPressed: () {
                  if (selectedSubjectIndex != -1) {
                    Navigator.pop(context, subjects[selectedSubjectIndex]);
                  }
                },
                child: const Text(
                  'OK',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSubjectContainer(Subject subject, int index) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        height: 80.0,
        color: isSubjectPressed[index]
            ? Colors.green
            : selectedSubjectIndex == index
                ? Colors.blue
                : const Color.fromARGB(255, 235, 28, 28),
        child: TextButton(
          onPressed: () {
            setState(() {
              if (selectedSubjectIndex == -1) {
                selectedSubjectIndex = index;
              } else {
                // Reset previous selection
                isSubjectPressed[selectedSubjectIndex] = false;
                selectedSubjectIndex = index;
              }

              isSubjectPressed[index] = !isSubjectPressed[index];
            });
          },
          child: Text(
            subject.name,
            style: const TextStyle(fontSize: 30.0, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
