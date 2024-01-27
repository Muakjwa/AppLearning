import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class everyday extends StatefulWidget {
  const everyday({super.key});

  @override
  State<everyday> createState() => _everydayState();
}

class _everydayState extends State<everyday> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  Widget _buildContentForSelectedDate(DateTime date) {
    // 선택된 날짜에 따른 콘텐츠를 반환하는 함수
    return Container(
      height: 200, // 콘텐츠 영역의 높이
      child: Center(
        child: Text(
          '선택된 날짜: ${date.toIso8601String()}',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Colors.black, Color.fromARGB(219, 15, 7, 83)],
        ),
      ),
      child: Column(
        children: <Widget>[
          TableCalendar(
            firstDay: DateTime.utc(2010, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              leftChevronIcon: Icon(Icons.arrow_back_ios, color: Colors.white),
              rightChevronIcon:
                  Icon(Icons.arrow_forward_ios, color: Colors.white),
              titleTextStyle: TextStyle(color: Colors.white),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(color: Colors.white),
              weekendStyle: TextStyle(color: Colors.white),
            ),
            calendarStyle: CalendarStyle(
              defaultTextStyle: TextStyle(color: Colors.white),
              weekendTextStyle: TextStyle(color: Colors.red),
              outsideTextStyle: TextStyle(color: Colors.grey),
              selectedDecoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay; // update `_focusedDay` here as well
              });
            },
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child:
                _buildContentForSelectedDate(_selectedDay), // 선택된 날짜에 따른 콘텐츠 표시
          ),
        ],
      ),
    );
  }
}
