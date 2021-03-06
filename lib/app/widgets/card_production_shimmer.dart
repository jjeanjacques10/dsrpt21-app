import 'package:flutter/material.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:shimmer/shimmer.dart';

Card cardProductionShimmer() {
  const _baseColor = Colors.black;
  const _duration = Duration(milliseconds: 4000);

  return Card(
    clipBehavior: Clip.antiAlias,
    child: Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: ListTile(
            leading: GFAvatar(
              size: 40,
              backgroundImage: AssetImage(
                "assets/models/loading.gif",
              ),
              backgroundColor: Colors.transparent,
            ),
            title: Shimmer.fromColors(
              highlightColor: Color.fromRGBO(64, 75, 96, .1),
              baseColor: _baseColor,
              period: _duration,
              child: Container(
                  height: 12, width: 5, color: Color.fromRGBO(64, 75, 96, .1)),
            ),
            subtitle: Shimmer.fromColors(
              highlightColor: Color.fromRGBO(64, 75, 96, .1),
              baseColor: _baseColor,
              period: _duration,
              child: Container(
                  height: 12, width: 5, color: Color.fromRGBO(64, 75, 96, .1)),
            ),
          ),
        ),
        ButtonBar(
          alignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: GFButton(onPressed: () {}, text: " ", color: Colors.grey),
            ),
          ],
        ),
      ],
    ),
  );
}
