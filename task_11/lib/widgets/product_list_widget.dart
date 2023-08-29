import 'package:flutter/material.dart';

import '../common/colors.dart';
import '../common/convertor.dart';
import '../common/product_sort.dart';
import '../common/sort_type.dart';
import '../models/product_entity.dart';
import 'product_list_item_widget.dart';
import 'product_list_summary_widget.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({
    super.key,
    required this.products,
    required this.sortType,
  });

  final List<ProductEntity> products;
  final SortType sortType;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future<List<ProductEntity>>.delayed(
        // Имитируем загрузку
        const Duration(milliseconds: 700),
        () => products,
      ),
      builder: (ctx, AsyncSnapshot<List<ProductEntity>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          /// Сортируем список продуктов по типу сортировки
          final sorted = _productSort(sortType).apply(snapshot.data!);

          _buildSummaryWidget(sorted);

          if (sortType == SortType.ascendingCategory ||
              sortType == SortType.descendingCategory) {
            return _buildListViewByCategory(sorted);
          } else {
            return _buildListView(sorted);
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  /// Выводим список по категориям
  Widget _buildListViewByCategory(List<ProductEntity> sorted) {
    final List<ListItem> list = [];

    final Map<String, List<ProductEntity>> map = sorted.fold({}, (map, e) {
      if (map.containsKey(e.category.name)) {
        map[e.category.name]!.add(e);
      } else {
        map[e.category.name] = [e];
      }
      return map;
    });

    map.forEach((key, value) {
      list.add(ProductCategoryTitleItem(key));
      list.addAll(value.map((e) => ProductItem(e)));
      list.add(ProductCategoryDivider());
    });

    return ListView.builder(
      itemCount: list.length + 1,
      itemBuilder: (context, index) {
        if (index == list.length) {
          // return ProductListSummaryWidget(sorted);
          return _buildSummaryWidget(sorted);
        } else {
          return list[index].buildItem(context);
        }
      },
    );
  }

  /// Выводим список без категорий
  Widget _buildListView(List<ProductEntity> sorted) {
    return ListView.builder(
      itemCount: sorted.length + 1,
      itemBuilder: (context, index) {
        if (index == sorted.length) {
          return Column(
            children: [
              const Divider(),
              // ProductListSummaryWidget(sorted),
              _buildSummaryWidget(sorted),
            ],
          );
        } else {
          return ProductListItemWidget(sorted[index]);
        }
      },
    );
  }

  Widget _buildSummaryWidget(List<ProductEntity> products) {
    //
    final int totalPrice = products.fold(
      0,
      (previousValue, element) => previousValue + element.price,
    );
    final totalPriceWithSale = products.fold(
      0.0,
      (previousValue, element) => previousValue + element.priceWithSale,
    );

    final int salePrice = totalPrice - totalPriceWithSale.toInt();

    final double salePercentage = (1 - totalPriceWithSale / totalPrice) * 100;

    String totalPriceAsString = Convertor().totalPriceAsString(totalPrice);
    String totalPriceWithSaleAsString =
        Convertor().totalPriceAsString(totalPriceWithSale.toInt());
    String salePriceAsString = Convertor().totalPriceAsString(salePrice);
    String salePercentageAsString = '${salePercentage.toStringAsFixed(2)}%';

    return ProductListSummaryWidget(
      productQuantity: products.length,
      totalPrice: totalPriceAsString,
      salePrice: salePriceAsString,
      salePercentage: salePercentageAsString,
      totalPriceWithSale: totalPriceWithSaleAsString,
    );
  }

  ProductSort<ProductEntity> _productSort(SortType sortType) {
    switch (sortType) {
      case SortType.ascendingTitle:
        return SortTitle(sortType);
      case SortType.descendingTitle:
        return SortTitle(sortType);
      case SortType.ascendingPrice:
        return SortPrice(sortType);
      case SortType.descendingPrice:
        return SortPrice(sortType);
      case SortType.ascendingCategory:
        return SortCategory(sortType);
      case SortType.descendingCategory:
        return SortCategory(sortType);
      default:
        return Unsorted();
    }
  }
}

abstract interface class ListItem {
  Widget buildItem(BuildContext context);
}

class ProductCategoryTitleItem implements ListItem {
  ProductCategoryTitleItem(this.title);

  final String title;

  @override
  Widget buildItem(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(
            color: darkBlue,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  @override
  String toString() {
    return '$runtimeType(title: $title)';
  }
}

class ProductCategoryDivider implements ListItem {
  @override
  Widget buildItem(BuildContext context) {
    return const Divider();
  }
}

class ProductItem implements ListItem {
  ProductItem(this.productEntity);

  final ProductEntity productEntity;

  @override
  Widget buildItem(BuildContext context) {
    return ProductListItemWidget(productEntity);
  }

  @override
  String toString() {
    return '$runtimeType(title: ${productEntity.title}, ${productEntity.category.name})';
  }
}
