import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tugas_rancang/save_result_hasil_pengajuan.dart';

class FirestoreService {
  static Future<void> saveResult(SaveResultGabung resultGabung) async {
    await FirebaseFirestore.instance
        .collection('Hasil Pengajuan')
        .add(resultGabung.toJson());
  }
}





/*
Future<void> saveResult(String mataPelajaran, String jadwalPelajaran) async {
  try {
    await _firestore.collection('results').add({
      'mataPelajaran': mataPelajaran,
      'jadwalPelajaran': jadwalPelajaran,
    });
  } catch (e) {
    print('Error saving result: $e');
  }
}

*/