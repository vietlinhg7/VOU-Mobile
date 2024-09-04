import 'package:flutter/material.dart';

class PrefixWidget extends StatelessWidget {
  final String countryCode;
  final String label;

  const PrefixWidget({
    Key? key,
    required this.countryCode,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(countryCode),
        const SizedBox(width: 8),
        Text(label),
      ],
    );
  }
}