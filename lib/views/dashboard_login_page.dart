import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nexacare/views/home_views_dashboard.dart';
import 'package:nexacare/views/jadwal_views.dart';

class DashboardLoginPage extends StatefulWidget {
  final String username;

  const DashboardLoginPage({required this.username, super.key});

  @override
  _DashboardLoginPageState createState() => _DashboardLoginPageState();
}

class _DashboardLoginPageState extends State<DashboardLoginPage> {
  int _selectedNavbarIndex = 0;

  void _onTabChange(int index) {
    setState(() {
      _selectedNavbarIndex = index;
    });
  }

  Widget _getSelectedView() {
    switch (_selectedNavbarIndex) {
      case 0:
        return HomeViewsDashboard(username: widget.username);
      case 1:
        return const JadwalPage();
      case 2:
        return Container(
          color: Colors.white,
        );
      case 3:
        return Container(
          color: Colors.white,
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getSelectedView(),
      bottomNavigationBar: GNav(
        backgroundColor: Colors.white,
        activeColor: const Color(0XFF63B4FF),
        tabBackgroundColor: const Color.fromRGBO(99, 180, 255, 0.1),
        gap: 8,
        selectedIndex: _selectedNavbarIndex,
        onTabChange: _onTabChange,
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.calendar_month,
            text: 'Jadwal',
          ),
          GButton(
            icon: Icons.chat,
            text: 'Pesan',
          ),
          GButton(
            icon: Icons.person,
            text: 'Profil',
          ),
        ],
      ),
    );
  }
}
