import 'package:flutter/material.dart';

class SubjectScoreRow {
  final String name;
  final String score;
  final String average;
  final String max;

  SubjectScoreRow(
    this.name,
    this.score,
    this.average,
    this.max,
  );

  TableRow to() {
    return TableRow(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(16),
          ),
          margin: EdgeInsets.only(top: 3, bottom: 3),
          padding: EdgeInsets.only(top: 12, bottom: 12),
          child: Center(
            child: Text(
              name,
              style: TextStyle(color: Colors.white),
              textScaleFactor: 1.24,
            ),
          ),
        ),
        Center(child: Text(score, textScaleFactor: 1.24)),
        Center(child: Text(average, textScaleFactor: 1.24)),
        Center(child: Text(max, textScaleFactor: 1.24)),
      ],
    );
  }
}
