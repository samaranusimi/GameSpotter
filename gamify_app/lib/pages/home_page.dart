import 'package:flutter/material.dart';
import './/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _deviceHeight;
  var _deviceWidth;
  var selectedGame;

  @override
  void initState() {
    super.initState();
    selectedGame = 0;
  }

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
            onPageChanged: (index) {
              setState(() {
                selectedGame = index;
              });
            },
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
        children: [
          _topBar(),
          SizedBox(
            height: _deviceHeight * 0.13,
          ),
          _featuredGamesInfo()
        ],
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

  Widget _featuredGamesInfo() {
    return SizedBox(
      height: _deviceHeight * 0.12,
      width: _deviceWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            featuredGames[selectedGame].title,
            maxLines: 2,
            style:
                TextStyle(color: Colors.white, fontSize: _deviceHeight * 0.04),
          ),
          SizedBox(
            height: _deviceHeight * 0.0009,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: featuredGames.map((_game) {
              double _circleRadius = _deviceHeight * 0.002;
              bool _isActive = _game.title == featuredGames[selectedGame].title;
              return Container(
                margin: EdgeInsets.only(right: _deviceWidth * 0.015),
                height: _circleRadius * 2,
                width: _circleRadius * 2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: _isActive ? Colors.blueGrey : Colors.grey),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
