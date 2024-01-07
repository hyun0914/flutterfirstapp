import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:badges/badges.dart' as badges;
import 'dart:math' as math;

import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';

// 참고사이트 https://velog.io/@tmdgks2222/Flutter-intl
// '###,###,###', '###,###' 결과 값은 같다
var price = NumberFormat('###,###,###');

class Test01Screen extends StatelessWidget {
  const Test01Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(1, 98, 65, 1),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: ElevatedButton(
                    onPressed: () => packageInfoGet(),
                    child: const Text('package_info_plus  테스트')
                  ),
                ),

                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
                  child: Text('${price.format(10000)}원'),
                ),

                Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: ElevatedButton(
                    onPressed: () => showToast(msg: '테스트'),
                    child: const Text('토스트메세지 테스트')
                  ),
                ),

                Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ElevatedButton(
                    onPressed: () => actionSheet(context: context),
                    child: const Text('Adaptive action sheet 테스트')
                  ),
                ),

                Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: const badges.Badge(
                    badgeContent: Text('3'),
                    child: Icon(Icons.settings),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('만족도', style: TextStyle(fontSize: 30, color: Colors.white),),
                      RatingBar.builder(
                        initialRating: 1,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.green,),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ],
                  ),
                ),

                AspectRatio(
                  aspectRatio: 1.4,
                  child: DChartPieO(
                    data: [
                      OrdinalData(domain: 'sales', measure: 70, color: const Color.fromRGBO(17, 159, 111, 1)),
                      OrdinalData(domain: 'default', measure: 20, color: const Color.fromRGBO(247, 90, 93, 1)),
                      OrdinalData(domain: 'purchase', measure: 10, color: const Color.fromRGBO(240, 240, 240, 1)),
                    ],
                    configRenderPie: const ConfigRenderPie(
                      arcWidth: 20,
                      arcLength: 7 / 5 * 3.14,
                      startAngle: 4 / 5 * 3.14,
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 10,
                          child: Transform.rotate(
                            angle: 180 * math.pi / 180,
                            child: const DChartSingleBar(
                              radius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20)
                              ),
                              foregroundColor: Color.fromRGBO(17, 159, 111, 1),
                              backgroundColor: Color.fromRGBO(219, 219, 219, 1),
                              value: 80,
                              max: 100,
                            ),
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 10,
                          child: DChartSingleBar(
                            radius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20)
                            ),
                            foregroundColor: Color.fromRGBO(247, 90, 93, 1),
                            backgroundColor: Color.fromRGBO(219, 219, 219, 1),
                            value: 20,
                            max: 100,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                FlutterCarousel(
                  options: CarouselOptions(
                    height: 400.0,
                    showIndicator: true,
                    slideIndicator: const CircularSlideIndicator(),
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 4),
                    enableInfiniteScroll: true,
                    // 위젯을 fill로 보이게 설정
                    // viewportFraction: 1.0,
                    // padEnds: false, // 왼쪽부분 표시x 오른쪽부분 표시o
                  ),
                  items: [1,2,3,4].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: const BoxDecoration(color: Colors.green),
                          child: Text('text $i', style: const TextStyle(fontSize: 16.0),)
                        );
                      },
                    );
                  }).toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 참고사이트 https://velog.io/@meibinlee/Flutter-Toast-message
void showToast({
  required String msg,
}) {
  Fluttertoast.showToast(
    msg: msg,
    backgroundColor: Colors.green,
    toastLength: Toast.LENGTH_LONG, // 토스트 뜨는 시간 얼마나 길게 할 지 (Android)
    timeInSecForIosWeb: 1, //  // 토스트 뜨는 시간 얼마나 길게 할 지 (iOS & Web)
    gravity: ToastGravity.TOP,
  );
}

void actionSheet({
  required BuildContext context
}) {
  showAdaptiveActionSheet(
    context: context,
    actions: <BottomSheetAction>[
      BottomSheetAction(title: const Text('수정하기'), onPressed: (context){}),
      BottomSheetAction(title: const Text('삭제하기'), onPressed: (context){}),
    ],
    cancelAction: CancelAction(title: const Text('취소')),
  );
}

Future<PackageInfo> packageInfoGet() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  showToast(msg: packageInfo.appName);
  print(packageInfo.appName);
  return packageInfo;
}