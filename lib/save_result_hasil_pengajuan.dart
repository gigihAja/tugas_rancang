class SaveResultGabung {
  String mapel;
  String jadwalPel;

  SaveResultGabung({
    required this.mapel,
    required this.jadwalPel,
  });

  Map<String, dynamic> toJson() {
    return {
      'mapel': mapel,
      'jadwal_pel': jadwalPel,
    };
  }
}
