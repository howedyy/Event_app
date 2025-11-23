import 'package:event_app/core/UI_Utils.dart';
import 'package:event_app/core/resources/assets_manager.dart';
import 'package:event_app/core/resources/colors_manager.dart';
import 'package:event_app/core/resources/validators.dart';
import 'package:event_app/core/widgets/custom_elevated_button.dart';
import 'package:event_app/core/widgets/custom_tab_bar.dart';
import 'package:event_app/core/widgets/custom_text_button.dart';
import 'package:event_app/core/widgets/custom_text_form_field.dart';
import 'package:event_app/models/category_model.dart';
import 'package:event_app/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../firebase/firebase_service.dart';
import '../../l10n/app_localizations.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  late CategoryModel selectedCategory = CategoryModel.getCategories(context)[0];
  DateTime selectedDateTime = DateTime.now();
  TimeOfDay pickedTimeTemp = TimeOfDay.now();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }


  @override
  void dispose() {
      _titleController.dispose();
      _descriptionController.dispose();
    super.dispose();

  }
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
          child: Form(
            key: _formKey,
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
                    categories: CategoryModel.getCategories(context),
                    selectedBgColor: ColorsManager.blue,
                    unSelectedBgColor: Colors.transparent,
                    selectedFgColor: ColorsManager.whiteBlue,
                    unSelectedFgColor: ColorsManager.blue
                ),
                SizedBox(height: 16.h,),
                Text(
                  appLocalizations.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 8.h,),
                CustomTextFormField(
                  controller: _titleController,
                  validator: Validator.validateEventTitle,
                    hintText: appLocalizations.event_title,
                    prefixIcon: Icon(Icons.edit_calendar_outlined),
                    keyboardType: TextInputType.text
                ),
                SizedBox(height: 16.h,),
                Text(appLocalizations.description, style: Theme.of(context).textTheme.titleMedium,),
                SizedBox(height: 8.h,),
                CustomTextFormField(
                  controller: _descriptionController,
                  validator: Validator.validateEventDescription,
                    hintText: appLocalizations.event_description,
                    keyboardType: TextInputType.text,
                  maxLines: 4,
                ),
                SizedBox(height: 16.h,),
                Row(
                  children: [
                    Icon(Icons.date_range_outlined, ),
                    SizedBox(width: 4.w,),
                    Text(
                      appLocalizations.event_date,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Spacer(),
                    CustomTextButton(
                        text: appLocalizations.choose_date,
                        onTap:_selectEventDate
                    ),

                  ],
                ),
                SizedBox(height: 16.h,),
                Row(
                  children: [
                    Icon(Icons.access_time, ),
                    SizedBox(width: 4.w,),
                    Text(
                      appLocalizations.event_time,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Spacer(),
                    CustomTextButton(
                      text: appLocalizations.choose_time,
                      onTap: _selectEventTime,
                    ),
                ],
                ),

                SizedBox(height: 24.h,),
                CustomElevatedButton(text: appLocalizations.create_event, onPress: _createEvent),



              ],
            ),


          ),
        ),
      ),
      );


  }


  void _selectEventDate() async {
    selectedDateTime =
        await showDatePicker(
          context: context,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(Duration(days: 365)),
        ) ??
            selectedDateTime;
    selectedDateTime = selectedDateTime.copyWith(hour: pickedTimeTemp.hour, minute: pickedTimeTemp.minute);

    setState(() {});
  }

  void _selectEventTime() async {
    pickedTimeTemp =
        await showTimePicker(context: context, initialTime: TimeOfDay.now()) ??
            pickedTimeTemp;

    selectedDateTime = selectedDateTime.copyWith(
      hour: pickedTimeTemp.hour,
      minute: pickedTimeTemp.minute,
    );
    setState(() {});
  }

  void _createEvent()async{
    if(_formKey.currentState?.validate() == false) return;
    selectedCategory;
    _titleController.text;
    _descriptionController.text;
    selectedDateTime;
    EventModel event = EventModel(
        id: "",
        title: _titleController.text,
        category: selectedCategory,
        description: _descriptionController.text,
        dateTime: selectedDateTime,
    );
    UIUtils.showLoading(context, isDismissible: false);
    await FirebaseService.addEventToFireStore(event, context);
    UIUtils.hideDialog(context);
    UIUtils.showToastMessage("Event created success", Colors.green);
    Navigator.pop(context);
  }

}
