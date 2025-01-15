import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'constants.dart';
import 'day_item.dart';

/// TODO: Test vazifasini bajardim, lekin UI ni aniq tushunmadim, shuning uchun ko'plab narsalarni o'zimdan uydirib chiqdim va jarayonni soddalashtirib, hamma narsani bitta Dart faylida bajardim.

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  /// _focusedDay o'zgaruvchisi
  /// Bu o'zgaruvchi hozirgi fokusdagi kunni saqlaydi va dastlab bugungi sana bilan boshlanadi.
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 72,
        leadingWidth: double.infinity,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "lib/icon/logo.svg",
                ),
              ),
              Text(
                DateFormat('MMMM').format(_focusedDay),
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24.0,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "lib/icon/calendar.svg",
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(children: [
        _weekItem(),
        _calendar(),
        _infoCurrentDay(),
        divider,
        _heightDay(),
      ]),
    );
  }

  /// divider Widgeti
  /// Bu widget ekrandagi elementlar orasida chiziqli ajratgich (divider) hosil qilish uchun ishlatiladi.
  /// Ajratgich 1 piksel qalinlikda va kulrang rangda, ikki tomondan chetlanma bilan ko'rsatiladi.
  Widget get divider => Container(
        height: 1, // Chiziqning balandligi
        color: const Color(0xffEEEEEE), // Chiziqning rangi
        margin: const EdgeInsets.fromLTRB(24, 16, 24, 16), // Ichki chetlar
        width: double.infinity, // Chiziq kengligi ekranni to'liq egallaydi
      );

  /// _weekItem Widgeti
  /// Bu widget haftaning kunlarini (yakshanba, dushanba va hokazo) bir qatorda ko'rsatish uchun ishlatiladi.
  /// Har bir kunni ekranning kengligiga qarab teng hajmdagi joy bilan joylashtiradi.
  /// Haftalik kunlar "week" ro'yxatidan olinadi.
  Widget _weekItem() {
    return Row(
      children: List.generate(7, (i) {
        return SizedBox(
          height: 38,
          width: MediaQuery.of(context).size.width / 7,
          child: Center(
            child: Text(
              week[i],
              style: const TextStyle(
                color: Color(0xff616161),
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
              ),
            ),
          ),
        );
      }),
    );
  }

  /// _calendar Widgeti
  /// Bu widget kalendarni ko'rsatish uchun ishlatiladi.
  /// TableCalendar kutubxonasidan foydalanadi va foydalanuvchiga kunlarni, hafta kunlarini va boshqa elementlarni sozlash imkonini beradi.
  /// Kalendar har bir kundagi ma'lumotlarni mos ravishda belgilangan ranglar va svg ikonalar yordamida ko'rsatadi.
  Widget _calendar() {
    return TableCalendar(
      headerVisible: false,
      daysOfWeekVisible: false,
      focusedDay: _focusedDay,
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      onPageChanged: (data) {
        setState(() {
          _focusedDay = data;
        });
      },
      rowHeight: 64,
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, focusedDay) {
          String svg = "";
          DateTime nextData =
              (day.day < DateTime(day.year, day.month + 1, 0).day)
                  ? day.add(const Duration(days: 1))
                  : DateTime(day.year, day.month + 1, 1);
          if (bloodyDay.any((date) => isSameDay(date, day))) {
            return DayItem(
              svg: "lib/icon/emoji_blood.svg",
              color: const Color(0xffFF699C),
              nextData: DateTime(0, 0, 0),
              data: day,
            );
          } else if (fourDay.any((date) => isSameDay(date, day))) {
            svg = "lib/icon/emoji_four.svg";
          } else if (orangeDay.any((date) => isSameDay(date, day))) {
            svg = "lib/icon/emoji_orange.svg";
          }
          return DayItem(
            svg: svg,
            color: Colors.transparent,
            nextData: nextData,
            data: day,
          );
        },
        outsideBuilder: (context, day, focusedDay) {
          DateTime nextData =
              (day.day < DateTime(day.year, day.month + 1, 0).day)
                  ? day.add(const Duration(days: 1))
                  : DateTime(day.year, day.month + 1, 1);
          return DayItem(
            textColor: const Color(0xffBDBDBD),
            color: Colors.transparent,
            nextData: nextData,
            data: day,
          );
        },
        todayBuilder: (context, day, focusedDay) {
          String svg = "";
          DateTime nextData =
              (day.day < DateTime(day.year, day.month + 1, 0).day)
                  ? day.add(const Duration(days: 1))
                  : DateTime(day.year, day.month + 1, 1);
          if (bloodyDay.any((date) => isSameDay(date, day))) {
            svg = "lib/icon/emoji_blood.svg";
          } else if (fourDay.any((date) => isSameDay(date, day))) {
            svg = "lib/icon/emoji_four.svg";
          } else if (orangeDay.any((date) => isSameDay(date, day))) {
            svg = "lib/icon/emoji_orange.svg";
          }
          return DayItem(
            svg: svg,
            color: const Color(0xffFF981F),
            nextData: nextData,
            data: day,
          );
        },
      ),
    );
  }

  /// _infoCurrentDay Widgeti
  /// Bu widget tanlangan yoki fokuslangan kunning ma'lumotlarini ko'rsatadi.
  /// Kun va uning tavsifi (masalan, "Cycle Day 12 - Follicular Phase") haqida ma'lumot beradi.
  /// Shuningdek, o'ng tomonda "Edit" tugmasi SVG ikonasi bilan ko'rsatiladi.
  Widget _infoCurrentDay() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${DateFormat('MMMM').format(_focusedDay)} ${_focusedDay.day}",
                  style: const TextStyle(
                    color: Color(0xff212121),
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 6.0),
                Text(
                  "Cycle Day ${_focusedDay.day} - Follicular Phase",
                  style: const TextStyle(
                    color: Color(0xff616161),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 93,
            height: 42,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              border: Border.all(
                color: const Color(0xffE0E0E0),
                width: 1.0,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  "lib/icon/emoji_blood.svg",
                  fit: BoxFit.contain,
                  height: 16,
                  width: 16,
                ),
                const SizedBox(width: 8),
                const Text(
                  "Edit",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(0xff212121),
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// _heightDay Widgeti
  /// Bu widget homilador bo'lish ehtimolini ko'rsatish uchun ishlatiladi.
  /// "Medium" kabi bosqichni rangli konteyner ichida ko'rsatadi va o'ng tomonda tavsif bilan birga chiqaradi.
  Widget _heightDay() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(children: [
        Container(
          height: 26,
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            color: const Color(0xffFF981F),
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Text(
            "Medium",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Color(0xffFFFFFF),
              fontSize: 16.0,
            ),
          ),
        ),
        RichText(
          text: const TextSpan(
              text: "  -  ",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color(0xff424242),
                fontSize: 18.0,
              ),
              children: [
                TextSpan(
                  text: "Chance of getting pregnant",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xff424242),
                    fontSize: 18.0,
                  ),
                ),
              ]),
        ),
      ]),
    );
  }
}
