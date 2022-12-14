import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../Colors/colors.dart';
import '../Providers/data_provider.dart';
import '../Providers/projects_provider.dart';
import '../inbox/inbox.dart';

DateTime now = new DateTime.now();
DateTime date_now = new DateTime(now.year, now.month, now.day);
//DateTime date = new DateTime(2022, 10, 17 );

class AddToDo extends ConsumerWidget {
  const AddToDo({Key? key}) : super(key: key);

  Future<void> selectDate(WidgetRef ref, context) async{
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date_now,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    ref.read(dataManagerProvider.notifier).setDate(picked);
    }

  void setDate(WidgetRef ref, date) {
    ref.read(dataManagerProvider.notifier).setDate(date);
  }
  void showProjects(context, WidgetRef ref) {
    ref.read(projectsManagerProvider.notifier).showProjects(context, ref);
  }
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
              const Padding(
                  padding: EdgeInsets.only( left: 75),
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
          const SizedBox(height: 12,),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15,right: 15,bottom: 20),
                child: const TextField(
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
              const SizedBox(height: 10,),
              Padding(
                  padding: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => selectDate(ref, context),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: ColorsSet.gray,
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Image.asset(
                            ref.watch(dataManagerProvider).date != date_now
                                &&  ref.watch(dataManagerProvider).date != null
                                ? 'images/Upcoming.png'
                                : ref.watch(dataManagerProvider)?.date == date_now
                                && ref.watch(dataManagerProvider).date != null
                                ? 'images/Today.png'
                                : 'images/Watch.png',
                            width: 20,
                            height: 20,
                          ),
                            Text(
                                ref.watch(dataManagerProvider).date != date_now
                                    &&  ref.watch(dataManagerProvider)?.date != null
                                    ? 'Upcoming'
                                    : ref.watch(dataManagerProvider).date != date_now
                                    &&  ref.watch(dataManagerProvider).date != null
                                    ? 'Today'
                                    : 'No Data',
                              style: TextStyle(
                                color: ref.watch(dataManagerProvider).date !=
                                    null
                                    ? ColorsSet.white
                                    : ColorsSet.grey_text,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () =>showProjects(context, ref),
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorsSet.gray,
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                        margin: EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.circle_rounded, size: 15,
                              color: ref.watch(projectsManagerProvider).color
                              ),
                            Text(ref.watch(projectsManagerProvider).projects == null
                                ? ' Inbox'
                                : '${ref.watch(projectsManagerProvider).projects}',
                              style: TextStyle(
                                color: ref.watch(projectsManagerProvider).projects !=
                                    null
                                    ? ColorsSet.white
                                    : ColorsSet.grey_text,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(360, 40),
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                    onPressed: () {},
                    child: const Text('Add ToDo'),
                ),
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
// Row(
// children: [
// GestureDetector(
// onTap: () async{
// DateTime? newDate = await showDatePicker(
// context: context,
// initialDate: date_now,
// firstDate: DateTime(2021),
// lastDate: DateTime(2100),
// );
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
// ],
// ),

//
// 'images/GrayWatch.png',
// width: 20,
// height: 20,



// ClipRRect(
// borderRadius: BorderRadius.circular(5),
// child: Stack(
// children: <Widget>[
// Positioned.fill(
// child: Container(
// decoration: const BoxDecoration(
// color: ColorsSet.gray,
// ),
// ),
// ),
// TextButton(
// style: TextButton.styleFrom(
// foregroundColor: ColorsSet.grey_text,
// ),
// onPressed: () => selectDate(ref, context),
// child: OutlinedButton.icon(
// onPressed:
// () => selectDate(ref, context),
// icon: Image.asset(
// ref.watch(DataManagerProvider).date != date_now
// &&  ref.watch(DataManagerProvider).date != null
// ? 'images/Upcoming.png'
// : ref.watch(DataManagerProvider)?.date == date_now
// && ref.watch(DataManagerProvider).date != null
// ? 'images/Today.png'
//     : 'images/Watch.png',
// width: 20,
// height: 20,
// ),
// label: const Text(
// 'No Data',
// style: TextStyle(
// fontSize: 15,
// color: ColorsSet.grey_text,
// ),
// ),
// ),
// ),
// ],
// ),
// ),


