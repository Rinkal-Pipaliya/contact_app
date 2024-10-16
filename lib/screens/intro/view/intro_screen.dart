import 'package:contact_app/routes/routes.dart';
import 'package:contact_app/utils/share_helper.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Welcome",
            body: "go to next page",
            image: Image.network(
                "https://i.pinimg.com/736x/38/a8/81/38a8817431169a2533b64221c6b8c4c5.jpg"),
          ),
          PageViewModel(
            title: "Welcome",
            body: "go to next page",
            image: Image.network(
                "https://i.pinimg.com/736x/38/a8/81/38a8817431169a2533b64221c6b8c4c5.jpg"),
          ),
          PageViewModel(
            title: "Welcome",
            body: "go to next page",
            image: Image.network(
                "https://i.pinimg.com/736x/38/a8/81/38a8817431169a2533b64221c6b8c4c5.jpg"),
          ),
          PageViewModel(
            title: "Welcome",
            body: "done",
            image: Image.network(
                "https://i.pinimg.com/736x/38/a8/81/38a8817431169a2533b64221c6b8c4c5.jpg"),
          ),
        ],
        done: const Text('Done'),
        next: const Text('Next'),
        skip: const Text('Skip'),
        onDone: () {
          ShareHelper shr = ShareHelper();
          shr.saveIntrostatus();
          Navigator.pushReplacementNamed(context, AppRoutes.homePage);
        },
        showSkipButton: true,
      ),
    );
  }
}
