import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class GradientShadow extends StatelessWidget {
  const GradientShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(1, 98, 65, 1),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Container(
              width: 140,
              height: 149,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.08),
                    spreadRadius: 0,
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  )
                ],
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(255, 216, 67, 1),
                    Color.fromRGBO(238, 175, 11, 1),
                  ],
                )
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              width: 140,
              height: 149,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.08),
                    spreadRadius: 0,
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  )
                ],
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(255, 163, 77, 1),
                    Color.fromRGBO(238, 132, 34, 1),
                  ],
                )
              ),
            ),
            const SizedBox(height: 30,),
            FlutterCarousel(
              options: CarouselOptions(
                height: 400.0,
                showIndicator: true,
                slideIndicator: const CircularSlideIndicator(),
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 4),
                enableInfiniteScroll: true,
              ),
              items: [1,2,3,4].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: const BoxDecoration(color: Colors.green),
                      child: Text('text $i', style: const TextStyle(fontSize: 16.0),)
                    );
                  },
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
