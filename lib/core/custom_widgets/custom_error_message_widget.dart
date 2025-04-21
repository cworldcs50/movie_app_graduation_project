import 'package:flutter/widgets.dart';

class CustomErrorMessageWidget extends StatelessWidget {
  const CustomErrorMessageWidget({required this.errorMessage, super.key});

  final String errorMessage;
  
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errorMessage));
  }
}