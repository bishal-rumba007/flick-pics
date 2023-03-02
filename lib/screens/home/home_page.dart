import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/utils/device_size.dart';

import '../../utils/color_manager.dart';
import '../../utils/style_manager.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                        padding: EdgeInsets.symmetric(horizontal: 0.05 * w),
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
                                color: ColorManager.textGray, fontSize: 18),
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
          body: ListView()
      )
    );
  }
}