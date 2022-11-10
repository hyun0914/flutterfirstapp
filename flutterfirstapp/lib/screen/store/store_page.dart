import 'package:flutter/material.dart';
import 'package:flutterfirstapp/screen/store/product_detail_page.dart';
import 'package:intl/intl.dart';

import '../banner/banner_page.dart';


class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  bool click = false;

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(Duration(seconds: 3));
            },
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Container(
                        color: Colors.grey[300],
                        height: 2,
                      ),
                      // 배너광고
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Container(
                          height: 200,
                          child: BannerPage(imgList: [
                            'assets/sale.png',
                            'assets/screen.png',
                          ],),
                        ),
                      ),
                      //스토어 작은 메뉴
                      Padding(
                        padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                        child: ProductRow('아이템1', '아이템2', '아이템3', '아이템4', '아이템5'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, right: 8, left: 8, bottom: 8),
                        child: ProductRow('아이템6', '아이템7', '아이템8', '아이템9', '아이템10'),
                      ),
                      Container(
                        color: Colors.grey[300],
                        height: 8,
                      ),
                    ],
                  ),
                ),
                productSliverGrid(),
              ],
            ),
          ),
        ),
      ],
    );
  }
  Widget ProductRow(String productName1, String productName2, String productName3, String productName4, String productName5){
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: ProductTypeButton('${productName1}'),
        ),
        Expanded(
          flex: 1,
          child: ProductTypeButton('${productName2}'),
        ),
        Expanded(
          flex: 1,
          child: ProductTypeButton('${productName3}'),
        ),
        Expanded(
          flex: 1,
          child: ProductTypeButton('${productName4}'),
        ),
        Expanded(
          flex: 1,
          child: ProductTypeButton('${productName5}'),
        ),
      ],
    );
  }

  Widget ProductTypeButton(String productTypeName){
    return SizedBox(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(11.0),
              child: Image.asset(
                'assets/food.png', width: MediaQuery.of(context).size.width / 6,
              ),
            ),
            Text(
              '${productTypeName}',
              style: TextStyle(
                fontSize: 12,
              ),
            )
          ],
        )
    );
  }

  //상품리스트
  SliverGrid productSliverGrid() {
    return SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 15),
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetailPage()));
                },
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(13, 7, 13, 7),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset('assets/japanese.jpg', fit: BoxFit.fill, width: 170,),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('상품이름 ', style: TextStyle(fontSize: 12,) ),
                        Text('1000' + '원', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,),
                    ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Icon(Icons.grade, size: 10,),

                        Text(' 4.5 ', style: TextStyle(fontSize: 11,)),
                        Text('리뷰 14,912', style: TextStyle(fontSize: 11, color: Colors.grey)),
                      ],
                    ),
                    ClipRRect(borderRadius: BorderRadius.circular(3),
                        child: Container(color: Colors.grey[300],
                            child: Padding(padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                      child: Text('무료배송', style: TextStyle(fontSize: 11, color: Colors.grey[700])),
                    )))
                  ],
                ),
              ),
            );
          },
          childCount: 10,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ));
  }
}
