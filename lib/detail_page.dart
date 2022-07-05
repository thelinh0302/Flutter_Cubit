import 'package:first_app/cubit/app_cubit.dart';
import 'package:first_app/misc/colors.dart';
import 'package:first_app/widgets/app_large_text.dart';
import 'package:first_app/widgets/app_text.dart';
import 'package:first_app/widgets/responsive_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/app_buttons.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStar = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/mountain.jpeg"),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 70,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<AppCubits>(context)
                          .goHome();
                    },
                    icon: Icon(Icons.menu),
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Positioned(
              top: 320,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                            text: "Yosemite",
                            color: Colors.black54.withOpacity(0.8)),
                        AppLargeText(
                          text: "\$ 250",
                          color: AppColors.mainColor,
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: AppColors.mainColor),
                        SizedBox(height: 5),
                        AppText(
                            text: "USA, California",
                            color: AppColors.textColor1)
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color: index < gottenStar
                                  ? AppColors.starColor
                                  : AppColors.textColor2,
                            );
                          }),
                        ),
                        SizedBox(width: 10),
                        AppText(
                          text: "($gottenStar.0)",
                          color: AppColors.textColor2,
                        )
                      ],
                    ),
                    SizedBox(height: 25),
                    AppLargeText(
                      text: "People",
                      color: Colors.black.withOpacity(0.8),
                      size: 20,
                    ),
                    SizedBox(height: 5),
                    AppText(
                        text: "Number of people in your group",
                        color: AppColors.mainTextColor),
                    SizedBox(height: 15),
                    Wrap(
                      children: List.generate(5, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: AppButtons(
                              backgroundColor: selectedIndex == index
                                  ? Colors.black
                                  : AppColors.buttonBackground,
                              borderColor: AppColors.buttonBackground,
                              size: 50,
                              text: (index + 1).toString(),
                              color: selectedIndex == index ? Colors.white : Colors.black,
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 20),
                    AppLargeText(text: "Description",color: Colors.black.withOpacity(0.8),size: 20,),
                    SizedBox(height: 10,),
                    AppText(text: "Yosemite National Park is located  in central Sierra Nevada in the US state of California. It is located near the wild protected areas",
                      color: AppColors.mainTextColor,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child:
                Row(
                  children: [
                    AppButtons(
                      size: 60, 
                      color: AppColors.mainColor, 
                      backgroundColor: Colors.white, 
                      borderColor: AppColors.mainColor,
                      isIcon: true,
                      icon: Icons.favorite_border,
                      ),
                    SizedBox(width: 20,),
                    ResponsiveButton(
                      isResponsive: true,
                      text: "Book trip now",
                    )
                  ],
                )
              )
          ],
        ),
      ),
    );
  }
}
