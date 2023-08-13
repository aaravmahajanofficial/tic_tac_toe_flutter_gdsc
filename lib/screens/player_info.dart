import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe_flutter_gdsc/components/colors.dart';
import 'package:tic_tac_toe_flutter_gdsc/components/text.dart';
import 'package:tic_tac_toe_flutter_gdsc/components/backend.dart';

class Userinfo extends StatefulWidget {
  const Userinfo({super.key});

  @override
  State<Userinfo> createState() => _UserinfoState();
}

class _UserinfoState extends State<Userinfo> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _friendname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                  text: 'Enter the details',
                  color: kGreycolor,
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: TextField(
                  controller: _username,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.person_rounded,
                      color: Colors.lightGreen,
                    ),
                    hintText: 'What do people call you?',
                    hintStyle: TextStyle(color: Colors.grey.shade500),
                    labelText: 'Username',
                    labelStyle: const TextStyle(
                      color: Colors.lightGreen,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.lightGreen),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.lightGreen),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: TextField(
                  controller: _friendname,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.person_rounded,
                      color: Colors.orangeAccent,
                    ),
                    hintText: 'What do people call them?',
                    hintStyle: TextStyle(color: Colors.grey.shade500),
                    labelText: 'Friend\'s name',
                    labelStyle: const TextStyle(
                      color: Colors.orangeAccent,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.orangeAccent),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.orangeAccent),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 80.0,
              ),
              _buildButton(context),
            ]),
      ),
    );
  }

  ElevatedButton _buildButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Backend userModel = Provider.of<Backend>(context, listen: false);
        if (_username.text.isEmpty || _friendname.text.isEmpty) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('ERROR'),
                content: const Text('Please enter both the names'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OK'),
                  )
                ],
              );
            },
          );
        } else {
          userModel.updateUsername(_username.text, _friendname.text);
          userModel.updateScores(0, 0);
          Navigator.pushNamed(context, '/pick_symbol');
        }
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: kBluecolor,
          minimumSize: const Size(200, 60),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(80))),
      child: const CustomText(
          text: 'Continue',
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500),
    );
  }
}
