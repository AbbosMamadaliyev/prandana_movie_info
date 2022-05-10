import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prandana_movie_info/blocs/auth_bloc/auth_bloc.dart';

class LoginButton extends StatelessWidget {
  final String email;
  final String password;
  const LoginButton({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final model = context.watch<SignInProvider>();

    // final onPressed = model.canStartAuth == true
    //     ? () => model.loginButtonAction(context)
    //     : null;

    final child = /*model.isAuthProgress == true
        ? const SizedBox(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
            height: 15,
            width: 15,
          )
        : */
        const Text(
      'Вход',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    );
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: InkWell(
        onTap: () {
          print('$email, $password');

          context
              .read<AuthBloc>()
              .add(AuthLoginEvent(email: email, password: password));
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xffC70C3C),
          ),
          height: 56,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
