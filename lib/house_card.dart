import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:real_estate_flutter/price_model.dart';

import 'house_model.dart';

class HouseCard extends StatefulWidget {
  final House house;

  const HouseCard(this.house);

  @override
  State<StatefulWidget> createState() {
    return _HouseCardState(house);
  }
}

class _HouseCardState extends State<HouseCard> {
  final House house;

  _HouseCardState(this.house);

  Widget get houseCard {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 400.0,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: presentHouse(),
          ),
        ),
      ),
    );
  }

  List<Widget> presentHouse() {
    return <Widget>[
      Row(children: [
        Column(children: [FittedBox(child: image())]),
        Expanded(child: houseDetails()),
        //prices
        getPricesColumn(widget.house.prices)
        // new Text("right"),
      ]),
    ];
  }

  Column houseDetails() {
    return Column(
      children: [
        SizedBox(
            child: Text(widget.house.title,
                style: Theme.of(context).textTheme.headlineSmall)),
        surfaceAndLocation(),
        createdDate(),
        lastPriceChangedAt(),
      ],
    );
  }

  Widget image() {
    var imageBase64 = widget.house.imageBase64;

    return ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 100,
          maxHeight: 180,
        ),
        child: SizedBox(
            width: 100,
            child: imageBase64 == null
                ? const Icon(Icons.no_photography)
                : realImage(imageBase64)
        ));
  }

  Container realImage(String imageBase64) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.all(5),
        child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(Image.memory(base64Decode(imageBase64)));
              }));
            },
            child: Hero(
                tag: "houseImg",
                child: Image.memory(base64Decode(imageBase64)))));
  }

  Widget getPricesColumn(List<Price> prices) {
    List<Row> list = <Row>[];

    for (Price price in prices) {
      Text text = Text("${price.createdAt} -  ${price.price}");
      var row = Row(children: [text]);
      list.add(row);
    }

    return Column(children: list);
  }

  Row lastPriceChangedAt() {
    return Row(
      children: [
        Row(
          children: [
            const Icon(
              Icons.refresh,
              size: 14,
            ),
            Text(" Ostatnia zmiana ceny: ${widget.house.lastPriceChangedAt}")
          ],
        )
      ],
    );
  }

  Row createdDate() {
    return Row(
      children: [
        Row(
          children: [
            const Icon(
              Icons.add_box_outlined,
              size: 14,
            ),
            Text(" Dodano: ${widget.house.createdAt}")
          ],
        ),
      ],
    );
  }

  Row surfaceAndLocation() {
    return Row(
      children: <Widget>[
        const Icon(Icons.square_foot),
        Text("${widget.house.surface} m²  "),
        Row(
          children: <Widget>[
            const Icon(Icons.location_on),
            Text(widget.house.location)
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: showDogDetailPage,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: SizedBox(
          height: 115.0,
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 50.0,
                child: houseCard,
              ),
              // Positioned(top: 7.5, child: houseImage),
            ],
          ),
        ),
      ),
    );
  }

  // A class property that represents the URL flutter will render from the Dog class.
  String renderUrl = "";

  Widget get houseImage {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(renderUrl ?? ''),
        ),
      ),
    );
  }
}

class DetailScreen extends StatefulWidget {
  Image image;

  DetailScreen(this.image);

  @override
  State<StatefulWidget> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Center(
        child: Hero(tag: 'imageHero', child: widget.image),
      ),
    );
  }
}
