import 'package:flutter/material.dart';
import 'package:konfio_challenge/models/dogs/dog.model.dart';
import 'package:konfio_challenge/theme/spaces.dart';

class DogCard extends StatefulWidget {
  final bool hasShadow;
  final DogModel dog;
  const DogCard({super.key, required this.dog, this.hasShadow = false});

  @override
  State<DogCard> createState() => _DogCardState();
}

class _DogCardState extends State<DogCard> {
  late ThemeData _theme;
  static const double imageWidth = 130;

  _buildImage() {
    return Container(
      width: imageWidth,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          // TODO: Change to Image.network to handle load error and loading
          image: NetworkImage(
            widget.dog.image,
          ),
          fit: BoxFit.cover,
        ),
        boxShadow: widget.hasShadow
            ? [
                BoxShadow(
                  color: Colors.red
                      .shade50, // Requirements not clear. Should shadow color be extracted from image?
                  spreadRadius: 1,
                  blurRadius: 12,
                  offset: const Offset(0, 12),
                ),
              ]
            : null,
      ),
    );
  }

  _buildCard() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: _theme.cardColor),
      padding: EdgeInsets.only(left: imageWidth),
      constraints: BoxConstraints(
          minHeight: 160, minWidth: double.infinity, maxHeight: 200),
      child: Padding(
        padding: const EdgeInsets.only(left: 24, top: 16, right: 8, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.dog.dogName, style: _theme.textTheme.titleLarge),
            Text(widget.dog.description,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                style: _theme.textTheme.bodyMedium),
            Spaces.vertical16,
            Text('Almost ${widget.dog.age} years',
                style: _theme.textTheme.labelLarge),
          ],
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _theme = Theme.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [_buildCard(), _buildImage()],
    );
  }
}
