

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vtuberlist/feature/main_bottom_navigation/bloc/main_bottom_navigation_bloc.dart';
import 'package:vtuberlist/feature/new_vtuber_add/bloc/new_vtuber_add_bloc.dart';
import 'package:vtuberlist/resources/app_parameter.dart';

class NewVTuberAddPage extends StatelessWidget {
  NewVTuberAddPage({super.key});

  TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<NewVtuberAddBloc>(create: (context) => NewVtuberAddBloc()),
          BlocProvider<MainBottomNavigationBloc>(create: (context) => MainBottomNavigationBloc()),
        ],
        child: BlocBuilder<NewVtuberAddBloc, NewVtuberAddState>(builder: (context, state) {
          return Scaffold(
            body: Container(
              // width: APPParameter.getScreenWdith(context),
              // height: APPParameter.getScreenHeight(context),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        BlocProvider.of<MainBottomNavigationBloc>(context).add(BackInPageMainBottomNavigationEvent());
                        Navigator.of(context).pop();
                      },
                      child: Text("New VTuber Add Page", style: TextStyle(decoration: TextDecoration.none),)
                    ),
                    TextField(
                      controller: _editingController,
                      onChanged: (value) {
                        _editingController.text = value;
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        })
    );
  }
}