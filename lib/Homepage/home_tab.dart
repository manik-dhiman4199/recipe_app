
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/models/tags.dart';
import 'package:recipe_app/services/api_services.dart';
import 'package:recipe_app/strings/home_page_strings.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late Future<dynamic> recipeData;
  @override
  void initState() {
    super.initState();
    recipeData = getRecipes();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black.withAlpha(15),
      body: Padding(
        padding: const EdgeInsetsDirectional.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.all(15),
              child: Text(
                'Find Best Recipes For Cooking Here',
                style: customText.copyWith(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SearchBox(),
            Container(
                width: size.width, height: 100, child: const CategoriesRow()),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder<dynamic>(
                future: recipeData,
                builder: (context, snapshot) {
                  print(snapshot.connectionState.toString());
                  print(snapshot.data.toString());
                  return snapshot.hasData
                      ? Center(
                          child: Text('Yay'),
                        )
                      : Center(
                          child: Text('Nay'),
                        );
                })
            // Expanded(child: RecipesList())
          ],
        ),
      ),
    );
  }

  Future<dynamic> getRecipes() async {
    ApiService apiService = ApiService();
    return await apiService.get(endpoint: '/tags/list');
  }
}

class RecipesList extends StatelessWidget {
  const RecipesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, int index) {
          return Container(
            margin: EdgeInsetsDirectional.only(top: 10),
            height: 300,
            color: Colors.green[300],
          );
        });
  }
}

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: cuisinesList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, int index) {
          return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 7,
                        offset: Offset(5, 10))
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.green.shade600, Colors.green.shade200])),
              child: Center(
                  child: Text(
                cuisinesList[index],
                style: GoogleFonts.oswald(fontSize: 18, color: Colors.white),
              )));
        });
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        style: customText.copyWith(
          fontWeight: FontWeight.bold,
        ),
        decoration: const InputDecoration(
            hintText: 'Search for recipes',
            prefixIcon: Icon(Icons.search),
            enabledBorder: InputBorder.none,
            border: OutlineInputBorder()),
      ),
    );
  }
}
