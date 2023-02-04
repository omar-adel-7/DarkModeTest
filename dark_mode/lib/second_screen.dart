import 'package:dark_mode/cubits/theme/theme_cubit.dart';
import 'package:dark_mode/third_screen.dart';
import 'package:dark_mode/themes/custom_themedata_ext.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("second screen"),
        backgroundColor:Theme.of(context).appBarTheme.backgroundColor ,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: Container(
                width: double.infinity,
                color: Theme.of(context).gotoScreenContainerColor,
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Text(
                  'go to third screen',
                    style: TextStyle( color:Theme.of(context).gotoScreenTextColor , fontSize: 25.0
                    ),textAlign: TextAlign.center
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: ((context) {
                    return  ThirdScreen();
                  })),
                );
              },
            ),
            TextButton(
                child: Container(
                  width: double.infinity,
                  color: Theme.of(context).toggleModeContainerColor,
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    'toggle dark mode',
                      style: TextStyle( color:Theme.of(context).toggleModeTextColor , fontSize: 25.0
                      ),textAlign: TextAlign.center
                  ),
                ),
                onPressed: () {
                  ThemeCubit.get(context).changeAppTheme();
                }
            ),
          ],
        ),
      ),
    );


  }
}
