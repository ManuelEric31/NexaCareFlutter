import 'package:flutter/material.dart';

class DoctorCardNearest extends StatelessWidget {
  final String name;
  final String specialty;
  final String distance;
  final String rating;
  final String openingTime;
  final String imageUrl;

  const DoctorCardNearest({
    super.key,
    required this.name,
    required this.specialty,
    required this.distance,
    required this.rating,
    required this.openingTime,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Doctor's Name and Title
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(imageUrl),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xFF0D1B34),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      specialty,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Color(0xFF8696BB),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.location_on_outlined,
                    color: Color(0xFF8696BB), size: 20),
                const SizedBox(width: 5),
                Text(
                  distance,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    color: Color(0xFF8696BB),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Rating and Opening Time
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Icon(Icons.star, color: Color(0xFFFEB052), size: 20),
                    const SizedBox(width: 5),
                    Text(
                      rating,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: Color(0xFFFEB052),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.access_time,
                        color: Color(0xFF4894FE), size: 20),
                    const SizedBox(width: 5),
                    Text(
                      'Open $openingTime',
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: Color(0xFF4894FE),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
