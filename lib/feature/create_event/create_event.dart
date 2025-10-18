import 'package:event_app/core/resources/assets_manager.dart';
import 'package:event_app/core/resources/colors_manager.dart';
import 'package:event_app/core/widgets/custom_elevated_button.dart';
import 'package:event_app/core/widgets/custom_tab_bar.dart';
import 'package:event_app/core/widgets/custom_text_button.dart';
import 'package:event_app/core/widgets/custom_text_form_field.dart';
import 'package:event_app/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  CategoryModel selectedCategory = CategoryModel.categories[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text("Create Event") ,
      ),
      body: Padding(
        padding:  REdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.asset(selectedCategory.imagePath),
              ),
              SizedBox(height: 16.h,),
              CustomTabBar(
                onCategoryItemClicked: (category){
                  setState(() {
                    selectedCategory = category;
                  });
                },
                  categories: CategoryModel.categories,
                  selectedBgColor: ColorsManager.blue,
                  unSelectedBgColor: Colors.transparent,
                  selectedFgColor: ColorsManager.whiteBlue,
                  unSelectedFgColor: ColorsManager.blue
              ),
              SizedBox(height: 16.h,),
              Text("Title", style: Theme.of(context).textTheme.titleMedium,),
              SizedBox(height: 8.h,),
              CustomTextFormField(hintText: "Event Title",prefixIcon: Icon(Icons.edit_calendar_outlined), keyboardType: TextInputType.text),
              SizedBox(height: 16.h,),
              Text("Description", style: Theme.of(context).textTheme.titleMedium,),
              SizedBox(height: 8.h,),
              CustomTextFormField(
                  hintText: "Event Description",
                  keyboardType: TextInputType.text,
                maxLines: 4,
              ),
              SizedBox(height: 16.h,),
              Row(
                children: [
                  Icon(Icons.date_range_outlined, color: ColorsManager.black1C,),
                  SizedBox(width: 4.w,),
                  Text("Event Date", style: Theme.of(context).textTheme.titleMedium,),
                  Spacer(),
                  CustomTextButton(
                      text: "Choose Date",
                      onTap: (){
                        showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime.now().add(Duration(days: 365))
                        );
                      }
                  ),
          
                ],
              ),
              SizedBox(height: 16.h,),
              Row(
                children: [
                  Icon(Icons.access_time_outlined, color: ColorsManager.black1C,),
                  SizedBox(width: 4.w,),
                  Text("Event Time", style: Theme.of(context).textTheme.titleMedium,),
                  Spacer(),
                  CustomTextButton(text: "Choose Time", onTap: (){
                    showTimePicker(context: context, initialTime: TimeOfDay.now());
                  }),
          
                ],
              ),
              SizedBox(height: 24.h,),
              CustomElevatedButton(text: "Create Event", onPress: (){}),
          
          
          
            ],
          ),
        ),
      ),
    );
  }
}
