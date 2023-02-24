import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/values/app_assets.dart';
import 'package:flutter_application_1/values/app_colors.dart';
import 'package:flutter_application_1/values/share_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../values/app_styles.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({super.key});

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  double sliderValue = 5;
  late SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDefaultValue();
  }

  initDefaultValue() async {
    prefs = await SharedPreferences.getInstance();
    int value = prefs.getInt(ShareKeys.counter) ?? 5;
    setState(() {
      sliderValue = value.toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondColor,
        elevation: 0,
        title: Text(
          'Your control',
          style:
              AppStyles.h3.copyWith(color: AppColors.textColor, fontSize: 36),
        ),
        leading: InkWell(
          onTap: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setInt(ShareKeys.counter, sliderValue.toInt());
            Navigator.pop(context);
          },
          child: Image.asset(AppAssets.leftArrow),
        ),
      ),
      body: Container(
          width: double.infinity,
          child: Column(
            children: [
              Spacer(),
              Text(
                'How much a number word at one',
                style: AppStyles.h4
                    .copyWith(color: AppColors.lightGrey, fontSize: 18),
              ),
              Spacer(),
              Text(
                '${sliderValue.toInt()}',
                style: AppStyles.h1.copyWith(
                    color: AppColors.primaryColor,
                    fontSize: 150,
                    fontWeight: FontWeight.bold),
              ),
              Slider(
                  value: sliderValue,
                  min: 5,
                  max: 100,
                  divisions: 95,
                  activeColor: AppColors.primaryColor,
                  inactiveColor: AppColors.primaryColor,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      sliderValue = value;
                    });
                  }),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  'slide to set',
                  style: AppStyles.h5.copyWith(color: AppColors.textColor),
                ),
              ),
              Spacer(),
              Spacer(),
              Spacer(),
            ],
          )),
    );
  }
}
