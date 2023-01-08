import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';

import 'house_card.dart';
import 'house_model.dart';

class HouseList extends StatelessWidget {
  List<House> houses;

  HouseList(this.houses);

  @override
  Widget build(BuildContext context) {

    return _buildList(context, houses);
  }

  ListView _buildList(context, loadedHouses) {
    return ListView.builder(
        itemCount: loadedHouses.length,
        itemBuilder: (context, int) {
          return HouseCard(loadedHouses[int]);
        });
  }
}
