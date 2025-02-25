import 'package:flutter/material.dart';

class PopInitExamplePage extends StatefulWidget {
  const PopInitExamplePage({super.key});

  @override
  State<PopInitExamplePage> createState() => _PopInitExamplePageState();
}

class _PopInitExamplePageState extends State<PopInitExamplePage> {
  // ignore: prefer_typing_uninitialized_variables
  bool isSuccess = false;
  String txt = "yo'q";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Pop InitState ishlashi',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontSize: 24,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Malumot: $txt",
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 18),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const PopInitDetailExamplePage();
                      },
                    ),
                  ).then((value) {
                    if (value != null) {
                      setState(() {
                        txt = value;
                      });
                      print(value);
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(346, 46),
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Keyingi oyna",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PopInitDetailExamplePage extends StatelessWidget {
  const PopInitDetailExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        automaticallyImplyLeading: true,
        title: const Text(
          'Malumot kiriting',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontSize: 24,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop("Siz keyingi oynaga otdingiz");
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(346, 46),
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Ortki oyna",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
