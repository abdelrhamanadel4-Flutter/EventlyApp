import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ultiless/AppColors.dart';
import 'package:evently/ultiless/AppStyles.dart';
import 'package:evently/ultiless/appassets.dart';
import 'package:evently/ultiless/approutes.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnbBrading extends StatefulWidget {
   OnbBrading({super.key});

  @override
  State<OnbBrading> createState() => _OnbBradingState();
}

class _OnbBradingState extends State<OnbBrading> {
  int currentindex=0;
  final controller=LiquidController();
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(

          child: Column(
            children: [
              Image.asset(AppAssets.logo,height: height*0.2,width: double.infinity,),
              Expanded(
                child: LiquidSwipe(
                  onPageChangeCallback:onPageChangeCallback ,
                  liquidController: controller,
                    pages: [
                  Container(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.darkPurple// Dark blue for dark theme
                        : AppColors.lightBlue, // Light blue for light theme
                    width: double.infinity,
                    height: double.infinity,

                    child: Column(
                      children: [
                        Image.asset(AppAssets.onborading1),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: width*0.04),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: height*0.04,),
                              Text(AppLocalizations.of(context)!.findEventsThatInspireYou,style: AppStyles.bold20blue ,),
                              SizedBox(height: height*0.04,),
                              Text(AppLocalizations.of(context)!.diveIntoAWorldOfEvents,style: Theme.of(context).textTheme.headlineMedium,),
                            ],
                          ),
                        ),

                      ],
                    ),

                  ),
                  Container(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.darkPurple// Dark blue for dark theme
                        : AppColors.lightBlue, // Light blue for light theme

                    width: double.infinity,
                    height: double.infinity,

                    child: Column(

                      children: [
                        Image.asset(AppAssets.onborading2),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: width*0.04),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: height*0.04,),
                              Text(AppLocalizations.of(context)!.effortlessEventPlanning,style: AppStyles.bold20blue ,),
                              SizedBox(height: height*0.04,),
                              Text(AppLocalizations.of(context)!.takeTheHussleOutOfOrganizingEventsWithOurAllInOnePlanningTools,style: Theme.of(context).textTheme.headlineMedium,),
                            ],
                          ),
                        ),

                      ],
                    ),

                  )
                ,              Container(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppColors.darkPurple// Dark blue for dark theme
                            : AppColors.lightBlue, // Light blue for light theme
                        width: double.infinity,
                        height: double.infinity,

                        child: Column(
                      children: [
                        Image.asset(AppAssets.onborading1),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: width*0.04),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: height*0.04,),
                              Text(AppLocalizations.of(context)!.connectWithFriendsAndShareMoments,style: AppStyles.bold20blue ,),
                              SizedBox(height: height*0.04,),
                              Text(AppLocalizations.of(context)!.makeEveryEventMemorableBySharingTheExperienceWithOthers,style: Theme.of(context).textTheme.headlineMedium,),
                            ],
                          ),
                        ),

                      ],
                    ),

                  ),

                ]
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width*0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        final prevpage = controller.currentPage - 1;
                        if (prevpage >= 0) {
                          controller.animateToPage(page: prevpage,duration:600);
                        }
                      },
                      child: Visibility(
                       visible: currentindex>0,
                          child: Image.asset(AppAssets.buttomleft)),
                    ),

                    AnimatedSmoothIndicator(activeIndex: currentindex, count: 3,
                    effect: WormEffect(
                        spacing:  8.0,
                        dotWidth:  20.0,
                        dotHeight:  10.0,
                        dotColor:  AppColors.black,
                        activeDotColor:  AppColors.primarycolor
                    ),),

                    InkWell(
                      onTap: () {
                        final nextpage = controller.currentPage + 1;
                        if (nextpage < 3) {
                          controller.animateToPage(page: nextpage,duration:300 );
                        }
                        else{
                          Navigator.pushNamed(context, AppRoutes.SignIn);
                        }
                      },
                      child: Image.asset(AppAssets.buttomright),
                    ),
                  ],
                ),

              ),
              SizedBox(height: height*0.02,)
            ],
          ),
        ),
      );
  }

  void onPageChangeCallback(int activePageIndex) {
    setState(() {
      currentindex = activePageIndex;

    });
  }
}
