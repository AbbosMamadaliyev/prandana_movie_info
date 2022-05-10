import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prandana_movie_info/main_navigation.dart';

import '../../blocs/auth_bloc/auth_bloc.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<AuthBloc, AuthState>(
            builder: (BuildContext context, state) {
          return SingleChildScrollView(
            child: Stack(
              children: [
                Image.asset('assets/images/bckgrnd_auth.png'),
                Image.asset(
                  'assets/images/overlay_auth.png',
                  fit: BoxFit.cover,
                  height: height,
                  width: width,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: height * 0.4),
                      Image.asset(
                        'assets/images/logo.png',
                        height: height * 0.04,
                      ),
                      SizedBox(height: height * 0.04),
                      CustomContainer(
                          color: const Color(0xffC70C3C),
                          text: 'Вход',
                          func: () {
                            Navigator.of(context)
                                .pushNamed(MainNavigationRouteNames.login);
                          }),
                      CustomContainer(
                        color: const Color(0xff659ed7),
                        text: 'Регистрация',
                        func: () {
                          Navigator.of(context)
                              .pushNamed(MainNavigationRouteNames.signUp);
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: height * 0.035),
                        child: const Divider(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final Color color;
  final String text;
  final void Function() func;
  const CustomContainer(
      {Key? key, required this.color, required this.text, required this.func})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: func,
      child: Container(
        height: height * 0.08,
        margin: EdgeInsets.only(top: height * 0.035),
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
