
import 'package:flutter/material.dart';
import 'package:machine_test/base_module/presentation/core/values/style.dart';

class CustomSubpartForGridTile extends StatelessWidget {
  final String ? heading;
  final String ? content;

  const CustomSubpartForGridTile({Key? key, this.heading, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      width: MediaQuery.of(context).size.width ,
      child: Row(
        children: [
          Text(heading ?? '_',style: Style.subheadingTwo),
          Text(" : ",style: Style.subheadingTwo ),
          Container(
              width: MediaQuery.of(context).size.width/2,
              child: Text(content ?? '_',overflow: TextOverflow.ellipsis,maxLines: 3,style:  Style.subheadingTwo,)),

        ],
      ),
    );
  }
}
