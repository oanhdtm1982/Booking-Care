import 'package:doanchuyennganh/Screens/Welcome/Components/Calendar/CalendarEvent.dart';
import 'package:doanchuyennganh/Screens/Welcome/Components/Home/Home.dart';
import 'package:doanchuyennganh/Screens/Welcome/Components/Tab.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {

  late Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  void initState(){
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsDay(DateTime date){
    return selectedEvents[date]??[];
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Calendar"),
          leading: IconButton(
            onPressed: (){
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) {
                return TabPage();
              }));
            },
            icon: Icon(Icons.arrow_back,
              color: Colors.white,),
          ),
        ),
        body: TableCalendar(
          focusedDay: selectedDay,
          firstDay: DateTime(2019),
          lastDay: DateTime(2023),
          calendarFormat: format,
          onFormatChanged: (CalendarFormat _format){
            setState(() {
              format = _format;
            });
          },

          startingDayOfWeek: StartingDayOfWeek.monday,
          daysOfWeekVisible: true,

          onDaySelected: (DateTime selectDay, DateTime focusDay){
            setState(() {
              selectedDay = selectDay;
              focusedDay = focusDay;
            });
          },

          selectedDayPredicate: (DateTime date){
            return isSameDay(selectedDay, date);
          },

          eventLoader: _getEventsDay,
          calendarStyle: CalendarStyle(
            isTodayHighlighted: true,
            selectedDecoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            selectedTextStyle: TextStyle(
              color: Colors.white,
            ),
            todayDecoration: BoxDecoration(
              color: Colors.redAccent,
              shape: BoxShape.circle,
            )
          ),
          headerStyle: HeaderStyle(
              formatButtonVisible: true,
              titleCentered: true,
          formatButtonShowsNext: false,
            formatButtonDecoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(6.0)
            ),
            formatButtonTextStyle: TextStyle(color: Colors.white)
          ),
        ),
    );
  }
}
