import 'package:flutter/material.dart';

class CustomCardActorsInfoWidget extends StatelessWidget {
  final Widget child;
  const CustomCardActorsInfoWidget({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(2, 4),
          )
        ],
      ),
      clipBehavior: Clip.hardEdge,
      child: child,
    );
  }
}
