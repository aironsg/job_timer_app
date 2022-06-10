import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonWithLoading<B extends StateStreamable<S>, S>
    extends StatelessWidget {
  final BlocWidgetSelector<S, bool> selector;
  final B bloc;
  final VoidCallback onPressed;
  final String label;
  const ButtonWithLoading(
      {super.key,
      required this.selector,
      required this.bloc,
      required this.onPressed,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: BlocSelector<B, S, bool>(
          bloc: bloc,
          selector: selector,
          builder: (context, showLoading) {
            if (!showLoading) {
              return Text(label,
                  style: TextStyle(
                    fontSize: 24.0,
                  ));
            }

            return Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                const Align(
                  
                  alignment: Alignment.centerRight,
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            );
          }),
    );
  }
}