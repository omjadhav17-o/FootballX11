import 'package:flutter/material.dart';
//import 'package:footba11x/asset/api_league.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LatestMatches extends StatelessWidget {
  const LatestMatches(
      {super.key,
      required this.scoreHomeT,
      required this.scoreawayT,
      required this.hometeamN,
      required this.awayteamN,
      required this.awaylogo,
      required this.homelogo});

  final String hometeamN;
  final String awayteamN;
  final int? scoreHomeT;
  final int? scoreawayT;
  final String homelogo;
  final String awaylogo;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //  ApiService a1 = ApiService();
        // a1.fetchData();
      },
      child: Container(
        margin: const EdgeInsets.all(12),
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Color.fromARGB(255, 43, 43, 61)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(width: 8),
            CircleAvatar(
              child: SvgPicture.network(
                homelogo,
                width: 35,
                height: 20,
                placeholderBuilder: (context) =>
                    const CircularProgressIndicator(),
              ),
            ),
            const SizedBox(
              width: 2,
            ),
            CircleAvatar(
              child: SvgPicture.network(
                awaylogo,
                width: 35,
                height: 20,
                placeholderBuilder: (context) =>
                    const CircularProgressIndicator(),
              ),
            ),
            const SizedBox(
              width: 60,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  hometeamN,
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  scoreHomeT.toString(),
                  style: const TextStyle(color: Colors.white70),
                )
              ],
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  awayteamN,
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  scoreawayT.toString(),
                  style: const TextStyle(color: Colors.white70),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
