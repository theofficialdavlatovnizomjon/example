import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'http_example1_model.dart';

class HttpExample1 extends StatefulWidget {
  const HttpExample1({super.key});

  @override
  State<HttpExample1> createState() => _HttpExample1State();
}

class _HttpExample1State extends State<HttpExample1> {
  List<HttpExample1Model> data = [];

  @override
  void initState() {
    super.initState();
    getHttp();
  }

  Future getHttp() async {
    final response = await http.get(
      Uri.parse('https://nbu.uz/uz/exchange-rates/json/'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      data = jsonData
          .map((courseJson) => HttpExample1Model.fromJson(courseJson))
          .toList();
      return data;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          elevation: 0,
          duration: Duration(milliseconds: 650),
          behavior: SnackBarBehavior.floating,
          content: Text(
            "Failed to fetch courses",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
        ),
      );
      throw Exception('Failed to fetch courses');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Pul kursi',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 24,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black26, width: 1),
              color: Colors.grey[200],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${index + 1}-${data[index].code}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '${data[index].title}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${data[index].date}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '${data[index].nbuBuyPrice}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 20);
        },
        itemCount: data.length,
      ),
    );
  }
}
