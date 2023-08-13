// ignore_for_file: camel_case_types
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe_flutter_gdsc/components/button.dart';
import 'package:tic_tac_toe_flutter_gdsc/components/colors.dart';
import 'package:tic_tac_toe_flutter_gdsc/components/text.dart';
import 'package:tic_tac_toe_flutter_gdsc/components/backend.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

bool soundOn = true;

class _PlayScreenState extends State<PlayScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Backend>(
        builder: (context, value, child) => Scaffold(
                body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const _buildSpeakerButton(),
                    const SizedBox(height: 30),
                    _buildScorePill(value),
                    const SizedBox(height: 50),
                    _buildMessage(value),
                    const SizedBox(height: 50),
                    _buildGameBoard(value),
                    const SizedBox(height: 80),
                    const _buildQuitButton(),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            )));
  }

//Turn Indicator Message
  CustomText _buildMessage(Backend value) {
    return CustomText(
        text: value.currentPlayer == value.userchoice
            ? '${value.username}\'s turn'
            : '${value.friendname}\'s turn',
        color: kGreycolor,
        fontSize: 20,
        fontWeight: FontWeight.w500);
  }

//Game Board
  SizedBox _buildGameBoard(Backend value) {
    return SizedBox(
      width: 380,
      height: 380,
      child: GridView.builder(
        itemCount: 9,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                value.updateBoard(index);
                final player = AudioPlayer();
                if (soundOn) {
                  player.play(UrlSource('assets/sounds/click.wav'));
                }
              },
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[100]!, width: 2)),
                  child: Center(
                      child: CustomText(
                          text: value.board[(index / 3).floor()][(index % 3)],
                          color: value.board[(index / 3).floor()]
                                      [(index % 3)] ==
                                  'X'
                              ? kBluecolor
                              : kRedcolor,
                          fontSize: 80,
                          fontWeight: FontWeight.w800))));
        },
      ),
    );
  }

//Score Board
  Row _buildScorePill(Backend value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(
          width: 10,
        ),
        CustomText(
            text: value.username,
            color: kGreycolor,
            fontSize: 18,
            fontWeight: FontWeight.w500),
        Button(
            width: 150,
            height: 50,
            borderColor: Colors.transparent,
            color: value.currentPlayer == 'X' ? kBluecolor : kRedcolor,
            text: "${value.userScore}    |    ${value.friendScore}",
            textColor: Colors.white,
            path: ''),
        CustomText(
            text: value.friendname,
            color: kGreycolor,
            fontSize: 18,
            fontWeight: FontWeight.w500),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}

//Reset Button
class _buildQuitButton extends StatelessWidget {
  const _buildQuitButton();

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<Backend>(context);

    return ElevatedButton(
      onPressed: () {
        value.clearBoard();
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: kRedcolor,
          minimumSize: const Size(200, 60),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(80))),
      child: const CustomText(
          text: 'Reset',
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500),
    );
  }
}

//Speaker Button
class _buildSpeakerButton extends StatefulWidget {
  const _buildSpeakerButton();

  @override
  State<_buildSpeakerButton> createState() => _buildSpeakerButtonState();
}

class _buildSpeakerButtonState extends State<_buildSpeakerButton> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        icon: soundOn
            ? Icon(
                Icons.volume_up_rounded,
                size: 28,
                color: kRedcolor,
              )
            : Icon(
                Icons.volume_off_rounded,
                size: 28,
                color: kRedcolor,
              ),
        onPressed: () {
          setState(() {
            soundOn = !soundOn;
          });
        },
      ),
    );
  }
}
