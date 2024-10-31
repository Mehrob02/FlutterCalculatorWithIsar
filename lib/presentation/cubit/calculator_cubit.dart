import 'dart:math';

import 'package:calculator/common/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';
class CalculatorState{
  final String prompt;
  final String result;
  final bool isExpanded;

  CalculatorState({required this.prompt, required this.result, this.isExpanded=false});
  CalculatorState copyWith(
    {String? prompt, 
    String? result,
    bool? isExpanded}){
      return CalculatorState(prompt: prompt ?? this.prompt, result: result ?? this.result, isExpanded: isExpanded?? this.isExpanded);
  }
}
class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(CalculatorState(prompt: "0", result: ""));

  void promptChanged(String prompt) {
    emit(state.copyWith(prompt: prompt));
  }


// Функция для вычисления факториала
num factorial(num n) {
  if (n == 0) return 1;
  return List.generate(n.toInt(), (i) => i + 1).reduce((a, b) => a * b);
}


// void calculateResult() {
//   // Подготавливаем выражение, заменяя символы и проводя предобработку
//   String prompt = state.prompt
//       .replaceAll('π', pi.toString()) // Замена π
//       .replaceAll('√', 'sqrt')        // Замена корня
//       .replaceAll('!', 'factorial')   // Замена факториала
//       .replaceAllMapped(RegExp(r'(\d+)\^(\d+)'), (match) {
//         // Заменяем выражения вида "a^b" на "pow(a, b)"
//         return 'pow(${match.group(1)}, ${match.group(2)})';
//       });

//   try {
//     // Парсим выражение
//     Expression expression = Expression.parse(prompt);

//     // Определяем контекст с математическими функциями
//     const evaluator = ExpressionEvaluator();
//     var result = evaluator.eval(expression, {
//       'π': pi,
//       'e': e,
//       'cos': cos,
//       'sin': sin,
//       'tan': tan,
//       'sqrt': sqrt,
//       'ln': log,
//       'factorial': (num value) => factorial(value), // Поддержка факториала
//       'pow': (num base, num exp) => pow(base, exp), // Поддержка возведения в степень
//     });

//     String res = double.parse(result.toString()).toStringAsFixed(10).removeZerosAfterDot();
//     // Отправляем результат
//     emit(state.copyWith(result: res));
//   } catch (e) {
//     debugPrint(e.toString());
//     // Если произошла ошибка в выражении
//     emit(state.copyWith(result: "---"));
//   }
// }

void calculateResult() {
  try {
    // Заменяем символы для выражения
    String prompt = state.prompt
        .replaceAll('π', pi.toString())
        .replaceAll('e', e.toString())   // Замена π
        .replaceAll('√', 'sqrt');   // Замена факториала

    // Создаем парсер и разбираем выражение
    Parser parser = Parser();
    Expression expression = parser.parse(prompt);

    // Определяем контекст с математическими функциями
    ContextModel context = ContextModel();

    // Вычисляем результат
    double result = expression.evaluate(EvaluationType.REAL, context);
    String res = result.toString();
    if (res.contains('.')) {
    // Разделяем строку на целую и дробную часть
    List<String> parts = res.split('.');

    // Возвращаем количество цифр после точки
     if(parts[1].length<8){
      res = result.toStringAsFixed(8).removeZerosAfterDot();
     }else{
      res = result.toStringAsExponential(0).removeZerosAfterDot();
     }
  }
    // Отправляем результат
    emit(state.copyWith(result: res));
  } catch (e) {
    debugPrint(e.toString());
    emit(state.copyWith(result: "---"));
  }
}



 void onButtonPressed(String btnName) {
  String prompt=state.prompt;
  String result = state.result;
  switch (btnName) {
    case 'AC':
    emit(state.copyWith(prompt: '0', result: '0'));
    break;
    case "switch":
    emit(state.copyWith(isExpanded: !state.isExpanded));
    break;
    case 'remove':
    if(prompt.length>1 &&prompt!="0"){
      // if(prompt.endsWith("sin")||prompt.endsWith("cos")){
      //   prompt=prompt.substring(0,prompt.length-3);
      // }else
       if(prompt.endsWith("ln")){
        prompt=prompt.substring(0,prompt.length-2);
      }else{
        emit(state.copyWith(prompt: prompt.substring(0, prompt.length - 1)));
      }
    }else{
      emit(state.copyWith(prompt: '0'));
    }
    break;
    case "-":
    if(!prompt.endsWith("+")&&!prompt.endsWith(".")&&!prompt.endsWith("-")&&!prompt.endsWith("*")&&!prompt.endsWith("/")&&!prompt.endsWith("%")&&!prompt.endsWith("^")){
      emit(state.copyWith(prompt: prompt + btnName));
    }
    break;
    case "+":
    case ".":
    case "*":
    case "/":
    case "%":
    case "^":
    if(!prompt.endsWith("+")&&!prompt.endsWith("-")&&!prompt.endsWith(".")&&!prompt.endsWith("*")&&!prompt.endsWith("/")&&!prompt.endsWith("%")&&!prompt.endsWith("^")&&!prompt.endsWith("(")){
      emit(state.copyWith(prompt: prompt + btnName));
    }
    break;
    case "sin":
    case "cos":
    case "ln":
    case "√":
    if(!prompt.endsWith(".")){
      if(prompt!="0"&&!prompt.endsWith("+")&&!prompt.endsWith("-")&&!prompt.endsWith("*")&&!prompt.endsWith("/")&&!prompt.endsWith("%")&&!prompt.endsWith("^")&&!prompt.endsWith("(")){
      emit(state.copyWith(prompt:"$prompt*$btnName("));
    }else{
      emit(state.copyWith(prompt:"$btnName("));
    }
    }
    break;
    case "(":
    case ")":
      if(prompt!="0"&&!prompt.endsWith("cos")&&!prompt.endsWith("sin")&&btnName!=")"&&!prompt.endsWith("+")&&!prompt.endsWith("-")&&!prompt.endsWith("*")&&!prompt.endsWith("/")&&!prompt.endsWith("%")&&!prompt.endsWith("^")&&!prompt.endsWith("(")){
        emit(state.copyWith(prompt: "$prompt*$btnName"));
      }
      else{if(prompt=="0"&&btnName=="("){
        emit(state.copyWith(prompt:btnName));
      }else{
        emit(state.copyWith(prompt: "$prompt$btnName"));
      }}
    break;
    case "equal":
    if(double.tryParse(result)!=null){
      debugPrint("Ddfd");
      emit(state.copyWith(prompt: result));
    }
    break;
    default:
    if(prompt=="0"){
      emit(state.copyWith(prompt: btnName));
    }else{
      emit(state.copyWith(prompt: prompt+btnName));
    }
    break;
  }
  // После любого нажатия кнопки выполняется расчет
  calculateResult();
}


    void switchMode(){
      if(state.isExpanded){
        emit(state.copyWith(isExpanded: false));
      }else{emit(state.copyWith(isExpanded: true));}
      
      debugPrint(state.isExpanded.toString());
    }
}
