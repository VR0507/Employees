import 'package:employees/database/employeeDatabase.dart';
import 'package:employees/views/screens/home_screen.dart';
import 'package:flutter/material.dart';

AppDatabase? appDatabase;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  appDatabase=await $FloorAppDatabase.databaseBuilder("emp.db").build();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
