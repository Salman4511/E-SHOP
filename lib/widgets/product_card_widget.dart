import 'package:flutter/material.dart';

import '../utils/constants.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final double actualPrice;
  final double offerPrice;
  final double offerPercent;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.actualPrice,
    required this.offerPrice,
    required this.offerPercent,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15.0)),
            child: Image.network(
              imageUrl,
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                  width: 100,
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: ktextstyle5
                  ),
                ),
                const SizedBox(height: 4),
                SizedBox(
                  height: 38,
                  width: 180,
                  child: Text(
                    description,
                    style: const TextStyle(fontSize: 14),
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        '\$$actualPrice',
                        style: ktextstyle6,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        '\$$offerPrice',
                        style: ktextstyle7,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        '$offerPercent% off',
                        style: ktextstyle8,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
