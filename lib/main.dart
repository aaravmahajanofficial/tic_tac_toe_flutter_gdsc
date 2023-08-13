import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe_flutter_gdsc/screens/play_screen.dart';
import 'package:tic_tac_toe_flutter_gdsc/screens/pick_symbol.dart';
import 'package:tic_tac_toe_flutter_gdsc/screens/play_mode.dart';
import 'package:tic_tac_toe_flutter_gdsc/screens/startpage.dart';
import 'package:tic_tac_toe_flutter_gdsc/screens/player_info.dart';
import 'components/backend.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => Backend()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Backend provider = Provider.of<Backend>(context);

    return MaterialApp(
      navigatorKey: provider.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'TIC TAC TOE',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const StartPage(),
      routes: {
        '/home': (context) => const StartPage(),
        '/pick_symbol': (context) => const PickSymbol(),
        '/pick_mode': (context) => const ChooseMode(),
        '/play_screen': (context) => const PlayScreen(),
        '/player_info': (context) => const Userinfo(),
      },
    );
  }
}
