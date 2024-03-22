import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vtuberlist/core/router/router_name.dart';
import 'package:vtuberlist/feature/Landing/view/landing_page.dart';
import 'package:vtuberlist/feature/login/view/login_page.dart';
import 'package:vtuberlist/feature/main_bottom_navigation/view/main_bottom_navigation_page.dart';
import 'package:vtuberlist/feature/new_vtuber_add/view/new_vtuber_add_page.dart';
import 'package:vtuberlist/feature/user_info/view/user_info_page.dart';
import 'package:vtuberlist/feature/vtuber_list/view/vtuber_list_page.dart';

class APPRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case RouterName.LandingPageName:
        return MaterialPageRoute(builder: (_) => LandingPage());
      case RouterName.LoginPageName:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case RouterName.MainPageName:
        return MaterialPageRoute(builder: (_) => MainBottomNavigationPage());
      case RouterName.NewVtuberAddPageName:
        return MaterialPageRoute(builder: (_) => NewVTuberAddPage());
      default:
        return _errorRoute();
    }
  }

  static List<Widget> bottomNavigationPage = [
    VtuberListPage(),
    UserInfoPage(),
  ];

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Container(
        child: Center(
          child: Text("Error Router"),
        ),
      );
    });
  }
}