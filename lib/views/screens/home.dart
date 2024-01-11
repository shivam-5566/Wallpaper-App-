import 'package:flutter/material.dart';
import 'package:wallpaper_shivam/controller/ApiOperation.dart';
import 'package:wallpaper_shivam/model/photosModel.dart';
import 'package:wallpaper_shivam/views/screens/AboutUs.dart';
import 'package:wallpaper_shivam/views/screens/fullScreen.dart';
import 'package:wallpaper_shivam/views/widgets/SearchBar.dart';
import '../widgets/CustomAppBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<PhotosModel> trendingWallList;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    GetTrendingWallpapers();
  }

  GetTrendingWallpapers() async {
    trendingWallList = await ApiOperations.getTrendingWallpapers();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomAppBar(),
            IconButton(onPressed: (){
              Navigator.push(context, (MaterialPageRoute(builder: (context)=> AboutPage())));
            }, icon: Icon(Icons.account_balance))
          ],
        ),
        
        backgroundColor: Colors.white,
      ),


      body: isLoading ? Center(child: CircularProgressIndicator(),) :  SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SearchBarPage(),
            ),
            SizedBox(height:12),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              height: 700,
              child: RefreshIndicator(
                onRefresh: () async {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                },
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 13,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 400,
                  ),
                  itemCount: trendingWallList.length,
                  itemBuilder: ((context, index) => GridTile(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FullScreen(
                                        imgurl:
                                            trendingWallList[index].imgsrc)));
                          },
                          child: Hero(
                            tag: trendingWallList[index].imgsrc,
                            child: Container(
                              height: 700,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.amberAccent,
                                  borderRadius: BorderRadius.circular(12)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                    height: 700,
                                    width: 50,
                                    fit: BoxFit.cover,
                                    trendingWallList[index].imgsrc),
                              ),
                            ),
                          ),
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
