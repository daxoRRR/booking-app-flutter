import 'package:coiffeur_app/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BookMeeting extends StatefulWidget {
  @override
  _BookMeetingState createState() => _BookMeetingState();
}

class Specialist {
  final String photo;
  final String name;

  Specialist(this.photo, this.name);
}

class _BookMeetingState extends State<BookMeeting> {
  CalendarController _calendarController;

  List<String> _scheduleAvailable = [
    "10h00", "11h30", "15h30", "16h00", "16h30", "17h00", "17h30", "18h00", "18h30"
  ];

  List<Specialist> _specialistAvailable = [
    Specialist('assets/images/specialists/julia.png', 'Julia'),
    Specialist('assets/images/specialists/priscilla.png', 'Priscilla'),
    Specialist('assets/images/specialists/amandine.png', 'Amandine'),
  ];

  int _currentScheduleIndex = 0;
  int _currentSpecialistIndex = 0;
  bool _isScheduleSelected;
  bool _isSpecialistSelected;

   @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  List<Widget> _cardSchedule() {
    return _scheduleAvailable.map((schedule) {
      var index = _scheduleAvailable.indexOf(schedule);
      _isScheduleSelected = _currentScheduleIndex == index;
      List<Color> _backgroundColor = _isScheduleSelected ? [secondColor, primaryColor] : [whiteColor, whiteColor];
      Color _textColor = _isScheduleSelected ? whiteColor : Colors.black;
      return FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: () => {
            setState(() {
              _currentScheduleIndex = index;
            })
          },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          width: ScreenUtil().setWidth(290),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: _backgroundColor
              ),
              boxShadow: [
                BoxShadow(offset: Offset(0, 4), blurRadius: 10, color: shadowColor)
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                schedule,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  color: _textColor,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      );
    }).toList();
  }

  List<Widget> _cardSpecialist() {
    return _specialistAvailable.map((specialist) {
      var index = _specialistAvailable.indexOf(specialist);
      _isSpecialistSelected = _currentSpecialistIndex == index;
      return FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: () => {
            setState(() {
              _currentSpecialistIndex = index;
            })
          },
        child: Container(
          padding: EdgeInsets.only(top: 15.0, bottom: 10.0),
          width: ScreenUtil().setWidth(290),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: whiteColor,
            border: _isSpecialistSelected ? Border.all(
              color: primaryColor
            ) : null,
            boxShadow: [
              BoxShadow(offset: Offset(0, 4), blurRadius: 10, color: shadowColor)
            ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                specialist.photo,
                width: ScreenUtil().setWidth(200),
                fit: BoxFit.fitWidth,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  specialist.name,
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      );
    }).toList();
  }

  Widget _scheduleList() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "Horaires disponibles",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              runSpacing: ScreenUtil().setHeight(70),
              spacing: ScreenUtil().setWidth(72),
              children: _cardSchedule()
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _specialistList() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "Choissisez votre coiffeur",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              runSpacing: ScreenUtil().setHeight(70),
              spacing: ScreenUtil().setWidth(72),
              children: _cardSpecialist(),
            ),
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: whiteColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: secondColor,
        elevation: 0.0,
      ),
      body: ListView(
          children: <Widget>[
            _headerWithCalendar(),
            _scheduleList(),
            _specialistList(),
            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
              child: OutlineButton(
                child: Text(
                  "Réserver",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  Fluttertoast.showToast(
                    msg: "Votre réservation a été pris en compte !",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 2,
                    backgroundColor: secondColor,
                    textColor: Colors.white,
                    fontSize: 16.0
                  );
                },
                borderSide: BorderSide(
                  color: Colors.black
                ),
                highlightedBorderColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
          ],
        ),
    );
  }

  

  Widget _buildTableCalendar() {
    return TableCalendar(
      locale: 'fr_FR',
      initialSelectedDay: DateTime.now(),
      calendarController: _calendarController,
      startingDayOfWeek: StartingDayOfWeek.monday,
      startDay: DateTime.now(),
      onUnavailableDaySelected: () {
        Fluttertoast.showToast(
          msg: "Impossible de réserver un jour déjà passé",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: secondColor,
          textColor: Colors.white,
          fontSize: 16.0
        );
      },
      initialCalendarFormat: CalendarFormat.week,
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: TextStyle(color: whiteColor),
        weekendStyle: TextStyle(color: whiteColor),
      ),
      calendarStyle: CalendarStyle(
        weekdayStyle: TextStyle(color: whiteColor),
        weekendStyle: TextStyle(color: whiteColor),
        outsideDaysVisible: false,
        outsideWeekendStyle: TextStyle(color: Color(0xFF9E9E9E)),
        selectedStyle: TextStyle(color: whiteColor),
        highlightToday: false,
        selectedColor: primaryColor.withOpacity(.6),

      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonVisible: false,
        titleTextStyle: TextStyle(
          color: whiteColor,
          fontSize: 20,
        ),
        leftChevronIcon: Icon(Icons.chevron_left, color: whiteColor),
        rightChevronIcon: Icon(Icons.chevron_right, color: whiteColor)
      ),
    );
  }

  Widget _headerWithCalendar() {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: secondColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.7),
            blurRadius: 20.0, // has the effect of softening the shadow
            spreadRadius: 1.0, // has the effect of extending the shadow
            offset: Offset(
              0.0, // horizontal, move right 10
              10.0, // vertical, move down 10
            ),
          ),
        ]
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: <Widget>[
                Text(
                  "Prendre rendez-vous",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          _buildTableCalendar()
        ],
      ),
    );
  }

}

