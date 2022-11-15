import 'package:flutter/material.dart';
import 'package:maan_academy_news/Screens/home_screen.dart';
import 'package:nb_utils/nb_utils.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  Future<void> initSplash () async{
    await Future.delayed(const Duration(seconds: 2)).then((value) => const HomeScreen().launch(context,isNewTask: true));
  }
  @override
  void initState() {
   initSplash();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: CircleAvatar(
          radius: 80.0,
          backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/330/330703.png'),
        ),
      ),
    );
  }
}
