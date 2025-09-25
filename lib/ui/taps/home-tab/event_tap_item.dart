import 'package:flutter/material.dart';

class EventTapItem extends StatelessWidget {
  final bool isSelected;
   IconData icon;
  String eventName;
   EventTapItem({super.key, required this.isSelected,required this.eventName,required this.icon });

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
        color: isSelected? Theme.of(context).dividerColor:Colors.transparent,
          border: isSelected ?Border.all(color: Colors.transparent):Border.all(
            color:  Theme.of(context).dividerColor,width: 2
          )
      ),
      child: Row(
        children: [
          Icon(icon,color: isSelected? Theme.of(context).colorScheme.secondary:Theme.of(context).focusColor,),
          SizedBox(width: width*0.02,),
          Text(eventName,style:
              isSelected? Theme.of(context).textTheme.labelLarge:Theme.of(context).textTheme.labelMedium,),
        ],
      ),
    );
  }
}
