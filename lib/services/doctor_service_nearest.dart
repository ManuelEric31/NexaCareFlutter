import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DoctorServiceNearest {
  Future<DoctorNearest> fetchDoctorNearest() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('authToken')?.trim();

// Lebih baik menggunakan .env terpisah untuk API
    final response = await http.post(
      Uri.parse('https://nexacaresys.codeplay.id/api/nearby'),
      headers: {
        'token': token ?? '',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final doctorJson = data['response']['dataResponse'];

      return DoctorNearest.fromJson(doctorJson);
    } else {
      throw Exception('Failed to load nearest doctor');
    }
  }
}

class DoctorNearest {
  final int id;
  final String name;
  final String type;
  final String date;
  final String schedule;
  final String distance;

  DoctorNearest({
    required this.id,
    required this.name,
    required this.type,
    required this.date,
    required this.schedule,
    required this.distance,
  });

  factory DoctorNearest.fromJson(Map<String, dynamic> json) {
    return DoctorNearest(
      id: json['id'],
      name: json['nama'],
      type: json['jenis'],
      date: json['tanggal'],
      schedule: json['jadwal'],
      distance: json['jarak'],
    );
  }
}
