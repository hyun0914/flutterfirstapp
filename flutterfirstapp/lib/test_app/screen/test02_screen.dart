import 'package:flutter/material.dart';

class Test02Screen extends StatelessWidget {
  const Test02Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 140,
                      height: 149,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(12)),
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
                    const SizedBox(width: 20,),
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
                  ],
                ),
                const SizedBox(height: 20,),
                Image.asset('assets/images/icicles1280.jpg', width: 200, height: 170,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
