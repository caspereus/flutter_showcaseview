import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowCaseNavigation extends StatelessWidget {
  final int currentCase;
  final int totalCase;
  final Function onNext;
  final Function onPrev;
  final bool isTop;
  final bool isLast;
  final Function onClose;

  ShowCaseNavigation({
    @required this.currentCase,
    @required this.totalCase,
    this.onNext,
    this.onPrev,
    this.isTop = true,
    this.isLast = false,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: isTop ? 30 : null,
      left: 10,
      right: 10,
      bottom: !isTop ? 20 : null,
      child: Container(
        width: double.infinity,
        height: 60,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          if (onPrev != null) onPrev();
                        },
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      height: 60,
                      width: 60,
                    ),
                    Container(
                      child: Material(
                        child: Text(
                          "$currentCase  dari  $totalCase",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        color: Colors.transparent,
                      ),
                    ),
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          if (onNext != null) onNext();
                        },
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      height: 60,
                      width: 60,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: isLast ? Container(
                child: GestureDetector(
                  onTap: () {
                    if (onClose != null) onClose();
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ) : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
