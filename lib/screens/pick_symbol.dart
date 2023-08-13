// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe_flutter_gdsc/components/text.dart';
import '../components/colors.dart';
import '../components/backend.dart';

class PickSymbol extends StatefulWidget {
  const PickSymbol({
    super.key,
  });

  @override
  State<PickSymbol> createState() => _PickSymbolState();
}

class _PickSymbolState extends State<PickSymbol> {
  //bool logic for radio buttons
  bool isXSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(
                flex: 2,
              ),
              const CustomText(
                  text: 'Pick your side',
                  color: Color.fromARGB(255, 104, 115, 119),
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //want a radio button here
                  Column(
                    children: [
                      CustomText(
                          text: 'X',
                          color: isXSelected
                              ? const Color(0xfff3ca8df)
                              : const Color.fromARGB(255, 160, 189, 203),
                          fontSize: 120,
                          fontWeight: FontWeight.w800),
                      Transform.scale(
                        scale: 1.5,
                        child: Radio(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            fillColor: MaterialStateColor.resolveWith(
                              (states) => isXSelected
                                  ? const Color(0xfff3ca8df)
                                  : const Color.fromARGB(255, 160, 189, 203),
                            ),
                            value: true,
                            groupValue: isXSelected,
                            onChanged: (value) {
                              setState(() {
                                isXSelected = value as bool;
                              });
                            }),
                      ),
                    ],
                  ),
                  const SizedBox(width: 80),
                  Column(
                    children: [
                      CustomText(
                          text: 'O',
                          color: isXSelected
                              ? const Color(0xfffefc9b5)
                              : const Color(0xfffe74116),
                          fontSize: 120,
                          fontWeight: FontWeight.w800),
                      Transform.scale(
                        scale: 1.5,
                        child: Radio(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => isXSelected
                                    ? const Color(0xfffefc9b5)
                                    : const Color(0xfffe74116)),
                            value: false,
                            groupValue: isXSelected,
                            onChanged: (value) {
                              setState(() {
                                isXSelected = value as bool;
                              });
                            }),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(
                flex: 1,
              ),
              ElevatedButton(
                onPressed: () {
                  Backend userModel =
                      Provider.of<Backend>(context, listen: false);
                  String userChoice = isXSelected ? 'X' : 'O';
                  String friendChoice = isXSelected ? 'O' : 'X';
                  userModel.updateChoices(userChoice, friendChoice);
                  Navigator.pushNamed(context, '/play_screen');
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: kBluecolor,
                    minimumSize: const Size(200, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80))),
                child: const CustomText(
                    text: 'Continue',
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              const Spacer(
                flex: 2,
              ),
            ]),
      ),
    );
  }
}
