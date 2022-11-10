import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../layout/simple_bar_layout.dart';

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
              await Future.delayed(Duration(seconds: 3));
            },
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 15),
                      child: Text('고객센터 09:00~18:00', style: TextStyle(
                        fontSize: 20,
                      ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 15),
                      child: Text('- 평일:전체 문의 상담가능'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 15),
                      child: Text('- 주말/공휴일: 상담불가'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: ElevatedButton(
                          onPressed: ()async{
                            final url = Uri.parse('tel:070 7620 3022');
                            if(await canLaunchUrl(url)){
                              launchUrl(url);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            // side: BorderSide(
                            //   color: Colors.green
                            // )
                          ),
                          child: Text('전화 문의하기', style: TextStyle(color: Colors.white),)
                      ),
                    ),
                    ListQuestions(
                      asking: '주문 내역은 어떻게 확인할 수 있나요?',
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                          child: Text('우측 상단 프로필 사진을 클릭 후 [나의 쇼핑]을 통해 확인 가능합니다.'),
                        ),
                      ],
                    ),
                    ListQuestions(
                      asking: '결제 방법은 어떤 것이 있나요',
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                          child: Text('신용카드 및 체크카드, 무통장 이금, 휴대폰 소액 결제, 네이버페이를 이용해 결제 가능합니다.'),
                        ),
                      ],
                    ),
                    ListQuestions(
                      asking: '비회원주문 및 전화주문이 가능한가요?',
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                          child: Text('전화주문은 준비중에 있습니다. 비회원주문은 가능하지만 일부 상품에 한해 제한 되었습니다.'),
                        ),
                      ],
                    ),
                    ListQuestions(
                      asking: '신용카드 무이자 할부가 되나요?',
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                          child: Text('각 카드사 별로 상이하며, 카드사를 통해 확인 가능합니다.'),
                        ),
                      ],
                    ),
                    ListQuestions(
                      asking: '신용카드 결제 후 할부 개월 수를 변경 가능한가요?',
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                          child: Text('결제 후 결제 정보 변경은 불가능 합니다. 단, 결제 완료 단계에서는 취소 후 재주문을 통해 변경 가능합니다.'),
                        ),
                      ],
                    ),
                    ListQuestions(
                      asking: '가상계좌 은행을 변경 할 수 있나요?',
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                          child: Text('한번 발급 받은 계좌번호는 변경이 불가능합니다.'),
                        ),
                      ],
                    ),
                    ListQuestions(
                      asking: '주문 후 결제 방법을 변경하고 싶은데 어떻게 해야 하나요?',
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                          child: Text('결제 후 결제 정보 변경은 불가능 합니다. 단, 결제 완료 단계에서는 취소 후 재주문을 통해 변경 가능합니다.'),
                        ),
                      ],
                    ),
                    ListQuestions(
                      asking: '가상계좌 은행을 변경 할 수 있나요?',
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                          child: Text('한번 발급 받은 계좌번호는 변경이 불가능합니다.'),
                        ),
                      ],
                    ),
                    ListQuestions(
                      asking: '주문 후 결제 방법을 변경하고 싶은데 어떻게 해야 하나요?',
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                          child: Text('결제 후 결제 정보 변경은 불가능 합니다. 단, 결제 완료 단계에서는 취소 후 재주문을 통해 변경 가능합니다.'),
                        ),
                      ],
                    ),
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

class ListQuestions extends StatelessWidget {
  final String asking;
  final List<Widget> children;

  const ListQuestions({Key? key,
    required this.asking,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        asking,
        style: TextStyle(
          fontSize: 15,
        ),
      ),
      children: children,
    );
  }
}

