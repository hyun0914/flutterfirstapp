import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:badges/badges.dart' as badges;

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
                Container(
                  width: 140,
                  height: 149,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.08),
                        spreadRadius: 0,
                        blurRadius: 16,
                        offset: const Offset(0, 4),
                      )
                    ],
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(255, 216, 67, 1),
                        Color.fromRGBO(238, 175, 11, 1),
                      ],
                    )
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  width: 140,
                  height: 149,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.08),
                        spreadRadius: 0,
                        blurRadius: 16,
                        offset: const Offset(0, 4),
                      )
                    ],
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(255, 163, 77, 1),
                        Color.fromRGBO(238, 132, 34, 1),
                      ],
                    )
                  ),
                ),
                const SizedBox(height: 30,),
                FlutterCarousel(
                  options: CarouselOptions(
                    height: 400.0,
                    showIndicator: true,
                    slideIndicator: const CircularSlideIndicator(),
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 4),
                    enableInfiniteScroll: true,
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