import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../layout/simple_bar_layout.dart';

final textWidgetList = [
  '고객센터 09:00~18:00', '- 평일:전체 문의 상담가능', '- 주말/공휴일: 상담불가',
];

final titleTextList = [
  '주문 내역은 어떻게 확인할 수 있나요?',
  '결제 방법은 어떤 것이 있나요',
  '비회원주문 및 전화주문이 가능한가요?',
  '신용카드 무이자 할부가 되나요?',
  '신용카드 결제 후 할부 개월 수를 변경 가능한가요?',
  '가상계좌 은행을 변경 할 수 있나요?',
  '주문 후 결제 방법을 변경하고 싶은데 어떻게 해야 하나요?',
  '가상계좌 은행을 변경 할 수 있나요?',
  '주문 후 결제 방법을 변경하고 싶은데 어떻게 해야 하나요?',
];

final childrenTextList = [
  '우측 상단 프로필 사진을 클릭 후 [나의 쇼핑]을 통해 확인 가능합니다.',
  '신용카드 및 체크카드, 무통장 이금, 휴대폰 소액 결제, 네이버페이를 이용해 결제 가능합니다.',
  '전화주문은 준비중에 있습니다. 비회원주문은 가능하지만 일부 상품에 한해 제한 되었습니다.',
  '각 카드사 별로 상이하며, 카드사를 통해 확인 가능합니다.',
  '결제 후 결제 정보 변경은 불가능 합니다. 단, 결제 완료 단계에서는 취소 후 재주문을 통해 변경 가능합니다.',
  '한번 발급 받은 계좌번호는 변경이 불가능합니다.',
  '결제 후 결제 정보 변경은 불가능 합니다. 단, 결제 완료 단계에서는 취소 후 재주문을 통해 변경 가능합니다.',
  '한번 발급 받은 계좌번호는 변경이 불가능합니다.',
  '결제 후 결제 정보 변경은 불가능 합니다. 단, 결제 완료 단계에서는 취소 후 재주문을 통해 변경 가능합니다.'
];

class ServiceCenterPage extends StatelessWidget {
  const ServiceCenterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleBarLayout(
      title: '고객센터',
      topIcon: null,
      children: [
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 3));
            },
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for(int i=0; i<textWidgetList.length; i++)
                    textWidget(text: textWidgetList[i], fontSize: i == 0 ? 20 : 14),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: ElevatedButton(
                          onPressed: ()async{
                            final url = Uri.parse('tel:070 7620 3022');
                            if(await canLaunchUrl(url)){
                              launchUrl(url);
                            }
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.green,),
                          child: const Text('전화 문의하기', style: TextStyle(color: Colors.white),)
                      ),
                    ),
                    for(int i=0; i<titleTextList.length; i++)
                    listQuestions(titleText: titleTextList[i], childrenText: childrenTextList[i]),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Widget textWidget({
  required String text,
  required double? fontSize,
}) {
  return Container(
    padding: const EdgeInsets.fromLTRB(20, 10, 0, 15),
    child: Text(text, style: TextStyle(fontSize: fontSize,),),
  );
}

Widget listQuestions ({
  required String titleText,
  required String childrenText
}) {
  return ExpansionTile(
    title: Text(titleText, style: const TextStyle(fontSize: 15,),),
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
        child: Row(
          children: [
            Flexible(child: Text(childrenText)),
          ],
        ),
      ),
    ],
  );
}

