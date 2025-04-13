class Karyawan {
  final String nama;
  final int umur;
  final String alamat;

  Karyawan({required this.nama, required this.umur, required this.alamat});

  factory Karyawan.fromJson(Map<String, dynamic> json) {
    return Karyawan(
      nama: json['nama'],
      umur: json['umur'],
      alamat: json['alamat'],
    );
  }
}
