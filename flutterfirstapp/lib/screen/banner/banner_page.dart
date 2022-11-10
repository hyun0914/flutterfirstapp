import 'dart:async';
import 'package:flutter/material.dart';

import 'banner_details_page.dart';

class BannerPage extends StatefulWidget {
  final List imgList;
  const BannerPage({
    required this.imgList,
    Key? key}) : super(key: key);

  @override
  State<BannerPage> createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {

  Timer? timer;
  PageController controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      int currentPage = controller.page!.toInt();
      int nextPage = currentPage + 1;
      if(nextPage > widget.imgList.length-1){
        nextPage = 0;
      }

      controller.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 400),
          curve: Curves.linear,
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    if(timer != null){
      timer!.cancel();
    }
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 720,
        child: PageView.builder(
          itemCount: widget.imgList.length,
          controller: controller,
          itemBuilder: (_, int index) {
            return InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => BannerDetailsPage(imgName: widget.imgList[index])));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                      widget.imgList[index],
                      fit: BoxFit.fill,
                    ),
              ),
            );
          },
        ),
      ),
    );
  }
}

