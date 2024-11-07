import 'package:flutter/material.dart';


class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE1F0FA), // Light Blue
              Color(0xFFF7E0E3), // Light Pink
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header and App Name
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'GoldenYearsCareConnect Dashboard',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Dashboard Buttons
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.all(16.0),
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: [
                  DashboardButton(
                    label: 'Medical History',
                    icon: Icons.medical_services,
                    onTap: () {
                      // Navigate to Medical History page
                      Navigator.pushNamed(context, '/medicalHistory');
                    },
                  ),
                  DashboardButton(
                    label: 'SOS Alert',
                    icon: Icons.warning,
                    onTap: () {
                      // Implement SOS Alert functionality
                    },
                  ),
                  DashboardButton(
                    label: 'Medicine',
                    icon: Icons.medication,
                    onTap: () {
                      // Navigate to Medicine page
                    },
                  ),
                  DashboardButton(
                    label: 'GPS',
                    icon: Icons.location_on,
                    onTap: () {
                      // Navigate to GPS page
                    },
                  ),
                  DashboardButton(
                    label: 'Reminder',
                    icon: Icons.alarm,
                    onTap: () {
                      // Navigate to Reminder page
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  DashboardButton({required this.label, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(2, 4), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blueAccent),
            SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
