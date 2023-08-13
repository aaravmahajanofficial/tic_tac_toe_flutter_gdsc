// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_flutter_gdsc/components/colors.dart';
import 'package:tic_tac_toe_flutter_gdsc/components/text.dart';

class ResultsPage extends StatelessWidget {
  final String playerName;
  final int playerScore;
  const ResultsPage(
      {super.key, required this.playerName, required this.playerScore});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(height: 30),
            Image.asset(
              'assets/images/won.png',
              width: 200,
            ),
            const SizedBox(height: 20),
            CustomText(
                text: 'Game Over!',
                color: kGreycolor,
                fontSize: 32,
                fontWeight: FontWeight.w600),
            CustomText(
                text: '$playerName Won',
                color: kGreycolor,
                fontSize: 32,
                fontWeight: FontWeight.w600),
            const SizedBox(height: 50),
            CustomText(
                text: '$playerName\'s score',
                color: Colors.orange,
                fontSize: 24,
                fontWeight: FontWeight.w500),
            const SizedBox(height: 10),
            CustomText(
                text: '$playerScore',
                color: kRedcolor,
                fontSize: 24,
                fontWeight: FontWeight.w500),
            const SizedBox(
              height: 50,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton(
                      color: kBluecolor,
                      text: 'Home',
                      icon: Icons.home,
                      path: '/home',
                    ),
                    _buildButton(
                      color: kRedcolor,
                      text: 'Replay',
                      icon: Icons.replay_rounded,
                      path: '/play_screen',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton(
                      color: kPinkColor,
                      text: 'Star',
                      icon: Icons.star_outline_rounded,
                      path: '',
                    ),
                    _buildButton(
                      color: kPurpleColor,
                      text: 'Share',
                      icon: Icons.share_rounded,
                      path: '',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            )
          ]),
        ),
      ),
    ));
  }
}

class _buildButton extends StatelessWidget {
  final Color color;
  final String text;
  final IconData icon;
  final String path;

  const _buildButton({
    required this.color,
    required this.text,
    required this.icon,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, path);
      },
      child: Container(
          alignment: Alignment.center,
          width: 150,
          height: 100,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(5)),
          child: Column(
            children: [
              const Spacer(),
              Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
              CustomText(
                text: text,
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              const Spacer(),
            ],
          )),
    );
  }
}
