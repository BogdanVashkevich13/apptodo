import 'dart:ui';
import 'package:apptodo/Providers/states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final dataManagerProvider = StateNotifierProvider<DataManager, States>((ref) => DataManager());

class DataManager extends StateNotifier<States> {
  DataManager() : super(States(null, null, null, null));

  void setDate(DateTime? date) {
    state =  States( date,  state.text, state.color, state.projects);
  }
  void setState(String text, DateTime? dateTime) {
   if (DateTime == null){
     state == States(state.date, text, state.color, state.projects);
   }else {
     state = States(dateTime, text, state.color, state.projects);
   }
  }
}
