import 'package:evently/ultiless/AppColors.dart';
import 'package:evently/ultiless/AppStyles.dart';
import 'package:evently/ultiless/appassets.dart';
import 'package:flutter/material.dart';

class LoveTap extends StatelessWidget {
  const LoveTap({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return  SafeArea(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*0.03,vertical: height*0.01),
        child: Column(

          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search,color: AppColors.primarycolor,size: 30,),
                hintText: 'Search for Event',
                hintStyle: AppStyles.bold14blue,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primarycolor),
                  borderRadius: BorderRadius.circular(16)
                ),
               focusedBorder: OutlineInputBorder(
                   borderSide: BorderSide(color: AppColors.primarycolor),
                   borderRadius: BorderRadius.circular(16)


               ) ,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primarycolor),
                    borderRadius: BorderRadius.circular(16)


                ) ,
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primarycolor),
                    borderRadius: BorderRadius.circular(16)


                ) ,
              ),


            ),
            SizedBox(height: height*0.01,),
            Expanded(
              child: ListView.separated(padding: EdgeInsets.symmetric(vertical: height*0.01),separatorBuilder: (context, index) => SizedBox(height: height*0.01,),itemBuilder: (context, index) =>Container(
                width: double.infinity,
                height: height*0.26,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(AppAssets.Frame19),fit: BoxFit.fill),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: width*0.02,
                          vertical: height*0.013
                      ),

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Theme.of(context).canvasColor
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width*0.02,
                            vertical: height*0.003
                        ),
                        child: Column(
                            children: [
                              Text('21',style: AppStyles.bold20blue,),
                              Text('Nov',style: AppStyles.bold14blue,),
                            ]
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            vertical: height*0.007
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).colorScheme.onSecondary
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(
                              horizontal: width*0.02,
                              vertical: height*0.01
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('This is a Birthday Party ',style: Theme.of(context).brightness == Brightness.dark?AppStyles.bold14offwhite:AppStyles.bold14black,),
                                Image.asset(AppAssets.favFill,color: AppColors.primarycolor,)
                              ]
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ) ,itemCount: 10,),
            )
          ],
        ),
      ),
    );
  }
}
