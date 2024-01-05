import 'package:flutter/material.dart';
import '../layout/simple_bar_layout.dart';

class OrderDeliveryLookupPage extends StatelessWidget {
  const OrderDeliveryLookupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleBarLayout(
      title: '주문배송조회',
      topIcon: null,
      children: [
        Expanded(child: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 3));
          },
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(45, 10, 0, 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('구매확정'),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Image.asset('assets/images/hamburger.png', width: MediaQuery.of(context).size.width/5,),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          children: [
                            Text('먼로금 크리스탈 블루 1개'),
                            Text('43,752원')
                          ],
                        ),
                      ],
                    )

                  ],
                ),
              );
            },
          ),
        ))
      ],);
  }
}
