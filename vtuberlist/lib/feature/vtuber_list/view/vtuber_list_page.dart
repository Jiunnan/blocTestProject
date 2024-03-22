


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vtuberlist/feature/vtuber_list/bloc/vtuber_list_bloc.dart';

class VtuberListPage extends StatelessWidget {
  VtuberListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<VtuberListBloc>(create: (context) => VtuberListBloc()),
        ],
        child: BlocBuilder<VtuberListBloc, VtuberListState>(builder: (context, state) {
          if (state is OutPageVtuberListState) {
            print("JN - OutPageVtuberListState");
          } else if (state is BackInPageVtuberListState) {
            print("JN - BackInPageVtuberListState");
          }
          return Container(
            child: Center(
              child: Text("Vtuber List", style: TextStyle(decoration: TextDecoration.none),),
            ),
          );
        })
    );
  }
}