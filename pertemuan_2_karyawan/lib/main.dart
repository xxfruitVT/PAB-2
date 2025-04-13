import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'models/karyawan.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daftar Karyawan',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: KaryawanList(),
    );
  }
}

class KaryawanList extends StatefulWidget {
  @override
  _KaryawanListState createState() => _KaryawanListState();
}

class _KaryawanListState extends State<KaryawanList> {
  List<Karyawan> _karyawan = [];

  Future<void> loadKaryawanData() async {
    final String response = await rootBundle.loadString('assets/karyawan.json');
    final List<dynamic> data = json.decode(response);
    setState(() {
      _karyawan = data.map((item) => Karyawan.fromJson(item)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    loadKaryawanData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text(
            'Daftar Karyawan',
          )),
      body: ListView.builder(
        itemCount: _karyawan.length,
        itemBuilder: (context, index) {
          final karyawan = _karyawan[index];
          return ListTile(
            title: Text(karyawan.nama),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Umur: ${karyawan.umur}'),
                Text('Alamat: ${karyawan.alamat}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
