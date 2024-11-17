import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/feature/home/page/home_view.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var noteController = TextEditingController();
  var dateController = TextEditingController(
      text: DateFormat('dd/mm/yyyy').format(DateTime.now()));
  var starttimeController =
      TextEditingController(text: DateFormat('hh:mm a').format(DateTime.now()));
  String endTime = DateFormat('hh:mm a').format(DateTime.now());
  int selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('add task'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Title', style: GetbodyTextStyles()),
              const Gap(5),
              TextFormField(
                controller: titleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter some text';
                  }
                  return null;
                },
              ),
              const Gap(10),
              Text(
                'Note',
                style: GetbodyTextStyles(),
              ),
              const Gap(5),
              TextFormField(
                maxLines: 4,
                controller: noteController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter some text';
                  }
                },
              ),
              const Gap(10),
              Text(
                'Date',
                style: GetbodyTextStyles(),
              ),
              const Gap(5),
              TextFormField(
                readOnly: true,
                controller: dateController,
                onTap: () {
                  showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          initialDate: DateTime.now(),
                          lastDate: DateTime(2050))
                      .then((Value) {
                    if (Value != null) {
                      dateController.text =
                          DateFormat('dd/mm/yyyy').format(Value);
                    }
                  });
                },
                decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.calendar_month,
                        color: AppColors.primaryColor)),
              ),
              const Gap(10),
              Row(children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Start time',
                      style: GetbodyTextStyles(),
                    ),
                    const Gap(5),
                    TextFormField(
                      readOnly: true,
                      controller: starttimeController,
                      onTap: () {
                        showTimePicker(
                                context: context, initialTime: TimeOfDay.now())
                            .then((Value) {
                          if (Value != null) {
                            // ignore: use_build_context_synchronously
                            starttimeController.text = Value.format(context);
                          }
                        });
                      },
                      decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.access_time,
                              color: AppColors.primaryColor)),
                    ),
                  ],
                )),
                const Gap(10),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'end time',
                          style: GetbodyTextStyles(),
                        ),
                        const Gap(5),
                        TextFormField(
                          readOnly: true,
                          onTap: () {
                            showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now())
                                // ignore: non_constant_identifier_names
                                .then((Value) {
                              if (Value != null) {
                                setState(() {
                                  endTime = Value.format(context);
                                });
                              }
                            });
                          },
                          decoration: InputDecoration(
                              hintText: endTime,
                              hintStyle: GetbodyTextStyles(),
                              suffixIcon: const Icon(Icons.access_time,
                                  color: AppColors.primaryColor)),
                        ),
                      ]),
                ),
              ]),
              const Gap(30),
              Row(children: [
                Row(
                  children: List.generate(3, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(3),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedColor = index;
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: index == 0
                              ? AppColors.primaryColor
                              : index == 1
                                  ? AppColors.orangeColor
                                  : AppColors.redColor,
                          child: (selectedColor == index)
                              ? const Icon(Icons.check, color: Colors.white)
                              : const SizedBox(),
                        ),
                      ),
                    );
                  }),
                ),
                const Spacer(),
                customButton(
                    width: 145,
                    text: 'create task',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {}
                    })
              ]),
            ]),
          ),
        ));
  }
}



