import 'package:evently/ultiless/AppColors.dart';
import 'package:evently/ultiless/AppStyles.dart';
import 'package:flutter/material.dart';

class EventTapItem2 extends StatelessWidget {
  final bool isSelected;
  String eventName;
  IconData icon;

  EventTapItem2({super.key, required this.isSelected,required this.eventName ,required this.icon});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width*0.05,
        vertical: height*0.01
      ),
      margin:EdgeInsets.symmetric(
          horizontal: width*0.02,
          vertical: height*0.004
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(46),
        color: isSelected? AppColors.primarycolor:Colors.transparent,
          border: isSelected ?Border.all(color: Colors.transparent):Border.all(
            color:  AppColors.primarycolor,width: 2
          )
      ),
      child: Row(
        children: [
          Icon(icon,color: isSelected? Theme.of(context).colorScheme.onSecondary:AppColors.primarycolor,),
          SizedBox(width: width*0.02,),

          Text(eventName,style:
              isSelected? Theme.of(context).textTheme.titleLarge:Theme.of(context).textTheme.displaySmall,),
        ],
      ),
    );
  }
}
