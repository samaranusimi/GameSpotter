import 'package:flutter/material.dart';
import './/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

var _deviceHeigth;
var _deviceWidth;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    _deviceHeigth = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: [_featuredGamesWidget()],
    ));
  }

  Widget _featuredGamesWidget() {
    return SizedBox(
        height: _deviceHeigth*0.50,
        width: _deviceWidth,
        child: PageView(
            children: featuredGames.map((game) {
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(game.coverImage.url), fit: BoxFit.cover)),
          );
        }).toList()));
  }
}
