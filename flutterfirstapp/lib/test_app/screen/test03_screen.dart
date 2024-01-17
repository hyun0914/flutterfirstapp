import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';


class Text03Screen extends StatelessWidget {
  const Text03Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: (){
                    DateTime date1 = DateTime.now();
                    DateTime date2 = date1.subtract(const Duration(days: 10));
                    int result1 = date1.compareTo(date2);
                    int result2 = date2.compareTo(date1);
                    // 앞일자면 -1을 뒤일자면 1을 반환한다.
                    // 참고사이트 https://in-coding.tistory.com/74
                    print(result1); // 1
                    print(result2); // -1
                  },
                  child: const Text('날짜 비교(compareTo)')
                ),
                ElevatedButton(
                  onPressed: (){
                    DateTime today = DateTime.now();
                    Duration diff = today.difference(DateTime.parse('2023-06-30'));
                    Duration diff2 = DateTime.parse('2023-06-30').difference(today);
                    print ('diff ${diff.inDays}'); // 2024-01-17 기준 201
                    print ('diff2 ${diff2.inDays}'); // 2024-01-17 기준 -201
                    print ('${DateTime.parse('2023-11-27').difference(DateTime.parse('2023-11-30')).inDays}');
                    print ('diff3 ${diff2.inMinutes}'); // 2024-01-17 기준 -290848
                    DateTime yesterday = today.subtract(const Duration(days: 1));
                    Duration diff4 = yesterday.difference(today);
                    print ('diff4 $diff4');
                    // 참고사이트
                    // https://nsinc.tistory.com/224
                    // https://accompani-i.tistory.com/321
                  },
                  child: const Text('Duration')
                ),
                ElevatedButton(
                  onPressed: (){
                    // 오늘 날짜 가져오는 법
                    DateTime toDay = DateTime.now();
                    print(toDay);

                    // 월 가져오기
                    dynamic month = toDay.month;
                    print(month);

                    // 일 가져오기
                    dynamic day = toDay.day;
                    print(day);

                    // 요일 가져오기
                    initializeDateFormatting();
                    dynamic yoil = DateFormat('EEEE', 'ko_KR').format(toDay);
                    print(yoil);

                    // 어제 날짜 구하는법
                    DateTime yesterday = toDay.subtract(const Duration(days: 1));
                    print(yesterday);

                    // 날짜 빼고 더하는 법
                    DateTime dayM = DateTime(toDay.year, toDay.month, toDay.day-1);
                    print(dayM);

                    DateTime dayP = DateTime(toDay.year, toDay.month, toDay.day+1);
                    print(dayP);

                    // 날짜 형식을 변환
                    String dateTimeFormat({String format = 'yyyy.MM.dd', required String dateTime}) {
                      return DateFormat(format).format(DateTime.parse(dateTime)).toString();
                    }
                    String todayMonth1 = dateTimeFormat(format: 'yyyy.MM', dateTime: toDay.toString());
                    String todayMonth2 = dateTimeFormat(format: 'yyyy-MM', dateTime: toDay.toString());
                    // 예시) 1 yyyy.MM  2 yyyy-MM 3  yyyy.MM.dd
                    print(todayMonth1);
                    print(todayMonth2);

                    // 참고사이트
                    // https://cyj893.github.io/flutter/Flutter4
                    // https://stackoverflow.com/questions/61682959/the-date-of-yesterday-in-flutter
                  },
                  child: const Text('날짜 관련 코드')
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
