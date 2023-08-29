import 'package:flutter/material.dart';

import '../common/colors.dart';

class ProductListSummaryWidget extends StatelessWidget {
  const ProductListSummaryWidget({
    super.key,
    required this.productQuantity,
    required this.totalPrice,
    required this.salePrice,
    required this.salePercentage,
    required this.totalPriceWithSale,
  });

  final int productQuantity;
  final String totalPrice;
  final String salePrice;
  final String salePercentage;
  final String totalPriceWithSale;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'В вашей покупке',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: darkBlue,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$productQuantity тов.',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: darkBlue,
              ),
            ),
            Text(
              '$totalPrice',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: darkBlue,
              ),
            ),
          ],
        ),
        const SizedBox(height: 11),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Скидка $salePercentage',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: darkBlue,
              ),
            ),
            Text(
              '-$salePrice',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: darkBlue,
              ),
            ),
          ],
        ),
        const SizedBox(height: 11),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Итого',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: darkBlue,
              ),
            ),
            Text(
              '$totalPriceWithSale',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: darkBlue,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
