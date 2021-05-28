import 'package:flutter/material.dart';

class QAWidget extends StatelessWidget {
  final String _q;
  final String _a;

  QAWidget(this._q, this._a);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 2),
            child: Text('Q: ' + _q),
          ),
          Text('A: ' + _a),
        ],
      ),
    );
  }
}
