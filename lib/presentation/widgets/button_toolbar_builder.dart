import 'package:calculator/presentation/cubit/calculation_cubit.dart';
import 'package:calculator/presentation/cubit/calculator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class ButtonToolBarBuilder extends StatelessWidget {
  final CalculatorCubit calculatorCubit;
  final CalculationCubit calculationCubit;
  const ButtonToolBarBuilder({super.key, required this.calculatorCubit, required this.calculationCubit});
 Widget buidButton(String btnName, BuildContext context,{VoidCallback? onClick, Widget? widget,Border? border,Color color = Colors.transparent, Alignment alignment=Alignment.center, TextStyle? textStyle}){
  double fontSize=calculatorCubit.state.isExpanded?18:25;
      return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      width: MediaQuery.of(context).size.width/
      (
         calculatorCubit.state.isExpanded?5:
      4),
      margin: const EdgeInsets.symmetric(vertical: 6),
           height: calculatorCubit.state.isExpanded?40:50,
          alignment: alignment,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            border: border
          ),
          child: IconButton(onPressed: () {
            if (onClick != null) {
          onClick();
        }
            calculatorCubit.onButtonPressed(btnName); 
          }, icon: widget??Text(btnName, style:textStyle?? TextStyle(fontSize: fontSize),)),
        );
    
  } 
  @override
  Widget build(BuildContext context) {
    double fontSize=calculatorCubit.state.isExpanded?18:25;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
       AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: calculatorCubit.state.isExpanded?MediaQuery.of(context).size.width/5:0,
    child: Visibility(
      visible: calculatorCubit.state.isExpanded,
      child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                visible: calculatorCubit.state.isExpanded,
                child:buidButton("√",context,textStyle:  TextStyle(fontSize: fontSize, color: Colors.green)),),
              buidButton("sin",context, textStyle:  TextStyle(fontSize: fontSize, color: Colors.green)),
              buidButton("cos",context,textStyle: TextStyle(fontSize: fontSize, color: Colors.green)),
              buidButton("ln",context,textStyle:  TextStyle(fontSize: fontSize, color: Colors.green)),
              buidButton("e",context,textStyle:  TextStyle(fontSize: fontSize, color: Colors.green)),
              buidButton("π",context,textStyle:  TextStyle(fontSize: fontSize, color: Colors.green)),
            ],
          ),
    ),
       ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
                visible: calculatorCubit.state.isExpanded,
                child:buidButton("(",context,textStyle:  TextStyle(fontSize: fontSize, color: Colors.green)),),
            buidButton("AC",context,textStyle:  TextStyle(fontSize: fontSize, color: Colors.green)),
            buidButton("7",context,),
            buidButton("4",context,),
            buidButton("1",context,),
            buidButton("switch",context,widget: AnimatedRotation(
              turns: calculatorCubit.state.isExpanded?1:2,
              duration: const Duration(milliseconds: 500),
              child: const Icon(FontAwesomeIcons.repeat, color: Colors.green,))),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
                visible: calculatorCubit.state.isExpanded,
                child:buidButton(")",context,textStyle:  TextStyle(fontSize: fontSize, color: Colors.green)),),
            buidButton("remove",context,widget: const Icon(FontAwesomeIcons.deleteLeft, color: Colors.green,)),
            buidButton("8",context),
            buidButton("5",context),
            buidButton("2",context),
            buidButton("0",context),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
                visible: calculatorCubit.state.isExpanded,
                child:buidButton("^",context,textStyle:  TextStyle(fontSize: fontSize, color: Colors.green)),),
            buidButton("%",context, widget: const Icon(FontAwesomeIcons.percent, color: Colors.green,)),
            buidButton("9",context),
            buidButton("6",context),
            buidButton("3",context),
            buidButton(".",context,widget: Icon(Icons.circle, color: Theme.of(context).textTheme.bodyLarge?.color,size: IconTheme.of(context).size!/2,),alignment: Alignment.bottomCenter),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
                visible: calculatorCubit.state.isExpanded,
            child:buidButton("!",context,widget: Text("x!", style:  TextStyle(fontSize: fontSize, color: Colors.green))),),
            buidButton("/",context, widget: const Icon(FontAwesomeIcons.divide, color: Colors.green,)),
            buidButton("*",context, widget: const Icon(FontAwesomeIcons.xmark, color: Colors.green,)),
            buidButton("-",context, widget: const Icon(FontAwesomeIcons.minus, color: Colors.green,)),
            buidButton("+",context, widget: const Icon(FontAwesomeIcons.plus, color: Colors.green,)),
            buidButton("equal",context,widget:const Icon(FontAwesomeIcons.equals, color: Colors.white,), color: Colors.green, onClick: () {
              if(calculatorCubit.state.prompt!=calculatorCubit.state.result&&calculatorCubit.state.result!="---"&&calculatorCubit.state.result!="null"){
                calculationCubit.addCalculation(calculatorCubit.state.prompt, calculatorCubit.state.result);
              }
            },),
          ],
        ),
      ],
    );
  }
}