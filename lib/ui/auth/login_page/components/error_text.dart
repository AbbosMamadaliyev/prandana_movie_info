import 'package:flutter/material.dart';
import 'package:prandana_movie_info/view_models/auth_provider/signin_provider.dart';
import 'package:provider/src/provider.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final errorMsg = context.watch<SignInProvider>().loginErrorMessage;
    if (errorMsg == null) return const SizedBox.shrink();

    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(top: height * 0.02, bottom: height * 0.18),
        child: Text(
          errorMsg,
          style: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
