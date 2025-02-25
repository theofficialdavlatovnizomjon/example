import 'package:flutter/material.dart';

class TabBarExample2 extends StatefulWidget {
  const TabBarExample2({super.key});

  @override
  State<TabBarExample2> createState() => _TabBarExample2State();
}

class _TabBarExample2State extends State<TabBarExample2> {
  int current = 0;

  double changePositionedOfLine() {
    switch (current) {
      case 0:
        return 0;
      case 1:
        return 78;
      case 2:
        return 192;
      case 3:
        return 263;
      default:
        return 0;
    }
  }

  double changeContainerWidth() {
    switch (current) {
      case 0:
        return 50;
      case 1:
        return 80;
      case 2:
        return 50;
      case 3:
        return 50;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List tabs = [_popular(), _mostVisited(), _recent(), _explore()];
    List text = ['Popular', 'Most Visited', 'Recent', 'Explore'];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tab Bar Example",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 15),
              width: size.width,
              height: size.height * 0.05,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      width: size.width,
                      height: size.height * 0.04,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: tabs.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: index == 0 ? 10 : 23, top: 7),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    current = index;
                                  });
                                },
                                child: Text(
                                  text[index],
                                  style: TextStyle(
                                    fontSize: current == index ? 16 : 14,
                                    fontWeight: current == index
                                        ? FontWeight.w400
                                        : FontWeight.w300,
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  AnimatedPositioned(
                    curve: Curves.fastLinearToSlowEaseIn,
                    bottom: 0,
                    left: changePositionedOfLine(),
                    duration: const Duration(milliseconds: 500),
                    child: AnimatedContainer(
                      margin: const EdgeInsets.only(left: 10),
                      width: changeContainerWidth(),
                      height: size.height * 0.008,
                      decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.fastLinearToSlowEaseIn,
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 20),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 1,
                itemBuilder: (context, index) => tabs[current],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_popular() {
  return Container(
    height: 800,
    width: 375,
    color: Colors.blue,
    child: Center(
      child: Text(
        'Popular',
        style: TextStyle(fontSize: 30),
      ),
    ),
  );
}

_mostVisited() {
  return Container(
    height: 800,
    width: 375,
    color: Colors.red,
    child: Center(
      child: Text(
        'Popular',
        style: TextStyle(fontSize: 30),
      ),
    ),
  );
}

_recent() {
  return Container(
    height: 800,
    width: 375,
    color: Colors.green,
    child: Center(
      child: Text(
        'Popular',
        style: TextStyle(fontSize: 30),
      ),
    ),
  );
}

_explore() {
  return Container(
    height: 800,
    width: 375,
    color: Colors.green,
    child: Center(
      child: Text(
        'Explore',
        style: TextStyle(fontSize: 30),
      ),
    ),
  );
}
