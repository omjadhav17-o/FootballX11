import 'package:flutter/material.dart';

class AboutLeague extends StatelessWidget {
  const AboutLeague({super.key, required this.imgOfleague});
  final String imgOfleague;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 50,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            imgOfleague,
            width: 50,
            height: 35,
          ),
          const Text(
            "Euros 2024",
            style: TextStyle(color: Colors.white70),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios_outlined)),
        ],
      ),
    );
  }
}
