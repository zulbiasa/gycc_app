import 'package:flutter/material.dart';
import 'package:gycc_app/pages/dashboardPage.dart';
import 'package:window_manager/window_manager.dart';
import 'loginPage.dart';
import 'medicalPage.dart';
import 'dashboardPage.dart';

Future<void> main() async {

  runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    minimumSize: Size(400, 800),
    center: true,
    title: "Golden Years Care Connect",
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  // Set minimum window size
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Golden Years Care Connect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFB0C4DE), // Set your primary color here
        scaffoldBackgroundColor: Colors.white, // Set the background color
      ),
      home: LoginPage(),
      routes: {
        '/dashboardPage': (context) => DashboardPage(), // Define the route for dashboard
        '/medicalHistory': (context) => MedicalHistoryPage(), // Define the route for medical history
      },
    );
  }
}

