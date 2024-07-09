import 'package:flutter/material.dart';

class SportType extends StatelessWidget {
  const SportType({
    super.key,
    // required String imageT,
    // required String gameN,
  });
  // final String imageT = '';
  // final String gameN = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 117,
      width: 106,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 43, 43, 61)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/football.png'),
          const Text(
            'football',
            style: TextStyle(color: Colors.white70),
          )
        ],
      ),
    );
  }
}
