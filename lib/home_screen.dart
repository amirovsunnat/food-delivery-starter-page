import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text("Birinchi widget"),
          const Icon(Icons.abc),
          Container(
            width: 100,
            height: 100,
            color: Colors.amberAccent,
          ),
          const Spacer(
            flex: 2,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 150,
                height: 150,
                color: Colors.black54,
              ),
              const SizedBox(
                width: 20,
              ),
              SvgPicture.asset("assets/svgs/taxi_svg.svg"),
              const SizedBox(width: 95),
              Image.network(
                  width: 100,
                  "https://flutter.github.io/assets-for-api-docs/assets/widgets/align_constant.png"),
            ],
          )
        ],
      ),
    );
  }
}
