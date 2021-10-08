import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:comecsoft/generated/l10n.dart';


class RatingConfirmWidget extends StatefulWidget {
  final double rating;
  final void Function(double) onRatingUpdate;

  RatingConfirmWidget({
    Key? key,
    required this.rating,
    required this.onRatingUpdate,
  }):   super(key: key);

  @override
  _RatingConfirmWidgetState createState() => _RatingConfirmWidgetState();
}

class _RatingConfirmWidgetState extends State<RatingConfirmWidget> {
  @override
  Widget build(BuildContext context) {
    S? _s = S.of(context);

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RatingBar.builder(
            initialRating: widget.rating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: false,
            itemCount: 5,
            itemSize: 40,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) => widget.onRatingUpdate.call(rating),
          )
        ],
      ),
    );
  }
}