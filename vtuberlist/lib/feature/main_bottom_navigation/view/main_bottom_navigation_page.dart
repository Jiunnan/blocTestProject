
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vtuberlist/core/router/router.dart';
import 'package:vtuberlist/core/router/router_name.dart';
import 'package:vtuberlist/feature/main_bottom_navigation/bloc/main_bottom_navigation_bloc.dart';
import 'package:vtuberlist/feature/user_info/bloc/user_info_bloc.dart';
import 'package:vtuberlist/feature/user_info/view/user_info_page.dart';
import 'package:vtuberlist/feature/vtuber_list/bloc/vtuber_list_bloc.dart';
import 'package:vtuberlist/feature/vtuber_list/view/vtuber_list_page.dart';
import 'package:vtuberlist/resources/app_color.dart';
import 'package:vtuberlist/shared/bottom_navigation_widget.dart';

class MainBottomNavigationPage extends StatelessWidget {
  MainBottomNavigationPage({super.key});

  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<MainBottomNavigationBloc>(create: (context) => MainBottomNavigationBloc()),
          BlocProvider<VtuberListBloc>(create: (context) => VtuberListBloc()..add(VtuberListEventInitial())),
          BlocProvider<UserInfoBloc>(create: (context) => UserInfoBloc()..add(UserInfoEventInitial())),
        ],
        child: BlocBuilder<MainBottomNavigationBloc, MainBottomNavigationState>(builder: (context, state) {
          if (state is ChangeCompleteMainBottomNavigationState) {
            if (_pageIndex != state.changeIndex) {
              _pageIndex = state.changeIndex;
            }
          } else if (state is OutPageMainBottomNavigationState) {
            print("JN - OutPageMainBottomNavigationState");
            context.read<VtuberListBloc>().add(OutPageVtuberListEvent());
            context.read<UserInfoBloc>().add(OutPageUserInfoEvent());
            Timer(const Duration(seconds: 1), () {
              Navigator.of(context).pushNamed(RouterName.NewVtuberAddPageName).then((value) =>
                  context.read<MainBottomNavigationBloc>().add(BackInPageMainBottomNavigationEvent())
              );
            });
          } else if (State is BackInPageMainBottomNavigationState) {
            print("JN - BackInPageMainBottomNavigationState");
            context.read<VtuberListBloc>().add(BackInPageVtuberListEvent());
            context.read<UserInfoBloc>().add(BackInPageUserInfoEvent());
          }
          return Scaffold(
            body: IndexedStack(
              index: _pageIndex,
              children: APPRouter.bottomNavigationPage.map((page) => Navigator(
                onGenerateInitialRoutes: (navigator, initialRoute) {
                  return [
                    MaterialPageRoute(builder: (context) => page)
                  ];
                },
              )).toList(),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Container(
              margin: const EdgeInsets.only(top: 30),
              width: 64,
              height: 64,
              child: FloatingActionButton(
                backgroundColor: APPColor.color0xFFFFFFFF,
                elevation: 10,
                shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 3, color: APPColor.color0xFF4CAF50),
                    borderRadius: BorderRadius.circular(100)
                ),
                child: Icon(
                  Icons.add,
                  color: APPColor.color0xFF4CAF50,
                ),
                onPressed: () {
                  print("JN - go add page");
                  context.read<MainBottomNavigationBloc>().add(OutPageMainBottomNavigationEvent());
                },
              ),
            ),
            bottomNavigationBar: NavBar(
              pageIndex: _pageIndex,
              onTap: (index) {
                context.read<MainBottomNavigationBloc>().add(ChangePageMainBottomNavigationEvent(index));
              },
            ),
          );
        },)
    );
  }
}