import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:menukunmae/screens/randomfood_screen.dart';
import 'package:menukunmae/tools/classes/food.dart';
import 'package:menukunmae/tools/utils/utils.dart';
import 'package:menukunmae/tools/widgets/widgets.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Tutorial extends StatefulWidget {
  final Food food;
  const Tutorial({Key? key, required this.food}) : super(key: key);

  @override
  _TutorialState createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  late YoutubePlayerController _ytbPlayerController;
  late String _ids;
  late Food _food;

  @override
  void initState() {
    super.initState();
    _food = widget.food;
    _ids = Utils.splitVdoLink(widget.food.getTutorial());
    _setOrientation([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        _ytbPlayerController = YoutubePlayerController(
          initialVideoId: _ids,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
          ),
        );
      });
    });
  }

  Widget _buildYtbView() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      // ignore: unnecessary_null_comparison
      child: _ytbPlayerController != null
          ? YoutubePlayer(controller: _ytbPlayerController)
          : const Center(child: CircularProgressIndicator()),
    );
  }

  @override
  void dispose() {
    super.dispose();

    _setOrientation([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _ytbPlayerController.dispose();
  }

  _setOrientation(List<DeviceOrientation> orientations) {
    SystemChrome.setPreferredOrientations(orientations);
  }

  Widget showBackground() {
    return AppWidget.backgroundWidget(
        imagePath: 'assets/images/bg_tutorial.png');
  }

  Widget listViewVolWidget() {
    return Expanded(
        child: ListView.separated(
            padding: const EdgeInsets.all(5),
            itemBuilder: (context, int index) {
              return ListTile(
                title: Text(_food.getVol()[index]),
              );
            },
            separatorBuilder: (context, int index) {
              return const Divider();
            },
            itemCount: _food.getVol().length));
  }

   Widget listViewCookingWidget() {
    return Expanded(
        child: ListView.separated(
            padding: const EdgeInsets.all(5),
            itemBuilder: (context, int index) {
              return ListTile(
                title: Text(_food.getCookingMethod()[index]),
              );
            },
            separatorBuilder: (context, int index) {
              return const Divider();
            },
            itemCount: _food.getCookingMethod().length));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Stack(
        children: <Widget>[
          showBackground(),
          Column(
            children: <Widget>[
              _buildYtbView(),
              Container(
                height: 300.0,
                child: Column(
                  children: <Widget>[
                    const Text('Food Ingredients'),
                    listViewVolWidget(),
                  ],
                ),
                margin: const EdgeInsets.only(right: 30.0, left: 30.0),
              ),
              const SizedBox(
                height: 25.0,
              ),
              Container(
                height: 300.0,
                child: Column(
                  children: <Widget>[
                    const Text('Food Ingredients'),
                    listViewCookingWidget()
                  ],
                ),
                margin: const EdgeInsets.only(right: 30.0, left: 30.0),
              ),
            ],
          )
        ],
      )),
    );
  }
}
