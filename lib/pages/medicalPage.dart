import 'package:flutter/material.dart';

class MedicalHistoryPage extends StatefulWidget {
  @override
  _MedicalHistoryPageState createState() => _MedicalHistoryPageState();
}

class _MedicalHistoryPageState extends State<MedicalHistoryPage> {
  String selectedYear = 'All Records';

  final List<MedicalRecord> records = [
    MedicalRecord(date: 'October 24 2024', specialty: 'Dentist', icon: Icons.medical_services, time: '9:00 am', place: 'Klinik Kesihatan Kuala Lumpur'),
    MedicalRecord(date: 'July 18 2024', specialty: 'ENT Doctor', icon: Icons.hearing, time: '8:00 am', place: 'Hospital Kuala Lumpur'),
    MedicalRecord(date: 'April 8 2024', specialty: 'Allergy', icon: Icons.spa, time: '2:00 pm', place: 'Klinik Kesihatan Kuala Lumpur'),
    MedicalRecord(date: 'April 8 2022', specialty: 'Booster', icon: Icons.vaccines, time: '4:00 pm', place: 'Klinik Kesihatan Ayer Keroh'),
    MedicalRecord(date: 'April 8 2021', specialty: 'Vaccine', icon: Icons.vaccines, time: '2:00 pm', place: 'Klinik Kesihatan Ayer Keroh'),
    // Add more records as needed
  ];

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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAppBar(),
              SizedBox(height: 16),
              _buildTitle(),
              SizedBox(height: 16),
              _buildYearFilter(),
              SizedBox(height: 16),
              _buildMedicalRecordsList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(icon: Icon(Icons.arrow_back, color: Colors.black), onPressed: () {
            Navigator.pop(context);
          }),
          Text('GoldenYearsCareConnect', style: TextStyle(color: Colors.black)),
          SizedBox(width: 48), // Placeholder for alignment
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.medical_services, color: Colors.red, size: 28),
        SizedBox(width: 8),
        Text('Medical History', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildYearFilter() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildFilterButton('All Records'),
          _buildFilterButton('2024'),
          _buildFilterButton('2023'),
          _buildFilterButton('2022'),
          _buildFilterButton('2021'),
          _buildFilterButton('2020'),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String label) {
    final isSelected = selectedYear == label;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: isSelected ? Colors.red : Colors.grey),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          backgroundColor: isSelected ? Colors.red[50] : Colors.transparent,
        ),
        onPressed: () {
          setState(() {
            selectedYear = label;
          });
        },
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.red : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildMedicalRecordsList() {
    final filteredRecords = _filterRecords();
    return Expanded(
      child: ListView.builder(
        itemCount: filteredRecords.length,
        itemBuilder: (context, index) {
          final record = filteredRecords[index];
          return MedicalRecordCard(
            date: record.date,
            specialty: record.specialty,
            icon: record.icon,
            time: record.time,
            place: record.place,
          );
        },
      ),
    );
  }

  List<MedicalRecord> _filterRecords() {
    if (selectedYear == 'All Records') {
      return records;
    } else {
      return records.where((record) => record.date.contains(selectedYear)).toList();
    }
  }
}

class MedicalRecord {
  final String date;
  final String specialty;
  final IconData icon;
  final String time;
  final String place;

  MedicalRecord({
    required this.date,
    required this.specialty,
    required this.icon,
    required this.time,
    required this.place,
  });
}

class MedicalRecordCard extends StatelessWidget {
  final String date;
  final String specialty;
  final IconData icon;
  final String time;
  final String place;

  MedicalRecordCard({
    required this.date,
    required this.specialty,
    required this.icon,
    required this.time,
    required this.place,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          // Top colored container
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.pink[100],
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: Row(
              children: [
                Icon(icon, color: Colors.white),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      specialty,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Bottom white container with full width, clipped to card's corners
          ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
            child: Container(
              width: double.infinity, // Ensures full width
              padding: const EdgeInsets.all(16.0),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Schedule at: $time'),
                  SizedBox(height: 8),
                  Text('Place: $place'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}