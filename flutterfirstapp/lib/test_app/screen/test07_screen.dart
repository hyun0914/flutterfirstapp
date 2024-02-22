import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'widget/show_snack_bar_view.dart';

class Test07Screen extends StatefulWidget {
  const Test07Screen({super.key});

  @override
  State<Test07Screen> createState() => _Test07ScreenState();
}

class _Test07ScreenState extends State<Test07Screen> {
  DateRangePickerController controllerDate = DateRangePickerController();

  @override
  void initState() {
    super.initState();
    controllerDate.view = DateRangePickerView.month;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: ElevatedButton(
                  onPressed: () => showDateWindow(context),
                  child: const Text('showDatePicker 달력')
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: ElevatedButton(
                  onPressed: () => showCalendar(
                    context: context,
                    controllerDate: controllerDate,
                    view: controllerDate.view!, //DateRangePickerView.month,
                    allowViewNavigation: true,
                    onSubmit: (value) {
                      if(value == null) {
                        showSnackBarView(context: context, snackBarMessage: '날짜를 선택해주세요.');
                      }
                      else {
                        String selDate = dateTimeFormat(format: 'yyyy-MM-dd', dateTime: value.toString());
                        print(selDate);
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                  child: const Text('syncfusion_flutter_datepicker 달력')
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    // view 값 유동적으로 하는법
                    setState(() {
                      if(controllerDate.view == DateRangePickerView.month) {
                        controllerDate.view = DateRangePickerView.decade;
                      }
                      else {
                        controllerDate.view = DateRangePickerView.month;
                      }
                    });
                  },
                  child: const Text('달력 view 변경')
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> showDateWindow(BuildContext context) {
  var date = DateTime.now();
  return showDatePicker(
    context: context,
    initialDate: DateTime(date.year, date.month, date.day),
    firstDate: DateTime(2023,1 ,1),
    lastDate: DateTime(date.year+1, date.month, date.day),
  );
}

DateTime today = DateTime.now();
DateTime maxDate = DateTime(DateTime.now().year+1, 12);
DateTime minDate = DateTime(2021);

// view: DateRangePickerView.year,
// 표시하고 싶은 달력 설정(year, month, century,  decade)

// allowViewNavigation: false,
// SfDateRangePicker 헤더 의 상호 작용을 통해 DateRangePickerView 간 보기 전환을 활성화 또는 비활성화하는 데 사용됩니다

// DateRangePickerController controller = DateRangePickerController();
// controller: controller,
// 컨트롤러를 추가해주면 선택한 날짜를 표시해준다
// 오늘날짜도 표시된다.

// sfdaterangepicker 월선택
// https://support.syncfusion.com/kb/article/9811/how-to-customize-the-month-cell-of-the-flutter-date-range-picker-sfdaterangepicker?_ga=2.229705820.1301892246.1687849073-2104096235.1687849073

Future<dynamic> showCalendar({
  required BuildContext context,
  required DateRangePickerController controllerDate,
  required DateRangePickerView view,
  required bool allowViewNavigation,
  DateTime? getMinDate,
  String? getDay,
  dynamic Function(Object?)? onSubmit,
}) async {
  showDialog<Widget>(
    context: context,
    builder: (BuildContext contexts) {
      return AlertDialog(
        content: SizedBox(
          width: 400,
          height: 400,
          child:  SfDateRangePicker(
            headerStyle: const DateRangePickerHeaderStyle(textStyle: TextStyle(fontSize: 16)),
            monthViewSettings: const DateRangePickerMonthViewSettings(
              viewHeaderStyle: DateRangePickerViewHeaderStyle(textStyle: TextStyle(fontSize: 16))
            ),
            yearCellStyle: const DateRangePickerYearCellStyle(
              textStyle: TextStyle(fontSize: 16),
              todayTextStyle: TextStyle(fontSize: 16),
              leadingDatesTextStyle: TextStyle(fontSize: 16),
              disabledDatesTextStyle: TextStyle(fontSize: 16),
            ),
            monthCellStyle: const DateRangePickerMonthCellStyle(
              textStyle: TextStyle(fontSize: 16),
              disabledDatesTextStyle: TextStyle(fontSize: 16),
              leadingDatesTextStyle: TextStyle(fontSize: 16),
              blackoutDateTextStyle: TextStyle(fontSize: 16),
              todayTextStyle: TextStyle(fontSize: 16),
              trailingDatesTextStyle: TextStyle(fontSize: 16),
            ),
            selectionTextStyle: const TextStyle(fontSize: 16),
            headerHeight: 40,
            controller: controllerDate,
            initialDisplayDate: getDay == null? today : DateTime.parse(getDay),
            initialSelectedDate: getDay == null? today : DateTime.parse(getDay),
            view: view,
            backgroundColor: Colors.white,
            showActionButtons: true,
            toggleDaySelection: true,
            allowViewNavigation: allowViewNavigation,
            maxDate: maxDate,
            minDate: getMinDate ?? minDate,
            onSubmit: onSubmit,
            onCancel: () {
              Navigator.of(contexts).pop();
            },
          ),
        ),
      );
    }
  );
}

String dateTimeFormat({String format = 'yyyy.MM.dd', required String dateTime}) {
  return DateFormat(format).format(DateTime.parse(dateTime)).toString();
}