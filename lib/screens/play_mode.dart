// ignore_for_file: use_full_hex_values_for_flutter_colors, camel_case_types

import 'package:flutter/material.dart';
import 'package:tic_tac_toe_flutter_gdsc/components/button.dart';
import 'package:tic_tac_toe_flutter_gdsc/components/colors.dart';
import '../components/text.dart';

class ChooseMode extends StatefulWidget {
  
  const ChooseMode({super.key});

  @override
  State<ChooseMode> createState() => _ChooseModeState();
}

class _ChooseModeState extends State<ChooseMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(
                flex: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomText(
                      text: 'X',
                      color: kBluecolor,
                      fontSize: 120,
                      fontWeight: FontWeight.w800),
                  CustomText(
                      text: 'O',
                      color: kRedcolor,
                      fontSize: 120,
                      fontWeight: FontWeight.w800),
                ],
              ),
              const SizedBox(height: 20),
              CustomText(
                  text: 'Choose your play mode',
                  color: kGreycolor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
              const SizedBox(height: 50),
              Button(
                width: 200,
                height: 60,
                borderColor: Colors.transparent,
                color: kBluecolor,
                text: 'With AI',
                textColor: Colors.white,
                path: '',
              ),
              const SizedBox(height: 20),
              Button(
                width: 200,
                height: 60,
                borderColor: kBluecolor,
                color: Colors.white,
                text: 'With a friend',
                textColor: kBluecolor,
                path: '/player_info',
              ),
              const SizedBox(
                height: 50,
              ),
              const _buildSettingsIcon(),
              const Spacer(
                flex: 1,
              ),
            ]),
      ),
    );
  }
}

class _buildSettingsIcon extends StatelessWidget {
  const _buildSettingsIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(80),
        color: kBluecolor,
      ),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.settings_outlined),
        iconSize: 36,
        color: Colors.white,
        padding: const EdgeInsets.all(8.0),
        tooltip: 'Settings',
      ),
    );
  }
}
