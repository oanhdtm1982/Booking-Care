import 'package:doanchuyennganh/Screens/Welcome/Components/CalendarEvent.dart';
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
              //Navigator.pop(context);
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
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(6.0)
            ),
            formatButtonTextStyle: TextStyle(color: Colors.white)
          ),
        ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Add Event'),
                content: Text("Enter Event Title"),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Cancel")),
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("OK"))
                ],
              )
          ),
          label: Text("Add"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
