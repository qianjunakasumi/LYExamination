import 'package:flutter/material.dart';

class SubjectResultComponent extends StatelessWidget {
  final String result;

  const SubjectResultComponent(this.result, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 13),
              Container(
                width: 48,
                height: 6,
                decoration: BoxDecoration(
                  color: Color(0xFF36CFC9).withOpacity(0.4),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 48,
            child: Align(
              alignment: AlignmentDirectional.center,
              child: Text(result, textScaleFactor: 1.16),
            ),
          ),
        ],
      ),
    );
  }
}
