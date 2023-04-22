
import 'package:flutter/material.dart';
import 'package:machine_test/base_module/presentation/core/values/app_assets.dart';
import 'package:machine_test/base_module/presentation/core/values/app_constants.dart';
import 'package:machine_test/base_module/presentation/core/values/style.dart';
import 'package:machine_test/home/home_module/presentation/feature/screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
   Future.delayed(Duration(seconds: 3),() =>        Navigator.pushReplacement(context,
                 MaterialPageRoute(builder: (context) =>  HomeScreen())),

  );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
        child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ThemeAssets.movie),fit: BoxFit.cover
                  )
                ),

              ),
              SizedBox(height: AppConstants.defaultPadding,),
              Text("Movie DB",style: TextStyle(fontSize: 18,color: CommonColors.colorOrange,fontWeight: FontWeight.w600),)

            ],
          ),
        ),
    ),
      );
  }
}
