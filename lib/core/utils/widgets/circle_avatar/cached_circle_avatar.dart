import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CachedCircleAvatar extends StatelessWidget {
  final double radius;
  final String imageUrl;

  const CachedCircleAvatar({
    Key? key,
    required this.radius,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => CircleAvatar(
        radius: radius,
        backgroundImage: imageProvider,
      ),
      placeholder: (context, url) => CircleAvatar(
        radius: radius,
        backgroundColor: Colors.grey[300], // Placeholder color
      ),
      errorWidget: (context, url, error) => CircleAvatar(
        radius: radius,
        backgroundColor: Colors.grey[300], // Error placeholder color
        // You can also add an error icon here if you prefer
      ),
      fadeInDuration:
          Duration(milliseconds: 300), // Adjust fade-in duration as needed
    );
  }
}
