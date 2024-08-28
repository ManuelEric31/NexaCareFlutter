import 'package:flutter/material.dart';
import 'package:nexacare/views/widgets/doctor_card_nearest.dart';
import 'package:nexacare/services/doctor_service_nearest.dart';

class NearestDoctorPage extends StatefulWidget {
  const NearestDoctorPage({super.key});

  @override
  State<NearestDoctorPage> createState() => _NearestDoctorPageState();
}

class _NearestDoctorPageState extends State<NearestDoctorPage> {
  late Future<DoctorNearest> futureDoctorNearest;

  @override
  void initState() {
    super.initState();
    futureDoctorNearest = DoctorServiceNearest().fetchDoctorNearest();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FutureBuilder<DoctorNearest>(
        future: futureDoctorNearest,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final doctor = snapshot.data!;
            return DoctorCardNearest(
              name: doctor.name,
              specialty: doctor.type,
              distance: doctor.distance,
              rating: '4.8 (120 Reviews)',
              openingTime: doctor.schedule,
              imageUrl: 'assets/images/budisantoso.png', // Example image
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
