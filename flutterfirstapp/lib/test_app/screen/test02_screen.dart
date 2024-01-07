import 'package:flutter/material.dart';

// 위젯 화면 fill로 하는법
// Row 위젯으로 감싼 후 child 위젯을 Expanded 위젯으로 감싼다
// Column 위젯으로 감싼 후 crossAxisAlignment: CrossAxisAlignment.stretch를 준다.
// width: double.infinity,
// height: double.infinity,
// width: MediaQuery.of(context).size.width,


// 색상 지정법
// 참고사이트 https://bigstar-vlog.tistory.com/68
// color: Colors.green;
// color: Color.fromARGB();
// color: Color.fromRGBO();
// color: Color(0xff123456);

// 참고사이트 https://sikk.tistory.com/19
final textController = TextEditingController(text: '초기값텍스트');

class Test02Screen extends StatelessWidget {
  const Test02Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton: FloatingActionButton(onPressed: () {  },),
      // 참고 영상 https://www.youtube.com/watch?v=MW-KVmnXuiE
      // BottomAppBar 위젯 shape: CircularNotchedRectangle(), notchMargin: 7, 추가 하면 notched가 된다.
      // 뒤에 부분 표시할려면 Scaffold 위젯의 extendBody: true, 추가한다.
      // 중앙 이동
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 7,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.home),
            Icon(Icons.access_alarms),
            Icon(Icons.edit),
          ],
        )
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(bottom: 40),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // 그림자 설정
                // color 그림자 색상
                // blurRadius 그림자 효과를 선명도(0일 수록 그림자선이 선명해진다)
                // spreadRadius 그림자효과의 반경 설정(값이 높을 수록 넓어진다)
                // offset x,y의 offset값으로 x 값이 커질수록 오른쪽으로 y값이 커질수록 아래로 이동하여 표시된다
                // 참고사이트 https://gloria94.tistory.com/44
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                      const SizedBox(width: 20,),
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
                              Color.fromRGBO(255, 163, 77, 1),
                              Color.fromRGBO(238, 132, 34, 1),
                            ],
                          )
                        ),
                      ),
                    ],
                  ),
                ),

                Image.asset('assets/images/icicles1280.jpg', width: 200, height: 170,),

                // ExpansionTile 위젯을 펼쳤을 때 위아래에 줄이 있다.
                // Theme(
                //   data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                //   child: ExpansionTile()
                // ),
                // 이렇게 하면 없어진다.
                // 참고사이트 (flutter expansiontile no border)
                // https://stackoverflow.com/questions/64123839/flutter-remove-border-expansion-tile

                // ExpansionTile위젯에 모서리를 둥글게 하는법
                // ClipRRect, Container 위젯으로 감싼후 borderRadius를 지정한다.
                // ClipRRect(
                //   borderRadius: BorderRadius.all(Radius.circular(10)),
                //   child: ExpansionTile(),
                // ),
                // 참고사이트(expansiontile border radius flutter)
                // https://stackoverflow.com/questions/65331151/how-to-apply-rounded-borders-to-expanded-expansiontile-in-flutter
                const ExpansionTile(
                  initiallyExpanded: true, // 처음 화면들어왔을때 펼친상태로 할지 말지 설정
                  collapsedBackgroundColor: Colors.amber, // 닫혔을 때 색상
                  backgroundColor: Colors.lightGreen, // 열렸을 때 색상
                  collapsedIconColor: Color.fromRGBO(51, 51, 51, 1), // 닫혔을 때 아이콘 색상
                  iconColor: Color.fromRGBO(51, 51, 51, 1), // 열렸을 때 아이콘 색상
                  title: Text('제목',  style: TextStyle(fontSize: 20, ), ),
                  shape:  RoundedRectangleBorder(  // 하위 목록이 확장될 때 타일의 테두리 모양입니다
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  children: [ Text('내용부분 입니다.'), ]
                ),

                // 기존 위젯에서 벗어나게 하는법
                // clipBehavior: Clip.none,
                // 참고사이트 https://develop-designer.tistory.com/44

                // Positioned 위치 고정 하는 법
                // alignment: AlignmentDirectional.center,
                // 참고사이트
                // https://stackoverflow.com/questions/50819354/flutter-position-stack-widget-in-center
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  // Stack 참고사이트 https://ahang.tistory.com/24
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        width: 300,
                        height: 100,
                        color: Colors.grey,
                      ),
                      Positioned(
                        width: 100,
                        height: 50,
                        child: Container(
                          color: Colors.lightGreen,
                        )
                      )
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    width: 300,
                    height: 200,
                    decoration: const BoxDecoration(
                      // Border를 하단에만 줄 표시하기
                      // 참고사이트
                      // https://stackoverflow.com/questions/47423297/how-can-i-add-a-border-to-a-widget-in-flutter
                      // https://googleflutter.com/flutter-container-border-left-right-top-bottom/
                      border: Border(
                        bottom: BorderSide(color: Colors.red, width: 5.3),
                      ),
                      color: Colors.teal,
                    ),
                  ),
                ),

                // 이미지파일을 아이콘으로 사용하고 싶을 때 ImageIcon위젯을 사용하면 된다.
                // 참고사이트 https://www.woolha.com/tutorials/flutter-using-imageicon-widget-examples
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: const ImageIcon(AssetImage('assets/images/hen.png')),
                ),

                // 참고사이트 https://velog.io/@haram2/Tooltip-class
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: const Tooltip(
                    message: 'Tooltip 메세지 입니다.',
                    height: 40,
                    padding: EdgeInsets.all(8.0),
                    preferBelow: false,
                    textStyle: TextStyle(
                      fontSize: 24,
                    ),
                    showDuration: Duration(seconds: 2),
                    waitDuration: Duration(seconds: 1),
                    child: Text('Tooltip 테스트'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
