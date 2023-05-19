import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirstapp/screen/home/community_writing_page.dart';
import 'package:flutterfirstapp/screen/home/home_community_page.dart';
import 'package:flutterfirstapp/screen/search/search_page.dart';
import 'package:flutterfirstapp/screen/shoppingbasket/shopping_basket_page.dart';
import 'package:flutterfirstapp/screen/store/store_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'screen/my_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key,}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {

  FocusNode searchFocus = FocusNode();

  DateTime? backPressTime;

  Future<bool> onBackTwo() {
    DateTime now = DateTime.now();
    if(backPressTime == null || now.difference(backPressTime!) > const Duration(seconds: 2)){
      backPressTime = now;
      showToatst('뒤로가기 버튼을 한번 더 누르시면 종료 됩니다.');
      return Future.value(false);
    }
    return Future.value(true);
  }

  int currentIndex = 0;
  final List<Widget> screenList = <Widget>[
    HomeCommunityPage(),
    StorePage(),
    ShoppingBasketPage(),
    MyPage(),
    // ARPage(),
  ];

  void showToastBox(String messsage) {
    Fluttertoast.showToast(
        msg: messsage,
        backgroundColor: Colors.black,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM
    );
  }

  final Connectivity _connectivity =Connectivity();

  void chekConnectivity() async {
    ConnectivityResult connectivityResult = await _connectivity.checkConnectivity();

    if(connectivityResult == ConnectivityResult.wifi){
      showToatst('WIFI 사용 중 입니다.');
      print('wifi 사용 확인');
    }else if(connectivityResult == ConnectivityResult.mobile){
      showToatst('모바일데이터 사용 중 입니다.');
      print('모바일데이터 사용 확인');
    }else
      if(connectivityResult == ConnectivityResult.none){
      showToatst('네트워크 연결을 확인하세요.');
      print('네트워크 연결을 확인하세요.');
    }
  }

  @override
  void initState() {
    chekConnectivity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var controller = PrimaryScrollController.of(context);
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          const SizedBox(width: 14,),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/hamburger.png', fit: BoxFit.fill, width: 30, height: 30,),
                const SizedBox(width: 10,),
                InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => SearchPage())),
                  child: Container(
                    width: 300,
                    decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(5)),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Row(
                      children: [
                        SizedBox(width: 8,),
                        Icon(Icons.search, color: Colors.black,),
                        SizedBox(width: 8,),
                        Text('통합검색', style: TextStyle(color: Colors.black,),),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 14,),
              ],
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: 720,
          margin: EdgeInsets.only(bottom: kToolbarHeight),
          child: WillPopScope(
            child: screenList.elementAt(currentIndex),
            onWillPop: onBackTwo,
          ),
        ),
      ),

      floatingActionButton:  currentIndex == 0 ? FloatingActionButton(
        elevation: 0.0,
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CommunityWritingPage()));
        },
        child: const Icon(Icons.add_circle_outline, size: 40,)
      )
      : const SizedBox(),

      // 하단 네비게이션바
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        elevation: 0.0,
        items: [
          BottomNavigationBarItem(
              icon: (currentIndex==0)? const Icon(Icons.home) : const Icon(Icons.home_outlined),
              label: '커뮤니티'),

          BottomNavigationBarItem(
              icon: (currentIndex==1)? const Icon(Icons.storefront_rounded, size: 22,) : const Icon(Icons.storefront, size: 22),
              label: '스토어'),

          BottomNavigationBarItem(
              icon: (currentIndex==2)?  const Icon(Icons.shopping_cart) : const Icon(Icons.shopping_cart_outlined),
              label: '장바구니' ),
          BottomNavigationBarItem(
              icon: (currentIndex==3)? const Icon(Icons.person) : const Icon(Icons.perm_identity),
              label: '마이'),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black45,
        showUnselectedLabels: true,
        // BottomNavigationBarItem3개 이상시 클릭시 움직임없애기
        type: BottomNavigationBarType.fixed,
        onTap: (value){
          searchFocus.unfocus();
          setState(() {
            if(currentIndex == 0 || currentIndex == 1 || currentIndex == 4){
              //스크롤 젤위로 위치시키기
              controller!.jumpTo(0);
            }
            currentIndex = value;
          });
        },
      ),
    );
  }
}