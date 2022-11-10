import 'package:flutter/material.dart';

import 'layout/simple_bar_layout.dart';


class InterestedItemsPage extends StatefulWidget {
  const InterestedItemsPage({Key? key}) : super(key: key);

  @override
  State<InterestedItemsPage> createState() => _InterestedItemsPageState();
}

class _InterestedItemsPageState extends State<InterestedItemsPage> {
  String clickstr = '편집';

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
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: (){
                      setState(() {
                        if(clickstr == '편집') {
                          clickstr = '삭제';
                        } else if(clickstr == '삭제'){
                          clickstr = '편집';
                        }
                      });
                    },
                    child: Text(clickstr.toString(),
                      style: TextStyle(fontSize: 20),),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(Duration(seconds: 3));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              // child: GridView.builder(
              //   physics: BouncingScrollPhysics(),
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //     crossAxisSpacing: 12.0,
              //     mainAxisSpacing: 14.0,
              //   ),
              //   itemBuilder: (context, index) {
              //     return Image.asset('assets/image/expic.png', width: MediaQuery.of(context).size.width/3,);
              //   },
              //   itemCount: 30,
              // ),
            ),
          )
          )
        ]);
  }
}

