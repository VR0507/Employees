import 'package:employees/database/database_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class EmployeeDao{

  @insert
  Future<void> insertEmployee(Employee employee);

  @Query("SELECT * FROM employee")
  Future<List<Employee>> getAllEmployee();

  @Query("DELETE FROM employee WHERE id=:id")
  Future<void> deleteEmployee(int id);

  @update
  Future<void> updateEmployee(Employee employee);
}