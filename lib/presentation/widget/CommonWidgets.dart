import 'package:flutter/material.dart';

class XTitle extends StatelessWidget {
  String value;
  XTitle({required this.value, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          value,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );
  }
}

class XSubTitle extends Text {
  final String value;
  XSubTitle({required this.value, Key? key}) : super(key: key, value);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(right: 8.0, top: 8, bottom: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          value,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}

class XField extends StatelessWidget {
  String value;
  XField({required this.value, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextFormField(
          decoration: InputDecoration(
            hintText: value,
          ),
        ),
      ),
    );
  }
}
class XTextArea extends StatelessWidget {
  String value;
  XTextArea({required this.value, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextFormField(
          maxLines: 7,
          decoration: InputDecoration(
            hintText: value
          ),
        ),
      ),
    );
  }
}

class XButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final bool alter;
  final void Function() onPressed;
  const XButton({
    required this.onPressed,
    required this.alter,
    required this.width,
    required this.height,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          foregroundColor: alter ? Theme.of(context).primaryColor : Colors.white,
          backgroundColor: alter ? Colors.white : Theme.of(context).primaryColor,
        ),
        child: Text(text),
        onPressed: onPressed,
      ),
    );
  }
}
