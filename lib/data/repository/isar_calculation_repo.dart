import 'package:calculator/data/models/isar_calculation.dart';
import 'package:calculator/domain/models/calculation.dart';
import 'package:calculator/domain/repository/calculation_repo.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

class IsarCalculationRepo implements CalculationRepo {
  final Isar db;

  IsarCalculationRepo(this.db);

  @override
  Future<void> addCalculation(Calculation calculation) async {
    debugPrint("addCalculation");
    final calulationIsar = CalculationIsar.fromDomain(calculation);
    return db.writeAsync((isar) {
       isar.calculationIsars.put(calulationIsar); 
    });
  }

  @override
  Future<void> deleteCalculation(Calculation calulation) async {
    debugPrint("deleteCalculation");
    return db.writeAsync((isar) {
       isar.calculationIsars.delete(calulation.id); 
    });
  }

  @override
  Future<List<Calculation>> getCalculations() async {
    debugPrint("getCalculations");
    final calculations = await db.calculationIsars.where().findAll(); 
    return calculations.map((calculationsIsar) => calculationsIsar.toDomain()).toList();
  }
  
  @override
  Future<void> deleteAllCalculation() async{
    debugPrint("deleteAllCalculation");
    return db.writeAsync((isar){
      isar.calculationIsars.clear();
    });
  }
}
