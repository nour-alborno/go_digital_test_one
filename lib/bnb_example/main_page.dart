import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_digital_test_one/bnb_example/screens/fav_screen.dart';
import 'package:go_digital_test_one/bnb_example/screens/home_screen.dart';
import 'package:go_digital_test_one/main.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title:  Text("title".tr()) ,
      actions: [
        Switch(value: Utilities.isdark, onChanged: (value) {

        },),
       IconButton(onPressed: () {
        Locale locale = context.locale;
        bool isArabic = const Locale("ar") == locale;
        print(isArabic);
        isArabic? context.setLocale(const Locale("en")) : context.setLocale(const Locale("ar"));
        print("after ${isArabic},");
       }, icon: const Icon(Icons.language))
      ],),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedItemColor: Colors.blue,
        onTap: (value) {
          index = value;
          controller.animateToPage(value, duration: const Duration(seconds: 1), curve: Curves.linear);
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(icon:Icon( Icons.home),label: "home"),
          BottomNavigationBarItem(icon:Icon( Icons.favorite),label: "fav"),

        ],),
      body: PageView(
        onPageChanged: (value) {
          index = value;
          setState(() {

          });
        },
        controller: controller,
    //    physics: NeverScrollableScrollPhysics(),
        children: [
          const HomeScreen(),
          FavScreen( ),
        ],
      ),
    );
  }
}
