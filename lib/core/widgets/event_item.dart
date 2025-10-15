import 'package:event_app/core/resources/colors_manager.dart';
import 'package:event_app/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EventItem extends StatefulWidget {
  const EventItem({super.key, required  this.event});
final EventModel event;

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {

  bool favorite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(8),
      margin: REdgeInsets.symmetric(horizontal: 16,vertical: 8),
      width: double.infinity,
      height: 203.h,
      decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ColorsManager.blue, width: 1.w),
        image: DecorationImage(
            fit: BoxFit.fill,
            image:AssetImage(widget.event.category.imagePath)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("21",
                    style: GoogleFonts.inter(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorsManager.blue
                    ),
                  ),
                  Text("Nov",
                    style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorsManager.blue
                    ),
                  ),

                ],
              ),
            ),
          ),
          Spacer(),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(widget.event.title,
                      style: Theme.of(context).textTheme.titleSmall
                    ),
                  ),

                  IconButton(onPressed: (){
                    setState(() {
                      favorite= !favorite;
                    });
                  }, icon: Icon(favorite?Icons.favorite: Icons.favorite_border_outlined))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
