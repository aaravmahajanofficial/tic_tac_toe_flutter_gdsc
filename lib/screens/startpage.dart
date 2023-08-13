// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe_flutter_gdsc/components/button.dart';
import 'package:tic_tac_toe_flutter_gdsc/components/colors.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
                text: TextSpan(
              children: [
                TextSpan(
                    text: ' T I C\n',
                    style: GoogleFonts.nunito(
                      fontSize: 72,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xfff3ca8df),
                    )),
                TextSpan(
                    text: 'T A C\n',
                    style: GoogleFonts.nunito(
                      fontSize: 76,
                      height: 1.5,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xfffe74116),
                    )),
                TextSpan(
                    text: 'T O E',
                    style: GoogleFonts.nunito(
                      fontSize: 78,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xfff3ca8df),
                    ))
              ],
            )),
            const SizedBox(height: 80),
            Button(
                color: kBluecolor,
                text: 'New Game ->',
                textColor: Colors.white,
                path: '/pick_mode',
                borderColor: Colors.transparent,
                width: 200,
                height: 60)
          ],
        ),
      ),
    );
  }
}
