import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class AuthService {
  Future<String?> loginUser(
      BuildContext context, String username, String password) async {
    try {
      // Lebih baik menggunakan .env terpisah untuk API
      final response = await http.post(
        Uri.parse('https://nexacaresys.codeplay.id/api/login'),
        body: {'username': username, 'password': password},
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final token = data['response']['token'];
        Fluttertoast.showToast(
          msg: 'Login Sukses!, Selamat Datang $username',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        return token;
      } else {
        Fluttertoast.showToast(
          msg: 'Login Gagal ${response.statusCode.toString()}',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        return null;
      }
    } catch (exception) {
      Fluttertoast.showToast(
        msg: 'Terjadi kesalahan: $exception',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return null;
    }
  }
}
