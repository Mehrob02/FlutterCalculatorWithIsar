import 'dart:async';

import 'package:calculator/domain/models/calculation.dart';
import 'package:calculator/presentation/cubit/calculation_cubit.dart';
import 'package:calculator/presentation/widgets/history_operation_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({
    super.key,
  });

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}
class _HistoryPageState extends State<HistoryPage> {
  GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  bool isSelectableMode = false;
  List<Calculation> selectedCalculation=[];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculationCubit, List<Calculation>>(
      builder: (context, calculationState) {
        final CalculationCubit calculationCubit = context.read<CalculationCubit>();
        return PopScope(
          canPop: !isSelectableMode,
          onPopInvoked: (didPop) {
            if(!didPop){
              setState(() {
                isSelectableMode=false;
                selectedCalculation=[];
              });
            }
          },
          child: SafeArea(
            child: Scaffold(
              appBar: AppBar(title: const Text(
                            "History",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 30,
                                color: Colors.green),
                          ),
                          
                       ),
              body: calculationState.isEmpty
                  ? const Center(child: Text("No history yet"))
                  : Column(
                    children: [
                     if(isSelectableMode) Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Selected items: ${selectedCalculation.length}"),
                         if(selectedCalculation.isNotEmpty) IconButton(onPressed: () async{
                            setState(() {isSelectableMode=false;});
                            for (int i =0; i< selectedCalculation.length;i++) {
                             await _deleteCalculation(calculationState.indexOf(selectedCalculation[i]), calculationCubit);
                            }
                          }, icon: Icon(FontAwesomeIcons.trash))
                        ],
                      ),
                      Expanded(
                        child: AnimatedList(
                          key: listKey,
                            initialItemCount: calculationState.length,
                            itemBuilder:(context, index, animation) {
                               return GestureDetector(
                                onLongPress: () {
                                  setState(() {
                                    isSelectableMode=true;
                                  });
                                },
                                onTap: () {
                                  if(isSelectableMode){
                                       if(selectedCalculation.contains(calculationState[index])){
                                        setState(() {
                               selectedCalculation.removeWhere((item)=>item.id==calculationState[index].id);
                                        });
                                    }else{
                                      setState(() {
                                        selectedCalculation.add(calculationState[index]);
                                      });
                                    }
                                  }else{
                                  _showDeteils(index, calculationState[index], calculationCubit);
                                  }
                                },
                                 child: HistoryOperationCard(
                                  calculation: calculationState[index],
                                  isSelectableMode: isSelectableMode,
                                  isSelected: selectedCalculation.contains(calculationState[index]),
                                  
                                ),
                               );
                            },
                          ),
                      ),
                    ],
                  ),
                    floatingActionButton:isSelectableMode?SizedBox.shrink(): ElevatedButton(onPressed: (){
                      _clearHistory(calculationCubit);
                    }, child: Text("Clear history", style: TextStyle(color: Colors.green),)),
                    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            ),
          ),
        );
      },
    );
  }
  void _showDeteils(int index, Calculation calculation, CalculationCubit calculationCubit)async{
    await showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      String formattedDate = DateFormat('dd MMM yyyy, HH:mm').format(calculation.operationDateTime);
      return SizedBox(
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                calculation.propmt,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8), // Отступ между текстами
              Text(
               "= ${calculation.result}",
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.greenAccent,
                ),
              ),
              const SizedBox(height: 4), // Отступ между текстами
            SelectableText(
              formattedDate, // Используем форматированную дату
              style: const TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic, // Можно добавить наклонный стиль
                color: Colors.grey,
              ),
            ),
              const Spacer(), // Отделяет текст от кнопки
              Row(
                children: [
                  TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Clipboard.setData(ClipboardData(text: "${calculation.propmt}= ${calculation.result}"));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(elevation: 1, backgroundColor: Theme.of(context).scaffoldBackgroundColor.withAlpha(50), content:Text("Copied", style:TextStyle(color: Colors.green),),));
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent, // Цвет фона кнопки
                  foregroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 12), // Отступы кнопки
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: Colors.green, width: 2),
                  ),
                ),
                child: const Text("Copy"),
              ),
              SizedBox(width: 20,),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _deleteCalculation(index, calculationCubit);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green, // Цвет фона кнопки
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12), // Отступы кнопки
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text("Delete"),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
  }
  Future<void> _deleteCalculation(int index, CalculationCubit calculationCubit)async{
   listKey.currentState!.removeItem(
        index,(_,a){
           const begin = Offset(1, 0.0);
                               const end = Offset.zero; // Конец в нормальном положении
                                const curve = Curves.ease;
                                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: a.drive(tween),
        child: Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
 child:ListTile(
  title: Text("Removing...",style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
 )
        )
        );
      }, duration: Duration(milliseconds: 800));
    Timer(Duration(milliseconds: 1000), (){
       calculationCubit.deleteCalculation(calculationCubit.state[index]);
    });
  }
   void _clearHistory(CalculationCubit calculationCubit) async{
    bool? result = await showDialog(context: context, builder:(context) {
      return AlertDialog(
        title: Text("Confirm"),
        content: Text("Are you sure you want clear history?"),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context, false);
          }, child: Text("Cancel")),
          TextButton(onPressed: (){
            Navigator.pop(context, true);
          }, child: Text("Yes"))
        ],
      );
    },);
    if(result!=null&&result){
     calculationCubit.deleteAllCalculation();
    }
  }
}
