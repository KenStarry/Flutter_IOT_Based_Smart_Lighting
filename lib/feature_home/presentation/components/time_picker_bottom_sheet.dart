import 'package:flutter/material.dart';

class TimePickerBottomSheet extends StatefulWidget {
  const TimePickerBottomSheet({super.key});

  @override
  State<TimePickerBottomSheet> createState() => _TimePickerBottomSheetState();
}

class _TimePickerBottomSheetState extends State<TimePickerBottomSheet> {
  TimeOfDay? time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.5,
        padding: const EdgeInsets.all(16),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Pick Time :",
                        style: Theme.of(context).textTheme.titleMedium),
                    FilledButton(
                        onPressed: () async {
                          final TimeOfDay? pickedTime = await showTimePicker(
                              context: context, initialTime: TimeOfDay.now());

                          setState(() {
                            time = pickedTime;
                          });
                        },
                        child: Row(
                          children: [
                            Icon(Icons.timer_rounded, color: Colors.black),
                            const SizedBox(width: 8),
                            Text(
                              'Time Picker',
                              style: TextStyle(
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .fontSize,
                                  fontWeight: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .fontWeight,
                                  color: Colors.black),
                            ),
                          ],
                        ))
                  ],
                ),
                const SizedBox(height: 24),
                time != null
                    ? Text(
                    "Manipulate Leds at ${time!.hourOfPeriod} : ${time!.minute < 10 ? "0${time!.minute}" : time!.minute} ${time!.period.name}",
                    style: Theme.of(context).textTheme.bodyMedium)
                    : SizedBox.shrink(),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Led Values', style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('Led 1',
                            style: Theme.of(context).textTheme.bodyLarge),
                        const SizedBox(height: 8),
                        Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Theme.of(context).primaryColorDark,
                            ),
                            child: SizedBox(
                              height: double.infinity,
                              width: double.infinity,
                              child: TextField(
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.titleSmall,
                                decoration: InputDecoration(
                                    hintText: '0.0',
                                    hintStyle: TextStyle(
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .fontSize,
                                        fontWeight: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .fontWeight,
                                        color: Colors.white.withOpacity(0.6)),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none),
                              ),
                            )),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Led 2',
                            style: Theme.of(context).textTheme.bodyLarge),
                        const SizedBox(height: 8),
                        Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Theme.of(context).primaryColorDark,
                            ),
                            child: SizedBox(
                              height: double.infinity,
                              width: double.infinity,
                              child: TextField(
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.titleSmall,
                                decoration: InputDecoration(
                                    hintText: '0.0',
                                    hintStyle: TextStyle(
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .fontSize,
                                        fontWeight: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .fontWeight,
                                        color: Colors.white.withOpacity(0.6)),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none),
                              ),
                            )),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Led 3',
                            style: Theme.of(context).textTheme.bodyLarge),
                        const SizedBox(height: 8),
                        Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Theme.of(context).primaryColorDark,
                            ),
                            child: SizedBox(
                              height: double.infinity,
                              width: double.infinity,
                              child: TextField(
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.titleSmall,
                                decoration: InputDecoration(
                                    hintText: '0.0',
                                    hintStyle: TextStyle(
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .fontSize,
                                        fontWeight: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .fontWeight,
                                        color: Colors.white.withOpacity(0.6)),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none),
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FilledButton(
                  onPressed: () {
                    //  save these values to be used later
                  },
                  child: Text('Finish',
                      style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.bodyMedium!.fontSize,
                          fontWeight: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .fontWeight,
                          color: Colors.black))),
            )
          ],
        ),
      ),
    );
  }
}
