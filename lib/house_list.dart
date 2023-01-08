import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:real_estate_flutter/house_page.dart';

import 'house_card.dart';
import 'house_model.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class HouseList extends StatefulWidget {

  @override
  State<HouseList> createState() => _HouseListState();
}

class _HouseListState extends State<HouseList> {
  late Future<HousePage> housePage;
  late List<House> houses;

  @override
  void initState() {
    super.initState();
    housePage = fetchPost();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: housePage,
      builder: (BuildContext context, AsyncSnapshot<HousePage> snapshot) {
        if (snapshot.hasData) {
          // Data fetched successfully, display your data here
          return _buildList(context, snapshot.data!.houses);
        } else if (snapshot.hasError) {
          // If something went wrong
          return const Text('Something went wrong...');
        }

        // While fetching, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }

  ListView _buildList(context, loadedHouses) {
    return ListView.builder(
        itemCount: loadedHouses.length,
        itemBuilder: (context, int) {
          return HouseCard(loadedHouses[int]);
        });
  }

  Future<HousePage> fetchPost() async {
    Uri url = Uri.http('vps571103.ovh.net:9010', '/houses/changed');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(utf8.decode(response.bodyBytes));
      HousePage housePage = HousePage.fromJson(responseBody);
      return housePage;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
