import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/features/home/domain/model/movie.dart';
import 'package:movie_app/repositories/constants.dart';
import 'package:movie_app/utils/device_size.dart';
import 'package:movie_app/utils/style_manager.dart';

import '../../utils/color_manager.dart';

class SearchMoviePage extends StatefulWidget {
  const SearchMoviePage({Key? key}) : super(key: key);

  @override
  State<SearchMoviePage> createState() => _SearchMoviePageState();
}

class _SearchMoviePageState extends State<SearchMoviePage> {
  late List<MovieFakeModel> movies;
  String query = '';

  @override
  void initState() {
    super.initState();
    movies = movieList;
  }


  @override
  Widget build(BuildContext context) {
    final h = DeviceSize.height;
    final w = DeviceSize.width;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: ColorManager.primary,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded, color: Colors.white,
                size: 28,)
          ),
          title: Text('Watch List',
            style: getMediumStyle(color: Colors.white, fontSize: 18),),
          toolbarHeight: 0.08 * h,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 26 * w),
                    child: Column(
                      children: [
                        SizedBox(height: 32 * h,),
                        buildSearch(),
                        SizedBox(
                          height: 20 * h,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: movies.length,
                            itemBuilder: (context, index) {
                              final book = movies[index];
                              return buildBook(book);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
    text: query,
    hintText: 'Search by Movie Name',
    onChanged: searchMovie,
  );

  Widget buildBook(MovieFakeModel movie) => ListTile(
    leading: Image.network(
      movie.poster,
      fit: BoxFit.cover,
      height: 60,
      width: 40,
    ),
    title: Text(movie.movieName.toString(), style: getMediumStyle(color: Colors.white, fontSize: 16),),
  );


  void searchMovie(String query) {
    final books = movieList.where((movie) {
      final titleLower = movie.movieName!.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      movies = movies;
    });
  }
}

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;
  const SearchWidget({
    Key? key, required this.text, required this.onChanged, required this.hintText,
  }) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorManager.inputColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: ColorManager.primary,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 21),
        suffixIcon: widget.text.isNotEmpty ? GestureDetector(
          child: Icon(Icons.close, color: ColorManager.iconGray),
          onTap: () {
            controller.clear();
            widget.onChanged('');
            FocusScope.of(context).requestFocus(FocusNode());
          },
        ) : Icon(CupertinoIcons.search, color: ColorManager.iconGray,),
        hintText: widget.hintText,
        hintStyle: getRegularStyle(
            color: ColorManager.textGray, fontSize: 16),
      ),
      cursorColor: Colors.white,
      onChanged: widget.onChanged,
    );
  }
}