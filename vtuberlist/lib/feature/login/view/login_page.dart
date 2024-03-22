

// import 'package:flutter/cupertino.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vtuberlist/core/network/feature_api/login/login_api.dart';
import 'package:vtuberlist/core/router/router.dart';
import 'package:vtuberlist/core/router/router_name.dart';
import 'package:vtuberlist/feature/login/bloc/login_bloc.dart';
import 'package:vtuberlist/feature/login/view_object/login_model.dart';
import 'package:vtuberlist/resources/app_color.dart';
import 'package:vtuberlist/resources/app_parameter.dart';

import '../../../resources/app_resources_path.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController _emailTxt = TextEditingController();
  TextEditingController _passwordTxt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider<LoginBloc>(create: (context) => LoginBloc())],
        child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
          if (state is LoginSuccessLoginState) {
            Timer(const Duration(seconds: 1), () {
              Navigator.of(context).pushNamedAndRemoveUntil(RouterName.MainPageName, (route) => false);
            });
          }
          return Scaffold(
            body: InkWell(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Container(
                decoration: BoxDecoration(
                    color: APPColor.color0xFFFFFFFF
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: APPParameter.getScreenHeight(context)/8,),
                      Container(
                        child: Center(
                          child: Image.asset(IconsPath.logoIcon),
                        ),
                      ),
                      Container(
                        child: Container(
                          padding: EdgeInsets.only(left: APPParameter.getScreenWdith(context)/10, top: 10, right: APPParameter.getScreenWdith(context)/10),
                          width: APPParameter.getScreenWdith(context),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Email", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold, decoration: TextDecoration.none),),
                              SizedBox(height: 10,),
                              TextField(
                                controller: _emailTxt,
                                onChanged: (value) {
                                  _emailTxt.text = value;
                                  context.read<LoginBloc>().add(
                                      EmailJudgeLoginEvent(value)
                                  );
                                },
                              ),
                              if (!((state is EmailAndPasswordCheckOKLoginState && state.isOK) ? true : context.read<LoginBloc>().emailJudge) &&
                                  _emailTxt.text.isNotEmpty)...[
                                SizedBox(height: 5,),
                                Text("Email欄位請不要留空或是格式錯誤", style: TextStyle(color: APPColor.color0xFFFF8A80, fontSize: 10, decoration: TextDecoration.none),),
                              ],
                              if (((state is LoginAPIErrorLoginState && (state.errorType == LoginErrorType.EmailError)) ? state.errorMsg : "").isNotEmpty)...[
                                SizedBox(height: 5,),
                                Text((state is LoginAPIErrorLoginState && (state.errorType == LoginErrorType.EmailError)) ? state.errorMsg : "", style: TextStyle(color: APPColor.color0xFFFF8A80, fontSize: 10, decoration: TextDecoration.none),),
                              ],
                              SizedBox(height: 10,),
                              Text("Password", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold, decoration: TextDecoration.none),),
                              SizedBox(height: 10,),
                              TextField(
                                controller: _passwordTxt,
                                onChanged: (value) {
                                  _passwordTxt.text = value;
                                  context.read<LoginBloc>().add(
                                    PasswordJudgeLoginEvent(value)
                                  );
                                },
                              ),
                              if (!((state is EmailAndPasswordCheckOKLoginState && state.isOK) ? true : context.read<LoginBloc>().passwordJudge) &&
                                  _passwordTxt.text.isNotEmpty)...[
                                SizedBox(height: 5,),
                                Text("密碼欄位請不要留空或是密碼最少7個字", style: TextStyle(color: APPColor.color0xFFFF8A80, fontSize: 10, decoration: TextDecoration.none),),
                              ],
                              if (((state is LoginAPIErrorLoginState && (state.errorType == LoginErrorType.PasswordError)) ? state.errorMsg : "").isNotEmpty)...[
                                SizedBox(height: 5,),
                                Text((state is LoginAPIErrorLoginState && (state.errorType == LoginErrorType.PasswordError)) ? state.errorMsg : "", style: TextStyle(color: APPColor.color0xFFFF8A80, fontSize: 10, decoration: TextDecoration.none),),
                              ],
                              SizedBox(height: 10,),
                              InkWell(
                                onTap: () async {
                                  if ((state is EmailAndPasswordCheckOKLoginState && state.isOK)) {
                                    context.read<LoginBloc>().add(
                                        LoginClickLoginEvent(_emailTxt.text, _passwordTxt.text)
                                    );
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: (state is EmailAndPasswordCheckOKLoginState && state.isOK) ? APPColor.color0xFFFFD180 : APPColor.color0xFFE0E0E0
                                  ),
                                  width: APPParameter.getScreenWdith(context)*4/5,
                                  height: 50,
                                  child: Center(
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          color: (state is EmailAndPasswordCheckOKLoginState && state.isOK) ? APPColor.color0xFFFFFFFF : APPColor.color0xFF000000,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          decoration: TextDecoration.none
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },)
    );
  }
}