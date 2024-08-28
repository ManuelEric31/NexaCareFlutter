import 'package:flutter/material.dart';
import 'package:nexacare/views/widgets/doctor_card.dart';
import 'package:nexacare/services/all_doctor_services.dart';
import 'package:nexacare/views/widgets/horizontalsliding_jadwal_button.dart';

class JadwalPage extends StatefulWidget {
  const JadwalPage({super.key});

  @override
  State<JadwalPage> createState() => _JadwalPageState();
}

class _JadwalPageState extends State<JadwalPage> {
  late Future<List<Doctor>> futureDoctors;

  @override
  void initState() {
    super.initState();
    futureDoctors = DoctorService().fetchDoctors();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imageAssets = [
      'assets/images/doctor1.png',
      'assets/images/doctor2.png',
      'assets/images/doctor3.png',
      'assets/images/doctor4.png',
    ];

    final List<String> buttonLabels = ['Semua', 'Jadwal Dokter', 'Dibatalkan'];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TopSlidingButton(
              buttonLabels: buttonLabels,
              initialIndex: 1,
              onButtonPressed: (index) {},
            ),
            const SizedBox(height: 8),
            Expanded(
              child: FutureBuilder<List<Doctor>>(
                future: futureDoctors,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    final doctors = snapshot.data!;
                    return ListView.builder(
                      itemCount: doctors.length,
                      itemBuilder: (context, index) {
                        final doctor = doctors[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: DoctorCard(
                            name: doctor.name,
                            specialty: doctor.type,
                            date: doctor.date,
                            time: doctor.schedule,
                            imageAsset: imageAssets[index % imageAssets.length],
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(child: Text('No data available'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
