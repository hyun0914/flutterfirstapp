import 'package:flutter/material.dart';

import '../layout/simple_bar_layout.dart';
import 'search_next_page.dart';

final _contentcontroller = TextEditingController();

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  String get_id = '';

  @override
  Widget build(BuildContext context) {
    return SimpleBarLayout(
      title: '검색창',
      topIcon: null,
      children: [
          SizedBox(
            height: 50,
            child: TextFormField(
              controller: _contentcontroller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: '검색어를 입력해주세요',
              ),
              onFieldSubmitted: (_){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchNextPage(get_test: _contentcontroller.text,)));
                print('Testgo');
              },
            ),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text('최근 검색어'),
              ],
            ),
          ),
          SizedBox(height: 5,),
          Expanded(child:
          get_id == ''?
          SizedBox():
            ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, int index) {
                return ListTile(
                    title: Text('검색어'),
                    trailing: IconButton(
                      onPressed: (){
                      },
                      icon: Icon(Icons.close),
                    ),
                );
              },
            )
          )
      ],);
  }
}