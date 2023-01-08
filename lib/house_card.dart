import 'package:flutter/material.dart';

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
      width: 390.0,
      height: 115.0,
      child: Card(
        color: Colors.black38,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
            left: 64.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: presentHouse(),
          ),
        ),
      ),
    );
  }

  List<Widget> presentHouse() {
    return <Widget>[
      Text(widget.house.title,
          style: Theme.of(context).textTheme.headlineSmall),
      Text(widget.house.location, style: Theme.of(context).textTheme.bodySmall),
      // Row(
      //   children: <Widget>[
      //     const Icon(
      //       Icons.star,
      //     ),
      //     Text(' ${widget.dog.rating} / 10')
      //   ],
      // )
    ];
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
              Positioned(top: 7.5, child: houseImage),
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
