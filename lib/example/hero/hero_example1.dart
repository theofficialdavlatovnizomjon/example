import 'package:flutter/material.dart';

class HeroExample1 extends StatefulWidget {
  const HeroExample1({Key? key}) : super(key: key);

  @override
  State<HeroExample1> createState() => _HeroExample1State();
}

List<String> assets = [
  '7.jpg',
  '8.jpg',
  'Mystery Shack Dark.jpg',
  'Passing By.png',
  'The Spirit Within.png',
];
List<String> title = [
  'Vegetables',
  'Fruits',
  'House',
  'On',
  'Anime',
];

List<String> desc = [
  'Vegetables are parts of plants that are consumed by humans or other animals as food.',
  'Fruits are the means by which flowering plants (also known as angiosperms) disseminate their seeds.',
  'Fruits are the means by which flowering plants (also known as angiosperms) disseminate their seeds.',
  'Fruits are the means by which flowering plants (also known as angiosperms) disseminate their seeds.',
  'Fruits are the means by which flowering plants (also known as angiosperms) disseminate their seeds.',
];

List<String> fullDesc = [
  "Vegetables are parts of plants that are consumed by humans or other animals as food. The original meaning is still commonly used and is applied to plants collectively to refer to all edible plant matter, including the flowers, fruits, stems, leaves, roots, and seeds. An alternative definition of the term is applied somewhat arbitrarily, often by culinary and cultural tradition. It may exclude foods derived from some plants that are fruits, flowers, nuts, and cereal grains, but include savoury fruits such as tomatoes and courgettes, flowers such as broccoli, and seeds such as pulses.",
  "Fruits are the means by which flowering plants (also known as angiosperms) disseminate their seeds. Edible fruits in particular have long propagated using the movements of humans and animals in a symbiotic relationship that is the means for seed dispersal for the one group and nutrition for the other; in fact, humans and many animals have become dependent on fruits as a source of food.[1] Consequently, fruits account for a substantial fraction of the world's agricultural output, and some (such as the apple and the pomegranate) have acquired extensive cultural and symbolic meanings.",
  "Vegetables are parts of plants that are consumed by humans or other animals as food. The original meaning is still commonly used and is applied to plants collectively to refer to all edible plant matter, including the flowers, fruits, stems, leaves, roots, and seeds. An alternative definition of the term is applied somewhat arbitrarily, often by culinary and cultural tradition. It may exclude foods derived from some plants that are fruits, flowers, nuts, and cereal grains, but include savoury fruits such as tomatoes and courgettes, flowers such as broccoli, and seeds such as pulses.",
  "Fruits are the means by which flowering plants (also known as angiosperms) disseminate their seeds. Edible fruits in particular have long propagated using the movements of humans and animals in a symbiotic relationship that is the means for seed dispersal for the one group and nutrition for the other; in fact, humans and many animals have become dependent on fruits as a source of food.[1] Consequently, fruits account for a substantial fraction of the world's agricultural output, and some (such as the apple and the pomegranate) have acquired extensive cultural and symbolic meanings.",
  "Fruits are the means by which flowering plants (also known as angiosperms) disseminate their seeds. Edible fruits in particular have long propagated using the movements of humans and animals in a symbiotic relationship that is the means for seed dispersal for the one group and nutrition for the other; in fact, humans and many animals have become dependent on fruits as a source of food.[1] Consequently, fruits account for a substantial fraction of the world's agricultural output, and some (such as the apple and the pomegranate) have acquired extensive cultural and symbolic meanings.",
];

class _HeroExample1State extends State<HeroExample1> {
  double w = 0;
  double h = 0;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Hero Animation App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 26,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w / 20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              color: Colors.black26,
              width: w,
              height: 1,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HeroExample1Detail(
                          asset: assets[index],
                          tag: title[index],
                          fullDesc: fullDesc[index],
                          title: title[index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: w / 2.8,
                    width: w,
                    margin: EdgeInsets.only(bottom: w / 20),
                    child: Row(
                      children: [
                        Hero(
                          tag: title[index],
                          child: Container(
                            width: w / 2.8,
                            height: w / 2.8,
                            margin: EdgeInsets.only(right: w / 20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                "assets/images/${assets[index]}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    title[index],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 26,
                                    ),
                                  ),
                                  Text(
                                    desc[index],
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black87,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              const Text(
                                "In-Stock",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green,
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(height: w / 20),
                itemCount: assets.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ***** DETAIL

// ignore: must_be_immutable
class HeroExample1Detail extends StatelessWidget {
  HeroExample1Detail({
    Key? key,
    required this.asset,
    required this.tag,
    required this.fullDesc,
    required this.title,
  }) : super(key: key);
  final String asset;
  final String tag;
  final String fullDesc;
  final String title;

  double w = 0;
  double h = 0;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        primary: true,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: tag,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              ),
              child: SizedBox(
                height: h / 2.2,
                width: w,
                child: Image.asset(
                  "assets/images/$asset",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: w / 20, vertical: 20),
              children: [
                Text(
                  tag,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 36,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  fullDesc,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "In-Stock",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.green,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
