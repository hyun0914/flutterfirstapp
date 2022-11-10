import 'package:flutter/material.dart';

class ARPage extends StatelessWidget {
  const ARPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/1.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('화면', style: TextStyle(fontSize: 45),),
        ],
      ),
    );
  }
}

