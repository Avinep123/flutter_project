import 'package:flutter/material.dart';
import 'package:simple_app/models/getposts.dart';
import 'homepage.dart';

class FirstPage extends StatelessWidget {
  final Post post;

  const FirstPage({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 219, 224, 228),
          centerTitle: true,
          title: Text(style: TextStyle(color: Colors.blue), "Product Detail")),
      body: Column(
        children: [
          Container(
            height: 300,
            color: Color.fromARGB(255, 219, 224, 228),
            child: Center(
              child: Image.asset("assets/Flower.png"),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.name ?? 'No Data',
                  ),
                  Text(
                    '\Rs. ${post.price?.toString()}',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(style: TextStyle(fontSize: 16), 'Description'),
                  SizedBox(
                    height: 8,
                  ),
                  Text(post.description ?? 'No Data'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 160,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('Buy Now'),
                          )),
                      SizedBox(
                          width: 160,
                          child: OutlinedButton(
                              onPressed: () {}, child: Text('Add to Cart'))),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
