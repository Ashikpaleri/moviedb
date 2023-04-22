
import 'package:flutter/material.dart';

class CustomContentWidget extends StatelessWidget {
  final String ? name;
  final String ? content;
  const CustomContentWidget({Key? key, this.content,this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    return Container(width: size.width,
      child: Row(
        children: [
          Text(name!),
          Text(content!,overflow: TextOverflow.ellipsis,maxLines: 3,)
        ],
      ),
    );
  }
}
