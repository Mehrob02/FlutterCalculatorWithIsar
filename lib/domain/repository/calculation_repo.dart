import 'package:calculator/domain/models/calculation.dart';

abstract class CalculationRepo {
  Future <List<Calculation>> getCalculations();
  Future <void> addCalculation(Calculation newCalculation);
  Future <void> deleteCalculation(Calculation calculation);
  Future <void> deleteAllCalculation();
}