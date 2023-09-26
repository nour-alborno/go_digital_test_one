import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_digital_test_one/GridExample/product_screen.dart';
import 'package:go_digital_test_one/bnb_example/main_page.dart';
import 'package:go_digital_test_one/data/posts_provider.dart';
import 'package:go_digital_test_one/ex_four.dart';
import 'package:go_digital_test_one/post_example/post_screen.dart';
import 'package:go_digital_test_one/tab_bar_example/dataProvider.dart';
import 'package:go_digital_test_one/tab_bar_example/screens/main_tab_bar_page.dart';
import 'package:go_digital_test_one/ui_one/one.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en'),
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool isdark = false;
  updateScreen(){
    setState(() {
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PostsProvider>(
      create: ( context) {
        return PostsProvider();
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: Utilities.isdark? ThemeData.dark(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
        //  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ) : ThemeData.light(),
        home:  MainPage(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}

class Utilities {
 static bool isdark = false;
}


