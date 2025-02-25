import 'package:flutter/material.dart';

class TabBarExample1 extends StatefulWidget {
  const TabBarExample1({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TabBarExample1eState createState() => _TabBarExample1eState();
}

class _TabBarExample1eState extends State<TabBarExample1>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Tab Bar Exemple',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 30,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(
                icon: Icon(Icons.home, size: 30),
              ),
              Tab(
                icon: Icon(Icons.search, size: 30),
              ),
              Tab(
                icon: Icon(Icons.person, size: 30),
              ),
            ],
          ),
          SizedBox(
            height: 400,
            child: TabBarView(
              controller: _tabController,
              children: const [
                Center(
                  child: Text(
                    'home',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'search',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'person',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
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
