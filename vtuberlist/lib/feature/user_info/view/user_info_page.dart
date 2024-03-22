



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vtuberlist/feature/user_info/bloc/user_info_bloc.dart';

class UserInfoPage extends StatelessWidget {
  UserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<UserInfoBloc>(create: (context) => UserInfoBloc()),
        ],
        child: BlocBuilder<UserInfoBloc, UserInfoState>(builder: (context, state) {
          if (state is OutPageUserInfoState) {
            print("JN - OutPageUserInfoState");
          } else if (state is BackInPageUserInfoState) {
            print("JN - BackInPageUserInfoState");
          }
          return Container(
            child: Center(
              child: Text("User infomation Page", style: TextStyle(decoration: TextDecoration.none),),
            ),
          );
        })
    );
  }
}