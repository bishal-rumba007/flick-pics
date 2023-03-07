import 'package:flutter/material.dart';
import 'package:movie_app/utils/color_manager.dart';
import 'package:movie_app/utils/style_manager.dart';

import '../../utils/device_size.dart';


class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with SingleTickerProviderStateMixin{

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double h = DeviceSize.height;
    double w = DeviceSize.width;

    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            onPressed: (){},
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 28,)
        ),
        title: Text('Detail', style: getSemiBoldStyle(color: Colors.white, fontSize: 18),),
        toolbarHeight: 0.08 * h,
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.bookmark, color: Colors.white, size: 32,)
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 0.014 * h,),
          Stack(
            children: [
              SizedBox(
                height: 0.34 * h,
                width: double.infinity,
              ),
              ClipRRect(
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
                  child: Image.network('https://images8.alphacoders.com/121/1218962.jpg', height: 0.27 * h, width: double.infinity, fit: BoxFit.fitWidth,),
              ),
              Positioned(
                top: 0.22 * h,
                right: 0.03 * w,
                child: Container(
                  height: 0.035 * h,
                  width: 0.14 * w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ColorManager.transparent
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.star_border_outlined, color: Colors.orange,),
                      Text('9.5', style: getSemiBoldStyle(color: Colors.orange, fontSize: 14),)
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 29,
                child: SizedBox(
                  height: 0.17 * h,
                  width: 0.8 * w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network('https://cdn.marvel.com/content/1x/snh_online_6072x9000_posed_01.jpg', height: 0.17 * h, width:  0.26 * w, fit: BoxFit.fitWidth,),
                      ),
                      const SizedBox(width: 15,),
                      Expanded(child: Text('Spiderman No Way Home', style: getSemiBoldStyle(color: Colors.white, fontSize: 18),))
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 0.022 * h,),
          SizedBox(
            height: 50,
            width: 310,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_today_sharp, size: 24, color: ColorManager.detailText,),
                    const SizedBox(width: 5,),
                    Text('2021', style: getMediumStyle(color: ColorManager.detailText, fontSize: 14),),
                  ],
                ),
                VerticalDivider(
                  width: 5,
                  thickness: 2,
                  color: ColorManager.detailText,
                  indent: 10,
                  endIndent: 10,
                ),
                Row(
                  children: [
                    Icon(Icons.access_time_outlined, size: 24, color: ColorManager.detailText,),
                    const SizedBox(width: 5,),
                    Text('148 Minutes', style: getMediumStyle(color: ColorManager.detailText, fontSize: 14),),
                  ],
                ),
                VerticalDivider(
                  width: 5,
                  thickness: 2,
                  color: ColorManager.detailText,
                  indent: 10,
                  endIndent: 10,
                ),
                Row(
                  children: [
                    Icon(Icons.discount, size: 24, color: ColorManager.detailText,),
                    const SizedBox(width: 5,),
                    Text('Action', style: getMediumStyle(color: ColorManager.detailText, fontSize: 14),),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 0.01 * h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.04 * w),
            child: Align(
              alignment: AlignmentDirectional.topStart,
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
                    text: 'About Movie',
                  ),
                  Tab(
                    text: 'Reviews',
                  ),
                  Tab(
                    text: 'Cast',
                  ),
                ],
              ),
            ),
          ),
          
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.08 * w, vertical: 0.02 * h),
              child: TabBarView(
                controller: _tabController,
                  children: [
                    const Text('From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.'),
                    ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  const CircleAvatar(
                                    backgroundColor: Colors.amberAccent,
                                    radius: 36,
                                    child: Icon(Icons.person, color: Colors.white, size: 50,),
                                  ),
                                  const SizedBox(height: 15,),
                                  Text('6.6', style: getMediumStyle(color: ColorManager.blue, fontSize: 14),)
                                ],
                              ),
                              const SizedBox(width: 15,),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('John Doe', style: getMediumStyle(color: Colors.white, fontSize: 14),),
                                    const SizedBox(height: 5,),
                                    Text('From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government.',
                                      style: getRegularStyle(color: Colors.white, fontSize: 13),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 55,
                            childAspectRatio: 1.02,
                          ),
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(
                                  height: 86,
                                  width: 86,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                                Text('Benedict Cumberbatch', style: getMediumStyle(color: Colors.white, fontSize: 14), textAlign: TextAlign.center,)
                              ],
                            );
                          },
                      ),
                    )
                  ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}
