import 'package:flutter/material.dart';
import 'package:simple_app/models/getposts.dart';
import 'package:simple_app/pages/firstpage.dart';
import 'package:simple_app/widgets/bottom_navigation.dart';
import '../services/networkhelper.dart';
import 'package:banner_carousel/banner_carousel.dart';
import 'package:simple_app/models/banners.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? posts;
  bool isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    print('Sagarmatha');
    getData();
    super.initState();
  }

  getData() async {
    posts = await NetworkHelper().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(style: TextStyle(color: Colors.blue), 'Home'),
      ),
      backgroundColor: Color.fromARGB(255, 217, 236, 255),
      bottomNavigationBar: BottomNavigation(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Good Afternoon User',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          BannerCarousel(
            banners: BannerImages.listBanners,
            showIndicator: false,
            animation: false,
            height: 200,
            borderRadius: 10,
            indicatorBottom: false,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Visibility(
              visible: isLoaded,
              child: Container(
                child: ListView.builder(
                  itemCount: posts?.length,
                  itemBuilder: (context, index) {
                    final post = posts![index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.white,
                      child: ListTile(
                          contentPadding: EdgeInsets.all(10),
                          title: Text(
                            posts![index].name ?? 'No Data',
                          ),
                          leading: Image.asset('assets/Rectangle.png'),
                          subtitle: Text(
                            '\Rs. ${posts![index].price?.toString()}',
                          ),
                          trailing: Icon(Icons.arrow_forward),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return FirstPage(
                                post: post,
                              );
                            }));
                          }),
                    );
                  },
                ),
              ),
              replacement: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
