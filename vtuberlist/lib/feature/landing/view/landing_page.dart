import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vtuberlist/core/router/router_name.dart';
import 'package:vtuberlist/feature/Landing/cubit/landing_cubit.dart';
import 'package:vtuberlist/feature/Landing/view_object/landing_model.dart';


class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LandingCubit>(create: (context) => LandingCubit()),
        ],
        child: BlocBuilder<LandingCubit, LandingState>(builder: (context, state) {
          if (state is LandingInitial) {
            print("JN - LandingInitial");
            Timer(const Duration(seconds: 1), () {
              context.read<LandingCubit>().judgeLogin();
            });
          } else if (state is LandingJudge) {
            print("JN - LandingJudge");
            context.read<LandingCubit>().nextState();
          } else if (state is LandingToLogin) {
            print("JN - LandingToLogin");
            Timer(const Duration(seconds: 1), () {
              Navigator.of(context).pushNamedAndRemoveUntil(RouterName.LoginPageName, (route) => false);
            });
          } else if (state is LandingAutoLoading) {
            print("JN - LandingAutoLoading");
            context.read<LandingCubit>().nextState();
          } else if (state is LandingToMain) {
            print("JN - LandingToMain");
            Timer(const Duration(seconds: 1), () {
              Navigator.of(context).pushNamedAndRemoveUntil(RouterName.MainPageName, (route) => false);
            });
          } else if (state is LandingAutoLoadingError) {
            print("JN - LandingAutoLoadingError");
            Timer(const Duration(seconds: 1), () {
              Navigator.of(context).pushNamedAndRemoveUntil(RouterName.LoginPageName, (route) => false);
            });
          }
          return Container(
            decoration: BoxDecoration(
                color: Colors.white),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LoadingAnimationWidget.inkDrop(color: Colors.greenAccent, size: 100),
              SizedBox(height: 30,),
              AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText("Now Loading...", textAlign: TextAlign.center, textStyle: TextStyle(fontSize: 20, fontFamily: "Bobbers", decoration: TextDecoration.none), speed: const Duration(milliseconds: 280)),
                ],
                repeatForever: true,
              ),
            ],
          ),
        ),
      );
    })
    );

    return Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LoadingAnimationWidget.inkDrop(color: Colors.greenAccent, size: 100),
            SizedBox(height: 30,),
            AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText("Now Loading...", textAlign: TextAlign.center, textStyle: TextStyle(fontSize: 20, fontFamily: "Bobbers", decoration: TextDecoration.none), speed: const Duration(milliseconds: 280)),
              ],
              repeatForever: true,
            ),
          ],
        ),
      ),
    );
  }
}