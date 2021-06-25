import 'package:flutter/material.dart';

class RoundImage extends StatelessWidget {
  final String url;
  final String path;
  final String name;
  final double width;
  final double height;
  final EdgeInsets margin;
  final double borderRadius;

  const RoundImage(
      {Key key,
      this.url,
      this.path = "",
      this.name = "",
      this.margin,
      this.width = 40,
      this.height = 40,
      this.borderRadius = 40})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _contentGenerator();
  }

  Widget _contentGenerator() {
    if (path.isEmpty && url == null && name.isNotEmpty)
      return Container(
        height: height,
        width: width,
        margin: margin,
        child: Center(child: Text(_nameGenerator(name)),),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      );
    else
      return Container(
        height: height,
        width: width,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          image: DecorationImage(
            image: path.isNotEmpty ? AssetImage(path) : NetworkImage(url),
            fit: BoxFit.cover,
          ),
        ),
      );
  }

  String _nameGenerator(String name) {
    String names = "";
    List<String> data = name.split(" ");
    data.forEach((element) {
      names += element[0].toUpperCase();
    });
    return names;
  }
}
