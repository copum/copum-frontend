import 'package:flutter/material.dart';

class AgreementHint extends StatefulWidget {
  final String first;
  final String second;

  const AgreementHint(this.first, this.second, {Key? key}) : super(key: key);

  @override
  State<AgreementHint> createState() => _AgreementHintState();
}

class _AgreementHintState extends State<AgreementHint> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        widget.first,
        style: const TextStyle(
            color: Colors.white, fontFamily: "Elice", fontSize: 16),
      ),
      TextButton(
        onPressed: () {},
        child: Text(widget.second,
            style: const TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.grey,
                fontFamily: 'Elice',
                fontSize: 16)),
      ),
    ]);
  }
}
