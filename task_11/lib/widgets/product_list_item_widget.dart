import 'package:flutter/material.dart';

import '../common/colors.dart';
import '../common/convertor.dart';
import '../models/product_entity.dart';

class ProductListItemWidget extends StatelessWidget {
  ProductListItemWidget(
    this.productEntity, {
    super.key,
  });

  final ProductEntity productEntity;
  final _mapper = Convertor();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        InkWell(
          onTap: () {},
          child: SizedBox(
            height: 68,
            child: Row(
              children: [
                SizedBox(
                  height: 68,
                  width: 68,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      productEntity.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return SizedBox(
                          height: 68,
                          width: 68,
                          child: Center(
                            child: Image.asset(
                              'assets/images/placeholder.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productEntity.title,
                        style: const TextStyle(
                          fontSize: 12,
                          color: darkBlue,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              left: 0,
                              bottom: 0,
                              child: Text(
                                _mapper.amountAsString(productEntity),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: darkBlue,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Row(
                                children: [
                                  if (productEntity.sale > 0)
                                    Text(
                                      _mapper.totalPriceAsString(
                                        productEntity.price,
                                      ),
                                      style: const TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        decorationColor: lightGrey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: lightGrey,
                                      ),
                                    ),
                                  const SizedBox(width: 10),
                                  Text(
                                    _mapper.totalPriceWithSaleAsString(
                                        productEntity),
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: (productEntity.sale > 0)
                                          ? Colors.red
                                          : darkBlue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
