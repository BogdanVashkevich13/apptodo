import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../Colors/colors.dart';

DateTime now = new DateTime.now();
DateTime date_now = new DateTime(now.year, now.month, now.day);


class AddToDo extends ConsumerWidget {
  const AddToDo({Key? key}) : super(key: key);
  //
  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       firstDate: DateTime(2021),
  //       lastDate: DateTime(2100));
  //   if (picked != null && picked != selectedDate) {
  //     setState(() {
  //       selectedDate = picked;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      backgroundColor: ColorsSet.black,
      body: Container(
        child: Column(
        children: [
          Padding(
          padding: EdgeInsets.only(top: 52, left: 5),
          child: Row(
            children: [
              IconButton(onPressed: () {  Navigator.pushNamed(context, '/StartScreen'
              );
              },
                icon: Icon(Icons.close),
                iconSize: 28,
                color: ColorsSet.white,
              ),
              Padding(
                  padding: EdgeInsets.only( left: 80),
                child: Text('Add New ToDo',
                style: TextStyle(
                  color: ColorsSet.white,
                  fontSize: 20,
                ),
                ),
              ),
            ],
          ),
        ),
          SizedBox(height: 12,),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 15,right: 15,bottom: 20),
                child: TextField(
                  cursorColor: ColorsSet.white,
                  maxLines: 13,
                  minLines: 12,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: ColorsSet.grey_text),
                    hintText: 'Add text',
                    fillColor: ColorsSet.gray,
                    filled: true,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                ],
              ),
            ],
          ),
      ]
      ),
      ),
    );
  }
}
// GestureDetector(
// onTap: () { Navigator.pushNamed(context, '/Calendar');
// },
// child: Container(
// decoration: BoxDecoration(
// color: ColorsSet.grey_text,
// borderRadius: BorderRadius.circular(10),
// ),
// margin: EdgeInsets.only(left: 25),
//
// ),
// ),