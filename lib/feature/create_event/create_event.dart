import 'package:event_app/core/resources/assets_manager.dart';
import 'package:event_app/core/resources/colors_manager.dart';
import 'package:event_app/core/widgets/custom_elevated_button.dart';
import 'package:event_app/core/widgets/custom_tab_bar.dart';
import 'package:event_app/core/widgets/custom_text_button.dart';
import 'package:event_app/core/widgets/custom_text_form_field.dart';
import 'package:event_app/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../l10n/app_localizations.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  CategoryModel selectedCategory = CategoryModel.categories[0];
  @override
  Widget build(BuildContext context) {
    late AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
         title: Text(appLocalizations.create_event) ,
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
              Text(appLocalizations.title, style: Theme.of(context).textTheme.titleMedium,),
              SizedBox(height: 8.h,),
              CustomTextFormField(hintText: "Event Title",prefixIcon: Icon(Icons.edit_calendar_outlined), keyboardType: TextInputType.text),
              SizedBox(height: 16.h,),
              Text(appLocalizations.description, style: Theme.of(context).textTheme.titleMedium,),
              SizedBox(height: 8.h,),
              CustomTextFormField(
                  hintText: appLocalizations.event_description,
                  keyboardType: TextInputType.text,
                maxLines: 4,
              ),
              SizedBox(height: 16.h,),
              Row(
                children: [
                  Icon(Icons.date_range_outlined, ),
                  SizedBox(width: 4.w,),
                  Text(appLocalizations.event_date, style: Theme.of(context).textTheme.titleMedium,),
                  Spacer(),
                  CustomTextButton(
                      text: appLocalizations.choose_date,
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
                  Icon(Icons.access_time_outlined, ),
                  SizedBox(width: 4.w,),
                  Text(appLocalizations.event_time, style: Theme.of(context).textTheme.titleMedium,),
                  Spacer(),
                  CustomTextButton(text: appLocalizations.choose_time, onTap: (){
                    showTimePicker(context: context, initialTime: TimeOfDay.now());
                  }),
          
                ],
              ),
              SizedBox(height: 24.h,),
              CustomElevatedButton(text: appLocalizations.create_event, onPress: (){}),
          
          
          
            ],
          ),
        ),
      ),
    );
  }
}
