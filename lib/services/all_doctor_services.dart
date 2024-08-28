import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DoctorService {
  Future<List<Doctor>> fetchDoctors() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('authToken')?.trim();
    
    // Lebih baik menggunakan .env terpisah untuk API
    final response = await http.post(
      Uri.parse('https://nexacaresys.codeplay.id/api/doctor'),
      headers: {
        'token': token ?? '',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> doctorsJson = data['response']['data'];

      return doctorsJson.map((json) => Doctor.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load doctors');
    }
  }
}

class Doctor {
  final int id;
  final String name;
  final String type;
  final String date;
  final String schedule;

  Doctor(
      {required this.id,
      required this.name,
      required this.type,
      required this.date,
      required this.schedule});

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      name: json['nama'],
      type: json['jenis'],
      date: json['tanggal'],
      schedule: json['jadwal'],
    );
  }
}
