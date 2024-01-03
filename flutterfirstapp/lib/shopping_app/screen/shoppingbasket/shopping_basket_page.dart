import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../store/product_detail_page.dart';

var _isChekedall = false;
var _isChekedlist = false;

class ShoppingBasketPage extends StatefulWidget {
  const ShoppingBasketPage({Key? key}) : super(key: key);

  @override
  State<ShoppingBasketPage> createState() => _ShoppingBasketPageState();
}

class _ShoppingBasketPageState extends State<ShoppingBasketPage> {
  String get_id = '';

  int priceSum = 0;
  @override
  Widget build(BuildContext context) {
    var price = NumberFormat('###,###,###');
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                          value: _isChekedall,
                          onChanged: (value){
                            setState(() {
                              if(_isChekedall == false){
                                _isChekedall = true;
                                //_isChekedlist = true;
                              }
                              else if(_isChekedall == true){
                                _isChekedall = false;
                                //_isChekedlist = false;
                              }
                            }
                            );
                          }),
                      Text('모두선택'),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: TextButton(
                      onPressed: (){
                      },
                      child: Text('전체삭제', style: TextStyle(color: Colors.black),),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    await Future.delayed(Duration(seconds: 3));
                  },
                  child: SizedBox(),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('배송비 무료'),
                  ),
                  Container(
                    height: 8,
                    color: Colors.grey[300],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15, right: 15,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('총 상품금액'),
                              Text('${price.format(int.parse('${priceSum}'))}' + '원'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('총 배송비'),
                              Text('+0원'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('총 할인금액'),
                              Text('-0원'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('결제 금액', style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),),
                              Text('${price.format(int.parse('${priceSum}'))}' + '원', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700,)),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8, bottom: 35),
                                child: ElevatedButton(
                                    onPressed: (){
                                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => BuyerInformation(
                                      //   get_id: widget.get_id, get_plid: widget.get_plid, get_title: widget.get_title, get_price: widget.get_price, get_productnumber: productnumber,)));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.green,
                                    ),
                                    child: Text('바로구매', style: TextStyle(fontSize: 20, color: Colors.white),)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}



