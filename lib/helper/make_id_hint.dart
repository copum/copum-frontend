import 'package:flutter/material.dart';

class MakeIdHint extends StatefulWidget {
  final String first;
  final String second;
  // final String second;

  const MakeIdHint(this.first, this.second, {Key? key}) : super(key: key);

  @override
  State<MakeIdHint> createState() => _MakeIdHintState();
}

class _MakeIdHintState extends State<MakeIdHint> {
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
