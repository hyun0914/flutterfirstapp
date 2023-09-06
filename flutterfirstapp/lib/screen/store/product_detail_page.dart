import 'package:flutter/material.dart';

import '../layout/simple_bar_layout.dart';
import '../mypage/review/my_review_writing_page.dart';
import '../mypage/review/product_review_page.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage ({Key? key}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {

  bool clickicon = false;

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SimpleBarLayout(
      title: '',
      topIcon: null,
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Image.asset('assets/japanese.jpg'),
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                      child: const Column(
                        children: [
                          Row(
                            children: [
                              Text('상품이름', style: TextStyle(fontSize: 20),),
                            ],
                          ),
                          SizedBox(height: 3,),
                          Row(
                            children: [
                              Icon(Icons.star_border, size: 13,),
                              Icon(Icons.star_border, size: 13,),
                              Icon(Icons.star_border, size: 13,),
                              Icon(Icons.star_border, size: 13,),
                              Icon(Icons.star_border, size: 13,),
                              Text('(0)'),
                            ],
                          ),
                          Row(
                            children: [
                              Text('1000원', style: TextStyle(fontSize: 25),),
                            ],
                          ),

                          Row(
                            children: [
                              Text('50,000원 미만 구매시 4,000원', style: TextStyle(fontSize: 10),),
                            ],
                          ),
                          Row(
                            children: [
                              Text('50,000원 이상 구매시 무료배송', style: TextStyle(fontSize: 10),),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Container(
                      color: Colors.grey[300],
                      height: 8,
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Image.asset('assets/japanese.jpg'),
                          const SizedBox(height: 10,),
                          Image.asset('assets/japanese.jpg'),
                          const SizedBox(height: 10,),
                          Image.asset('assets/japanese.jpg'),
                          const SizedBox(height: 10,),
                          Image.asset('assets/japanese.jpg'),
                        ],
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.fromLTRB(5, 7, 0, 7),
                      child: const Row(
                        children: [
                          Text('상품내용'),
                        ],
                      ),
                    ),

                    Container(
                      color: Colors.grey[300],
                      height: 8,
                    ),

                    Container(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('리뷰 0'),
                          TextButton(onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyReviewWritingPage()));
                          }, child: const Text('리뷰 쓰기'))
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: const Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Text('0.0'),
                                SizedBox(height: 8,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.star_border, size: 13,),
                                    Icon(Icons.star_border, size: 13,),
                                    Icon(Icons.star_border, size: 13,),
                                    Icon(Icons.star_border, size: 13,),
                                    Icon(Icons.star_border, size: 13,),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text('5점'),
                                    Text('0'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('4점'),
                                    Text('0'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('3점'),
                                    Text('0'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('2점'),
                                    Text('0'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('1점'),
                                    Text('0'),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(
                      color: Colors.grey[300],
                      height: 8,
                    ),

                    Review3(),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ElevatedButton(
                                  onPressed: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductReviewPage()));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                  ),
                                  child: Text('리뷰 더 보기', style: TextStyle(fontSize: 20, color: Colors.white),)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.07,
          child: Row(
            children: [
              IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: (){
                    setState(() {
                      if(clickicon == false){
                        clickicon = true;
                      } else if(clickicon == true){
                        clickicon = false;
                      }
                    });
                  },
                  icon: (clickicon==false)? Icon(Icons.favorite_border,color:Colors.black) : Icon(Icons.favorite,color:Colors.black)),
              SizedBox(width: 3,),

              Expanded(
                flex: 4,
                child: ElevatedButton(
                    onPressed: (){
                      showModalBottomSheet(
                          context: context,
                          builder: (_){
                            return purchaseWindow();
                          });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    child: Text('구매 하기', style: TextStyle(fontSize: 20, color: Colors.white),)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Review3 extends StatefulWidget {
  const Review3({Key? key}) : super(key: key);

  @override
  State<Review3> createState() => _Review3State();
}

class _Review3State extends State<Review3> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 3,
          itemBuilder:(context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('닉네임'),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.star_border, size: 13,),
                      Icon(Icons.star_border, size: 13,),
                      Icon(Icons.star_border, size: 13,),
                      Icon(Icons.star_border, size: 13,),
                      Icon(Icons.star_border, size: 13,),
                      Text('날짜'),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Image.asset('assets/hen.png', fit: BoxFit.fill, width: 20, height: 20,),
                      SizedBox(width: 4,),
                      Text('리뷰내용')
                    ],
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}

class purchaseWindow extends StatefulWidget {
  const purchaseWindow({Key? key}) : super(key: key);

  @override
  State<purchaseWindow> createState() => _purchaseWindowState();
}

class _purchaseWindowState extends State<purchaseWindow> {
  int productnumber = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 150,
      child: Column(
        children: [
          Text('상품이름'),
          Row(
            children: [
              IconButton(onPressed: (){
                setState(() {
                  productnumber+=1;
                  //parseInt+=parseInt;
                });
              }, icon: Icon(Icons.add)),
              Text(productnumber.toString(), style: TextStyle(fontSize: 20,)),
              IconButton(onPressed: (){
                setState(() {
                  if(productnumber>1) {
                    productnumber -= 1;
                    //parseInt-=parseInt;
                  }
                });
              }, icon: Icon(Icons.remove)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('주문금액'),
              Text('1000')
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          side: BorderSide(
                              color: Colors.green
                          )
                      ),
                      child: Text('장바구니', style: TextStyle(fontSize: 20, color: Colors.green),)),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ElevatedButton(
                      onPressed: (){
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                      ),
                      child: Text('바로구매', style: TextStyle(fontSize: 20, color: Colors.white),)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}


