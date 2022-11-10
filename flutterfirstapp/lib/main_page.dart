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
    if(backPressTime == null || now.difference(backPressTime!) > Duration(seconds: 2)){
      backPressTime = now;
      showToatst('뒤로가기 버튼을 한번 더 누르시면 종료 됩니다.');
      return Future.value(false);
    }
    return Future.value(true);
  }

  int current_index = 0;
  final List<Widget> screenList = <Widget>[
    HomeCommunityPage(),
    StorePage(),
    ShoppingBasketPage(),
    MyPage(),
    // ARPage(),
  ];

  void showToatst(String messsage) {
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

  String get_id = '';

  @override
  void initState() {
    chekConnectivity();
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
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
          Row(
            children: [
              Image.asset('assets/hamburger.png', fit: BoxFit.fill, width: 30, height: 30,),
              SizedBox(width: 10,),
              InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => SearchPage())),
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(5)),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      SizedBox(width: 8,),
                      Icon(Icons.search, color: Colors.black,),
                      SizedBox(width: 8,),
                      Text('통합검색', style: TextStyle(color: Colors.black,),),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 15,),
            ],
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: 720,
          margin: EdgeInsets.only(bottom: kToolbarHeight),
          child: WillPopScope(
            child: screenList.elementAt(current_index),
            onWillPop: onBackTwo,
          ),
        ),
      ),

      floatingActionButton:  current_index == 0 ? FloatingActionButton(
        elevation: 0.0,
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CommunityWritingPage()));
        },
        child: Icon(Icons.add_circle_outline, size: 40,)
      )
      : SizedBox(),

      // 하단 네비게이션바
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: current_index,
        elevation: 0.0,
        items: [
          BottomNavigationBarItem(
              icon: (current_index==0)? Icon(Icons.home) : Icon(Icons.home_outlined),
              label: '커뮤니티'),

          BottomNavigationBarItem(
              icon: (current_index==1)? Icon(Icons.storefront_rounded, size: 22,) : Icon(Icons.storefront, size: 22),
              label: '스토어'),

          BottomNavigationBarItem(
              icon: (current_index==2)?  Icon(Icons.shopping_cart) : Icon(Icons.shopping_cart_outlined),
              label: '장바구니' ),
          BottomNavigationBarItem(
              icon: (current_index==3)? Icon(Icons.person) : Icon(Icons.perm_identity),
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
            if(current_index == 0 || current_index == 1 || current_index == 4){
              //스크롤 젤위로 위치시키기
              controller?.jumpTo(0);
            }
            current_index = value;
          });
        },
      ),
    );
  }
}