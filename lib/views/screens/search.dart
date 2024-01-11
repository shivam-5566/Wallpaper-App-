import 'package:flutter/material.dart';
import 'package:wallpaper_shivam/controller/ApiOperation.dart';
import 'package:wallpaper_shivam/model/photosModel.dart';
import 'package:wallpaper_shivam/views/screens/fullScreen.dart';
import 'package:wallpaper_shivam/views/widgets/SearchBar.dart';
import '../widgets/CustomAppBar.dart';

class SearchScreen extends StatefulWidget {
  String query;
  SearchScreen({super.key,required this.query});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
late List<PhotosModel> searchResults;
 bool isLoading = true;
  GetSearchResults() async{
   searchResults = await ApiOperations.searchWallpapers(widget.query);
   setState(() {
  isLoading = false;
   });
 }
  @override
  void initState(){
    super.initState();
    GetSearchResults();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const CustomAppBar(),
        backgroundColor: Colors.white,
      ),
      body: isLoading ? Center(child: CircularProgressIndicator(),) : SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SearchBarPage(),
            ),
           SizedBox(height: 12,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 13,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 400,
                ),
                itemCount: searchResults.length,
                itemBuilder: ((context, index) => GridTile(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FullScreen(
                                  imgurl: searchResults[index].imgsrc)));
                    },
                    child: Hero(
                      tag:  searchResults[index].imgsrc,
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
                                searchResults[index].imgsrc ),
                            ),
                          ),
                    ),
                  ),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
