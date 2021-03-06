import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CalendarController _controller;
  TextStyle dayStyle(FontWeight fontWeight) {
    return TextStyle(color: Color(0xff30384c), fontWeight: fontWeight);
  }
  Container taskList(String title, String description, IconData iconImg, Color iconColor)
  {
   return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Row(
        children: [
          Icon(
            iconImg,
            color: iconColor,
            size: 30,
          ),
          Container(
            padding:
            EdgeInsets.only(left: 10.0, right: 10.0),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: (TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
                ),
                SizedBox(height: 10.0),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }


  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  @override
  void dispose() {
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30.0),
              TableCalendar(
                startingDayOfWeek: StartingDayOfWeek.monday,
                calendarStyle: CalendarStyle(
                  weekdayStyle: dayStyle(FontWeight.normal),
                  weekendStyle: dayStyle(FontWeight.normal),
                  selectedColor: Color(0xff30374b),
                  todayColor: Color(0xff30374b),
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: TextStyle(
                      color: Color(0xff30384c),
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                    weekendStyle: TextStyle(
                      color: Color(0xff30384c),
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  dowTextBuilder: (date, locale) {
                      return DateFormat.E(locale).format(date).substring(0,1);
                  }
                ),
                headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleTextStyle: TextStyle(
                      color: Color(0xff30384),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    leftChevronIcon: Icon(
                      Icons.chevron_left,
                      color: Color(0xff30384c),
                    ),
                    rightChevronIcon: Icon(
                      Icons.chevron_right,
                      color: Color(0xff30384c),
                    )),
                calendarController: _controller,
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(left: 30.0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular((50.0)),
                      topRight: Radius.circular(50.0)),
                  color: Color(0xff30384c),
                ),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 50.0),
                          child: Text(
                            'Today',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        taskList('task1', 'description of task 1 to be update here',CupertinoIcons.check_mark_circled_solid, Color(0xff00cf8d)),
                        taskList('task2', 'description of task 2 to be update here',CupertinoIcons.clock_solid, Color(0xffff9e00)),
                        taskList('task3', 'description of task 3 to be update here',CupertinoIcons.clock_solid, Color(0xffff9e00)),
                        taskList('task4', 'description of task 4 to be update here',CupertinoIcons.check_mark_circled_solid, Color(0xff00cf8d)),
                      ],
                    ),
                    Positioned(
                      bottom: 0.0,
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: FractionalOffset.topCenter,
                            end: FractionalOffset.bottomCenter,
                            colors: [
                              Color(0xff30384c).withOpacity(0),
                              Color(0xff30384c),
                            ],
                            stops: [
                              0.0,
                              1.0
                            ]
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 40,
                      right: 20,
                      child: Container(
                        padding: EdgeInsets.all((20)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Color(0xffb038f1),
                          boxShadow: [BoxShadow(
                            color: Colors.black38,
                            blurRadius: 30,
                          )]
                        ),
                        child: Text('+', style: TextStyle(color: Colors.white,fontSize: 40.0),),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
