import 'package:flutter/material.dart';
import 'package:footba11x/asset/match_apiservice.dart';
import 'package:footba11x/models/finished_matchs.dart';

import 'package:footba11x/widgets/latestmatch.dart';
import 'package:footba11x/widgets/league_overview.dart';
import 'package:footba11x/widgets/typeofsport.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<MatchA>> futureMatches;
  bool isLoading = true;
  final String img = 'https://crests.football-data.org/ec.png';

  @override
  void initState() {
    super.initState();
    futureMatches = ApiServiceMatch().fetchData();

    futureMatches.then((matches) {
      setState(() {
        isLoading = false;
      });
    }).catchError((error) {
      setState(() {
        isLoading = false;
      });
      // print('Error: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 34, 34, 50),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: const Color.fromARGB(255, 249, 247, 247),
          ),
          const SizedBox(
            width: 15,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
            color: const Color.fromARGB(255, 249, 247, 247),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 34, 34, 50),
        title: const Text(
          'Live Score',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color.fromARGB(255, 36, 107, 253),
                      Color.fromARGB(255, 12, 12, 105),
                    ]),
              ),
              margin: const EdgeInsets.all(20),
              height: 200,
              child: const Center(
                child: Text(
                  'football is amazing here are top news',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.all(20),
              height: 117,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const SportType(),
                  const SizedBox(
                    width: 20,
                  ),
                  const SportType(),
                  const SizedBox(
                    width: 20,
                  ),
                  const SportType(),
                  const SizedBox(
                    width: 20,
                  ),
                  Image.network(img),
                ],
              ),
            ),
            const SizedBox(height: 15),
            AboutLeague(
              imgOfleague: img,
            ),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : FutureBuilder<List<MatchA>>(
                    future: futureMatches,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            'Error: ${snapshot.error}',
                            style: const TextStyle(color: Colors.white70),
                          ),
                        );
                      } else if (snapshot.hasData) {
                        List<MatchA>? matches = snapshot.data;
                        return SizedBox(
                          height: 500, // Set a fixed height for the ListView
                          child: ListView.builder(
                            itemCount: matches?.length ?? 0,
                            itemBuilder: (context, index) {
                              MatchA match = matches![index];
                              return LatestMatches(
                                awaylogo: match.awayTeam.crest,
                                awayteamN: match.awayTeam.name,
                                homelogo: match.homeTeam.crest,
                                hometeamN:
                                    match.homeTeam.name, // Corrected typo here
                                scoreHomeT: match.score.fullTime["home"],
                                scoreawayT: match.score.fullTime["away"],
                              );
                            },
                          ),
                        );
                      }

                      return const Center(
                        child: Text(
                          "Error: cannot find matches",
                          style: TextStyle(color: Colors.white70),
                        ),
                      );
                    }),
          ],
        ),
      ),
    );
  }
}
