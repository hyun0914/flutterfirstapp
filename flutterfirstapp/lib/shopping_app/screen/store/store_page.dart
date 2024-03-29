import 'package:flutter/material.dart';

import '../banner/banner_page.dart';
import 'product_detail_page.dart';


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
              await Future.delayed(const Duration(seconds: 3));
            },
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Container(
                        color: Colors.grey[300],
                        height: 2,
                      ),
                      // 배너광고
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: SizedBox(
                          height: 200,
                          child: BannerPage(imgList: [
                            'assets/images/sale.png',
                            'assets/images/screen.png',
                            'assets/images/email_img.png'
                          ],),
                        ),
                      ),
                      //스토어 작은 메뉴
                      Container(
                        padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                        child: productRow('아이템1', '아이템2', '아이템3', '아이템4', '아이템5'),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 8, right: 8, left: 8, bottom: 8),
                        child: productRow('아이템6', '아이템7', '아이템8', '아이템9', '아이템10'),
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
  Widget productRow(String productName1, String productName2, String productName3, String productName4, String productName5){
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: productTypeButton(productName1),
        ),
        Expanded(
          flex: 1,
          child: productTypeButton(productName2),
        ),
        Expanded(
          flex: 1,
          child: productTypeButton(productName3),
        ),
        Expanded(
          flex: 1,
          child: productTypeButton(productName4),
        ),
        Expanded(
          flex: 1,
          child: productTypeButton(productName5),
        ),
      ],
    );
  }

  Widget productTypeButton(String productTypeName){
    return SizedBox(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(11.0),
              child: Image.asset(
                'assets/images/food.png', width: MediaQuery.of(context).size.width / 6,
              ),
            ),
            Text(
              productTypeName,
              style: const TextStyle(
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
                            child: Image.asset('assets/images/japanese.jpg', fit: BoxFit.fill, width: 170,),
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('상품이름 ', style: TextStyle(fontSize: 12,) ),
                        Text('1000' + '원', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,),
                    ],
                    ),
                    const Row(
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
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ));
  }
}
