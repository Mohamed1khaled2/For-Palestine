import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/static/landmark_of_palestine.dart';
import '../widgets/custome_image.dart';
import '../widgets/custome_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          scrollBehavior: const ScrollBehavior(),
          slivers: [
            const AppBar(),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 15.w, right: 15.w, top: 15.w),
                    child: TextFormField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.w),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.w),
                              borderSide: BorderSide.none),
                          hintTextDirection: TextDirection.rtl,
                          hintText: "بحث",
                          suffixIcon: const Icon(
                            Icons.search,
                            size: 35,
                          ),
                          suffixIconColor: Colors.grey),
                    ),
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h),
                        child: const CustomImage(
                          url:
                              "https://www.siyassa.org.eg/Media/News/2023/10/10/2023-638325472570787508-78.jpg",
                          width: double.infinity,
                          widthPlaceHolder: double.infinity,
                        ),
                      ),
                      Positioned(
                        right: 35.w,
                        top: 20.h,
                        child: Chip(
                          side: BorderSide.none,
                          label: CustomText(
                            text: 'عاجل',
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          backgroundColor: Colors.red,
                        ),
                      ),
                      Positioned(
                        top: 70.h,
                        right: 15.w,
                        child: SizedBox(
                          width: 380.w,
                          child: CustomText(
                            fontSize: 18.sp,
                            text:
                                "حرب غزة الخامسة وحدود \"طوفان الأقصى\": ما الذى يحدث ؟",
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25.h),
                  Padding(
                    padding: EdgeInsets.only(right: 8.w, bottom: 5.h),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: CustomText(
                        text: "أخر الاخبار",
                        color: Colors.black,
                        fontSize: 25.sp,
                      ),
                    ),
                  ),
                  const LastNews(),
                  Padding(
                    padding: EdgeInsets.only(right: 8.w, bottom: 5.h),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: CustomText(
                        text: "معالم فلسطين",
                        color: Colors.black,
                        fontSize: 25.sp,
                      ),
                    ),
                  ),
                  const Landmarks(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      toolbarHeight: 80.h,
      title: Padding(
        padding: EdgeInsets.only(top: 5.h),
        child: Image.asset(
          'assets/images/logo.png',
          height: 180.h,
        ),
      ),
      centerTitle: true,
      leading: Card(
        elevation: 5,
        margin: EdgeInsets.only(bottom: 25.h, top: 5.h, left: 8.w),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            'assets/svg/menu.svg',
          ),
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 8.h),
          alignment: Alignment.center,
          child: const CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage('assets/images/profile400x400.jpg'),
          ),
        ),
      ],
    );
  }
}

class LastNews extends StatelessWidget {
  const LastNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              const CustomImage(
                  url: "https://pbs.twimg.com/media/EzGW87kXAAQyqhE.jpg"),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SizedBox(
                  width: 170.w,
                  child: const CustomText(
                    text:
                        "الفدس العربيه الخالدة حره دائما وأبدا وأيضا هناك اخبار عن",
                    color: Colors.grey,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              const CustomImage(
                url:
                    "https://i.pinimg.com/564x/0a/43/5d/0a435d788ebd00f8d4f440b6b8e49d07.jpg",
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.h),
                child: SizedBox(
                  width: 160.w,
                  child: const CustomText(
                    text: "علم فلسطين يرتفع في كل اماكن وهناك اخبار عن",
                    textDirection: TextDirection.rtl,
                    color: Colors.grey,
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Landmarks extends StatelessWidget {
  const Landmarks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 215.h,
      child: Scrollbar(
        thickness: 0,
        child: ListView.builder(
          reverse: true,
          cacheExtent: 10000,
          scrollDirection: Axis.horizontal,
          itemCount: LandmarkOfPalesting.landmarkOfPalestingItems.length,
          itemBuilder: (context, index) {
            var data = LandmarkOfPalesting.landmarkOfPalestingItems[index];
            return GestureDetector(
              onTap: () async {
                if (!await launchUrl(Uri.parse(data.gotoUrl))) {
                  throw Exception('Could not launch ${data.gotoUrl}');
                }
              },
              child: Column(
                children: [
                  CustomImage(
                    url: data.photo,
                    margin: EdgeInsets.only(left: 8.w, right: 8.w, top: 8),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12.h, bottom: 0.h),
                    child: CustomText(
                      text: data.name,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
