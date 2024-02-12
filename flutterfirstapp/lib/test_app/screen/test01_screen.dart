import 'dart:io';

import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:badges/badges.dart' as badges;
import 'package:image_picker/image_picker.dart';
import 'dart:math' as math;

import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// 참고사이트 https://velog.io/@tmdgks2222/Flutter-intl
// '###,###,###', '###,###' 결과 값은 같다
var price = NumberFormat('###,###,###');
PageController controller = PageController();
PickedFile? _imageFile;

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
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 4,
                    axisDirection: Axis.horizontal, // 방향 설정 (vertical || horizontal)
                    effect: const SlideEffect(
                      spacing: 8.0, // 점 사이의 수평 공간
                      radius: 16.0, // 한개의 도트 반경
                      dotWidth: 20.0, // 도트 폭
                      dotHeight: 20.0, // 도트 높이
                      dotColor: Colors.grey, // 비활성 도트 색상
                      activeDotColor: Colors.indigo, // 활성 도트 색상
                      paintStyle: PaintingStyle.stroke, // 비활성 도트 페인트 스타일 (fill|stroke)
                      strokeWidth: 1.5, // PaintStyle.fill인 경우 이는 무시
                    ),
                  ),
                ),

                //
                SizedBox(
                  width: 200.0,
                  height: 100.0,
                  child: Shimmer.fromColors(
                    baseColor: Colors.green,
                    highlightColor: Colors.amberAccent,
                    child: const Text(
                      '로딩 중',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                selectPhoto(source: ImageSource.gallery),

                CachedNetworkImage(
                  imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzI7_cvbc0a3ZzlMeePRzmvU8ePhiC6SlRhw&usqp=CAU",
                  // 로딩되는 동안 표시되는 위젯
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  // 에러일때 표시되는 위젯
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                const SizedBox(height: 20,),

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
                          // 좌우 반전 - flutter 위젯 좌우 반전
                          // import 'dart:math' as math;
                          // double degrees = 180;
                          // double radians = degrees * math.pi / 180;
                          // 참고사이트
                          // https://happyguy81.tistory.com/145
                          // https://stcodelab.com/entry/Flutter-%EC%9C%84%EC%A0%AF-%ED%9A%8C%EC%A0%84-RotatedBox-Transformrotate-AnimatedBuilder
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

                // 참고사이트 https://velog.io/@flxh4894/Flutter-Widget-%EC%A2%8C%EC%9A%B0-%EB%B0%98%EC%A0%84
                Column(
                  children: [
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi), // 좌우 반전
                      child: Row(
                        children: [
                          Container(
                            color: Colors.yellow,
                            width: 50,
                            height: 50,
                          ),
                          Container(
                            color: Colors.grey,
                            width: 50,
                            height: 50,
                            child: const Text('반전', style: TextStyle(fontSize: 18),),
                          ),
                        ],
                      ),
                    ),
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationX(math.pi), // 상하 반전
                      child: Container(
                        color: Colors.yellow,
                        width: 50,
                        height: 50,
                        child: const Text('반전', style: TextStyle(fontSize: 18),),
                      ),
                    ),
                  ],
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

Future<List<String?>> packageInfoGet() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  List<String?> getPackageInfo = [];
  getPackageInfo.add(packageInfo.appName);
  getPackageInfo.add(packageInfo.installerStore);
  getPackageInfo.add(packageInfo.version);
  getPackageInfo.add(packageInfo.buildSignature);
  getPackageInfo.add(packageInfo.buildNumber);
  showToast(msg: getPackageInfo.toString());
  print(getPackageInfo);
  return getPackageInfo;
}

List<String> imageName = [];
XFile? imageFile;
final ImagePicker picker = ImagePicker();

Future<bool> imgName(setState, ImageSource source) async {
  final pickedFile  = await picker.pickImage(source: source, imageQuality: 99, maxWidth: 2000, maxHeight: 2000,);
  if(pickedFile != null) {
    setState((){
      imageFile = pickedFile;
    });
    return true;
  }
  else {
    return false;
  }
}

Widget selectPhoto({
  required ImageSource source,
}) {
  return StatefulBuilder(
    builder: (BuildContext context, setState) {
      return GestureDetector(
        onTap: ()  {
          imageEditSheet(contexts: context, source: source, setState: setState);
        },
        child: companyImg(
          imgFile: 'https://i.pinimg.com/736x/26/ef/03/26ef03ec8c0751b4edc938fc8f7b634e.jpg',
          radius: 35,
          profileBasics: 'hamburger.png'
        ),
      );
    },
  );
}

Future imageEditSheet({
  required BuildContext contexts,
  required ImageSource source,
  required Function(void Function()) setState,
}) {
  return showModalBottomSheet(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    context: contexts,
    builder: (context) {
      return Wrap(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 14, bottom: 24),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    imgName(setState, source).then((value) {
                      if(value == true) {
                        print(imageFile!.path);
                        imageName.add(imageFile!.path);
                        Navigator.of(context).pop();
                      }
                    });
                  },
                  child: Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.only(bottom: 14),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image),
                          SizedBox(width: 12),
                          Text('사진 선택'),
                        ],
                      )
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(top: 14, bottom: 14),
                    decoration: const BoxDecoration(
                        color: Colors.transparent,
                        border: Border(
                          top: BorderSide(color: Color.fromRGBO(219, 219, 219, 1)),
                          bottom :BorderSide(color: Color.fromRGBO(219, 219, 219, 1)),
                        )
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera_alt),
                        SizedBox(width: 12,),
                        Text('사진 삭제'),
                      ],
                    )
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.only(top: 14),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('닫기'),
                      ],
                    )
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
  );
}

Widget companyImg({
  required String imgFile,
  required double radius,
  required String profileBasics,
}) {
  if(imgFile == '') {
    return CircleAvatar(
      radius: radius,
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      backgroundImage: AssetImage('assets/images/$profileBasics',),
      //backgroundImage: NetworkImage(),
    );
  }
  return CachedNetworkImage(
    imageUrl: imgFile,
    imageBuilder: (context, imageProvider) => CircleAvatar(radius: radius, backgroundImage: imageProvider,),
    placeholder: (context, url) => CircleAvatar(radius: radius,),
    errorWidget: (context, url, error) => Image.asset('assets/images/$profileBasics',),
  );
}