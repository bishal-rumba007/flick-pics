import 'package:flutter/material.dart';
import 'package:movie_app/screens/detail/detail_page.dart';
import 'package:movie_app/utils/color_manager.dart';

import '../../utils/device_size.dart';
import '../../utils/style_manager.dart';

class WatchListPage extends StatelessWidget {
  const WatchListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myList = [1];

    final h = DeviceSize.height;
    final w = DeviceSize.width;
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 28,)
        ),
        title: Text('Watch List', style: getMediumStyle(color: Colors.white, fontSize: 18),),
        toolbarHeight: 0.08 * h,
      ),
      body: myList.isEmpty ? Center(
        child: SizedBox(
          height: 0.18 * h,
          width: 0.54 * w,
          child: Column(
            children: [
              Image.asset('assets/images/emptyBox.png'),
              const Spacer(),
              Text('There is no movie yet!', style: getMediumStyle(color: Colors.white, fontSize: 18),),
              const Spacer(),
              Text('Find your movie by Type title, categories, years, etc ', style: getRegularStyle(color: ColorManager.detailText, fontSize: 14), textAlign: TextAlign.center,),
            ],
          ),
        ),
      ) : ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 2,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailPage(),));
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 0.012 * h),
              padding: EdgeInsets.symmetric(horizontal: 0.08 * w),
              height: 0.20 * h,
              width: double.infinity,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                      child: Image.network('https://cdn.marvel.com/content/1x/snh_online_6072x9000_posed_01.jpg', width: 0.25 * w, fit: BoxFit.fitHeight,)),
                  Padding(
                    padding: EdgeInsets.all(0.013 * h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Spiderman', style: getMediumStyle(color: Colors.white, fontSize: 18),),
                        SizedBox(height: 0.008 * h,),
                        Row(
                          children: [
                            const Icon(Icons.star_border_outlined, color: Colors.orange,),
                            SizedBox(width: 0.01 * w,),
                            Text('9.5', style: getMediumStyle(color: Colors.orange, fontSize: 16),),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            const Icon(Icons.discount, size: 24, color: Colors.white,),
                            SizedBox(width: 0.01 * w,),
                            Text('Action', style: getRegularStyle(color: Colors.white, fontSize: 14),),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            const Icon(Icons.calendar_today_sharp, size: 24, color: Colors.white,),
                            SizedBox(width: 0.01 * w,),
                            Text('2021', style: getRegularStyle(color: Colors.white, fontSize: 14),),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            const Icon(Icons.access_time_outlined, size: 24, color: Colors.white,),
                            SizedBox(width: 0.01 * w,),
                            Text('149 Minutes', style: getRegularStyle(color: Colors.white, fontSize: 14),),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      )
    );
  }
}
