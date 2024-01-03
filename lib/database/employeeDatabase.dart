import 'dart:async';

import 'package:employees/database/database_model.dart';
import 'package:employees/database/employeeDao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'employeeDatabase.g.dart';
@Database(version: 1, entities: [Employee])
abstract class AppDatabase extends FloorDatabase{
  EmployeeDao get employeeDao;
}