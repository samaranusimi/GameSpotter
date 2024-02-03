import 'package:flutter/material.dart';
import './/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

var _deviceHeight;
var _deviceWidth;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: [_featuredGamesWidget(), _gradientBox(), _topLayer()],
    ));
  }

  Widget _featuredGamesWidget() {
    return SizedBox(
        height: _deviceHeight * 0.50,
        width: _deviceWidth,
        child: PageView(
            children: featuredGames.map((game) {
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(game.coverImage.url),
                    fit: BoxFit.cover)),
          );
        }).toList()));
  }

  Widget _gradientBox() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: _deviceHeight * 0.80,
        width: _deviceWidth,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color.fromRGBO(35, 45, 59, 1.0), Colors.transparent],
                stops: [0.65, 1.0],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter)),
      ),
    );
  }

  Widget _topLayer() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: _deviceHeight * 0.02, horizontal: _deviceWidth * 0.02),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [_topBar()],
      ),
    );
  }

  Widget _topBar() {
    return SizedBox(
      height: _deviceHeight * 0.13,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            Icons.menu,
            color: Colors.white,
            size: 30,
          ),
          Row(
            children: [
              Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                width: _deviceWidth * 0.01,
              ),
              Icon(Icons.notifications, color: Colors.white, size: 30)
            ],
          )
        ],
      ),
    );
  }
}
