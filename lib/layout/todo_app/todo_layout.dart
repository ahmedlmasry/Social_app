import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groub/layout/todo_app/cubit/cubit.dart';
import 'package:groub/layout/todo_app/cubit/states.dart';
import 'package:groub/shared/components/components.dart';
import 'package:intl/intl.dart';

class HomeLayout extends StatelessWidget {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();
  var titlecontroller = TextEditingController();
  var timecontroller = TextEditingController();
  var datecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          if (State is AppInsertDatabaseState) {
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
              key: scaffoldkey,
              appBar: AppBar(
                  title: Text(
                cubit.titles[cubit.currentIndex],
              )),
              body: ConditionalBuilder(
                condition: true,
                builder: (context) => cubit.screens[cubit.currentIndex],
                fallback: (context) =>
                    Center(child: CircularProgressIndicator()),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  if (cubit.isBottomSheetShown) {
                    if (formkey.currentState!.validate()) {
                      cubit.insertToDatabase(
                          title: titlecontroller.text,
                          time: timecontroller.text,
                          date: datecontroller.text);
                    }
                  } else {
                    scaffoldkey.currentState!
                        .showBottomSheet(
                          (context) => Container(
                            color: Colors.grey[300],
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Form(
                                key: formkey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    defalutFormfeild(
                                      controller: titlecontroller,
                                      type: TextInputType.text,
                                      valdiate: (value) {
                                        if (value.isEmpty) {
                                          return 'title must not be impty';
                                        }
                                        return null;
                                      },
                                      label: 'Task Title',
                                      prefix: Icons.title,
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    defalutFormfeild(
                                      controller: timecontroller,
                                      type: TextInputType.datetime,
                                      ontap: () {
                                        showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now(),
                                        ).then((value) => {
                                              timecontroller.text = value!
                                                  .format(context)
                                                  .toString(),
                                              print(value.format(context)),
                                            });
                                      },
                                      valdiate: (value) {
                                        if (value.isEmpty) {
                                          return 'time must not be impty';
                                        }

                                        return null;
                                      },
                                      label: 'Task Time',
                                      prefix: Icons.watch_later_outlined,
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    defalutFormfeild(
                                      controller: datecontroller,
                                      type: TextInputType.datetime,
                                      ontap: () {
                                        showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate:
                                              DateTime.parse('2021-12-30'),
                                        ).then((value) => {
                                              datecontroller.text =
                                                  DateFormat.yMMMd()
                                                      .format(value!),
                                            });
                                      },
                                      valdiate: (value) {
                                        if (value.isEmpty) {
                                          return 'date must not be impty';
                                        }
                                        return null;
                                      },
                                      label: 'Task Date',
                                      prefix: Icons.calendar_today,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          elevation: 20.0,
                        )
                        .closed
                        .then((value) => {
                              cubit.changeBottomSheetState(
                                  isShow: false, icon: Icons.edit)
                            });
                    cubit.changeBottomSheetState(isShow: true, icon: Icons.add);
                  }
                },
                child: Icon(cubit.fabIcon),
              ),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                onTap: (index) {
                  cubit.changeIndex(index);
                },
                currentIndex: cubit.currentIndex,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.menu), label: 'Tasks'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.check_circle_outline), label: 'Done'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.archive_outlined), label: 'Archived'),
                ],
              ));
        },
      ),
    );
  }
}
