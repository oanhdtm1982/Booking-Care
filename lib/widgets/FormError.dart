import 'package:flutter/material.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formErrorText(error: errors[index])),
    );
  }
}

Row formErrorText({required String error}) {
  return Row(
    children: [
      const Icon(Icons.error, size: 14, color: Colors.blue),
      const SizedBox(
        width: 14,
      ),
      Text(
        error,
        style: const TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.blue),
      ),
    ],
  );
}
