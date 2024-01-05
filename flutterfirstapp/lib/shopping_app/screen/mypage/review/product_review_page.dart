import 'package:flutter/material.dart';
import '../../layout/simple_bar_layout.dart';

class ProductReviewPage extends StatelessWidget {
  const ProductReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleBarLayout(
        title: '상품리뷰',
        topIcon: null,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Text('리뷰'),
                Text('10'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Text('1.0'),
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
                          Text('10'),
                        ],
                      ),
                      Row(
                        children: [
                          Text('4점'),
                          Text('10'),
                        ],
                      ),
                      Row(
                        children: [
                          Text('3점'),
                          Text('10'),
                        ],
                      ),
                      Row(
                        children: [
                          Text('2점'),
                          Text('10'),
                        ],
                      ),
                      Row(
                        children: [
                          Text('1점'),
                          Text('10'),
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

          Padding(
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
                    Text('2022.07.22'),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Image.asset('assets/images/hen.png', fit: BoxFit.fill, width: 20, height: 20,),
                    SizedBox(width: 4,),
                    Text('디자인으로는 괜찮다,사용이 엄청나네 편리하다.')
                  ],
                ),
              ],
            ),
          ),
          Padding(
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
                    Text('2022.07.22'),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Image.asset('assets/images/hen.png', fit: BoxFit.fill, width: 20, height: 20,),
                    SizedBox(width: 4,),
                    Text('디자인으로는 괜찮다,사용이 엄청나네 편리하다.')
                  ],
                ),
              ],
            ),
          ),
          Padding(
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
                    Text('2022.07.22'),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Image.asset('assets/images/hen.png', fit: BoxFit.fill, width: 20, height: 20,),
                    SizedBox(width: 4,),
                    Text('디자인으로는 괜찮다,사용이 엄청나네 편리하다.')
                  ],
                ),
              ],
            ),
          ),
        ]
    );
  }
}
