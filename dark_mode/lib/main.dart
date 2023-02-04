import 'package:dark_mode/themes/custom_themedata_ext.dart';
import 'package:dark_mode/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dark_mode/second_screen.dart';
import 'package:dark_mode/cubits/theme/theme_cubit.dart';
import 'cubits/theme/theme_states.dart';
import 'di/injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>ThemeCubit()..init(),
      child: BlocBuilder<ThemeCubit,ThemeStates>(
        builder: (context,state){
          return MaterialApp(
            title: 'Flutter Theme Demo',
            debugShowCheckedModeBanner: false,
            theme: Themes.lightTheme,
            darkTheme: Themes.darkTheme,
            themeMode: ThemeCubit.get(context).isDark? ThemeMode.dark:ThemeMode.light,
            home:  MyHomeScreen(),
          );
        },
      ),
    );

    //or
    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider(create: (context)=>ThemeCubit()..init()),
    //   ],
    //   child: BlocBuilder<ThemeCubit,ThemeStates>(
    //     builder: (context,state){
    //       return MaterialApp(
    //         title: 'Flutter Theme Demo',
    //         debugShowCheckedModeBanner: false,
    //         theme: Themes.lightTheme,
    //         darkTheme: Themes.darkTheme,
    //         themeMode: ThemeCubit.get(context).isDark? ThemeMode.dark:ThemeMode.light,
    //         home:  MyHomeScreen(),
    //       );
    //     },
    //   ),
    // );
  }
}

class MyHomeScreen extends StatefulWidget {
  @override
  MyHomeScreenState createState() => MyHomeScreenState();
}

class MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
        backgroundColor:Theme.of(context).appBarTheme.backgroundColor ,
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
               Text("Hello", style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
              ),),
            TextButton(
              child: Container(
                width: double.infinity,
                color: Theme.of(context).gotoScreenContainerColor,
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Text(
                  'go to second screen',
                  style: TextStyle( color:Theme.of(context).gotoScreenTextColor , fontSize: 25.0
                  ),textAlign: TextAlign.center
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: ((context) {
                    return  const SecondScreen();
                  })),
                );
              },
            )
             ,
            TextButton(
                child: Container(
                  width: double.infinity,
                  color: Theme.of(context).toggleModeContainerColor,
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    'toggle dark mode',
                    style: TextStyle( color:Theme.of(context).toggleModeTextColor , fontSize: 25.0
                    ),textAlign: TextAlign.center,
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
