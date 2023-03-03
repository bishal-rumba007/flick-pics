import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/utils/device_size.dart';

import '../../repositories/constants.dart';
import '../../utils/color_manager.dart';
import '../../utils/style_manager.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double h = DeviceSize.height;
    double w = DeviceSize.width;
    return Scaffold(
      backgroundColor: ColorManager.backGround,
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                snap: true,
                floating: true,
                backgroundColor: ColorManager.primary.withAlpha(500),
                title: Text(
                  'What do you want to watch?',
                  style: getSemiBoldStyle(color: Colors.white, fontSize: 18),
                ),
                elevation: 0,
                scrolledUnderElevation: 1,
                expandedHeight: 0.15 * h,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    children: [
                      SizedBox(
                        height: 0.11 * h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0.04 * w),
                        child: TextField(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                          },
                          textAlign: TextAlign.justify,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: ColorManager.inputColor2,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0.015 * h, horizontal: 0.04 * w),
                            hintText: 'Search',
                            hintStyle: getRegularStyle(
                                color: ColorManager.inputColor, fontSize: 18),
                            suffixIcon: Icon(
                              CupertinoIcons.search,
                              color: ColorManager.iconGray,
                              size: 28,
                            ),
                          ),
                          cursorColor: Colors.blue,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ];
          },
          body: Column(
            // padding: EdgeInsets.zero,
            children: [
              SizedBox(height: 0.02 * h,),
              Container(
                margin: EdgeInsets.only(left: 0.04 * w, right: 0.02 * w),
                height: 0.30 * h,
                width: double.infinity,
                // color: Colors.white,
                child: ListView.builder(
                    itemCount: movieList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final movie = movieList[index];
                      return Padding(
                        padding: EdgeInsets.only(right: 0.05 * w),
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 0.27 * h,
                              width: 0.40 * w,
                            ),
                            Positioned(
                              right: 0.008 * w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  movie.poster,
                                  height: 0.25 * h,
                                  width: 0.36 * w,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 1,
                              top: 0.156 * h,
                              child: Stack(
                                children: [
                                  Text(
                                    '${movie.id}',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                        fontSize: 90,
                                        fontWeight: FontWeight.w700,
                                        color: ColorManager.textGray,
                                    ),
                                  ),
                                  Text(
                                    '${movie.id}',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 90,
                                        fontWeight: FontWeight.w700,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 0.5
                                          ..color = ColorManager.blue
                                    ),
                                  ),
                                ],
                              )
                            ),
                          ],
                        ),
                      );
                    },
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.only(left: 0.02 * w),
                child: TabBar(
                  controller: _tabController,
                  labelStyle: getMediumStyle(color: Colors.white, fontSize: 15),
                  unselectedLabelStyle: getRegularStyle(color: Colors.white, fontSize: 15),
                  indicatorColor: ColorManager.inputColor,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 3,
                  isScrollable: true,
                  tabs: const [
                    Tab(
                      text: 'Now Playing',
                    ),
                    Tab(
                      text: 'Upcoming',
                    ),
                    Tab(
                      text: 'Top rated',
                    ),
                    Tab(
                      text: 'Popular',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                    controller: _tabController,
                    children: [
                      CustomTabBar(w: w),
                      CustomTabBar(w: w),
                      CustomTabBar(w: w),
                      CustomTabBar(w: w),
                    ]
                ),
              )
            ],
          )
      )
    );
  }
}

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.w,
  });

  final double w;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.04 * w),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: w * 0.03,
            mainAxisSpacing: w * 0.03,
            childAspectRatio: 0.67
          ),
          itemCount: movieTabs.length,
          itemBuilder:(context, index) {
            final movieItem = movieTabs[index];
            return ClipRRect(
              borderRadius: BorderRadius.circular(16),
                child: Image(image: NetworkImage(movieItem.poster),
                ),
            );
          },
      ),
    );
  }
}