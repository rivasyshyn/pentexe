import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../home/pent.dart';

class PentWidget extends StatelessWidget {
  final Pent pent;
  const PentWidget(this.pent, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Text(pent.body),
      ),
    );
  }
}
