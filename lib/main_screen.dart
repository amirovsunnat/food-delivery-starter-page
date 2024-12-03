import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:row_column/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 300,
            decoration: const BoxDecoration(
              color: Color(0xFFFF7622),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Stack(
                children: [
                  Positioned(
                    top: 30,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customIconButton(
                          icon: Icons.arrow_back,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                          },
                        ),
                        customIconButton(
                          color: _isLiked ? Colors.red : Colors.grey,
                          icon: _isLiked
                              ? Icons.favorite_rounded
                              : Icons.favorite_outline_outlined,
                          onPressed: () {
                            setState(() {
                              _isLiked = !_isLiked;
                              log(_isLiked.toString());
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: SizedBox(
                      width: width * 0.67,
                      height: height * 0.33,
                      child: Image.asset(
                        "assets/images/burger.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Burger Bistro",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/chef.png",
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Rose Garden",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    customRow("5.0", Icons.star_border_outlined),
                    const SizedBox(width: 40),
                    customRow("Freee", Icons.delivery_dining_outlined),
                    const SizedBox(width: 40),
                    customRow("20 min", Icons.alarm_add),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row customRow(
    String text,
    IconData icon,
  ) {
    return Row(
      children: [
        Icon(
          icon,
          size: 30,
          color: const Color(0xFFFF7622),
        ),
        const SizedBox(width: 5),
        Text(text),
      ],
    );
  }
}

Widget customIconButton({
  required VoidCallback onPressed,
  required IconData icon,
  Color color = Colors.grey,
}) {
  return IconButton(
    style: IconButton.styleFrom(
      alignment: Alignment.center,
      backgroundColor: Colors.white,
    ),
    onPressed: onPressed,
    icon: Center(
      child: Icon(
        icon,
        color: color,
        size: 30,
      ),
    ),
  );
}
