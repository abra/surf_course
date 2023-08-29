import '../models/product_entity.dart';
import 'sort_type.dart';

abstract interface class ProductSort<T> {
  List<T> apply(List<T> products);
}

class Unsorted implements ProductSort<ProductEntity> {
  @override
  List<ProductEntity> apply(List<ProductEntity> products) {
    return products;
  }
}

class SortTitle implements ProductSort<ProductEntity> {
  SortTitle(this.sortType);

  final SortType sortType;

  @override
  List<ProductEntity> apply(List<ProductEntity> products) {
    if (sortType == SortType.ascendingTitle) {
      products.sort((a, b) => a.title.compareTo(b.title));
    } else if (sortType == SortType.descendingTitle) {
      products.sort((a, b) => b.title.compareTo(a.title));
    } else {
      throw Exception('Wrong sort type!');
    }
    return products;
  }
}

class SortPrice implements ProductSort<ProductEntity> {
  SortPrice(this.sortType);

  final SortType sortType;

  @override
  List<ProductEntity> apply(List<ProductEntity> products) {
    if (sortType == SortType.ascendingPrice) {
      products.sort((a, b) => a.priceWithSale.compareTo(b.priceWithSale));
    } else if (sortType == SortType.descendingPrice) {
      products.sort((a, b) => b.priceWithSale.compareTo(a.priceWithSale));
    } else {
      throw Exception('Wrong sort type!');
    }
    return products;
  }
}

class SortCategory implements ProductSort<ProductEntity> {
  SortCategory(this.sortType);

  final SortType sortType;

  @override
  List<ProductEntity> apply(List<ProductEntity> products) {
    if (sortType == SortType.ascendingCategory) {
      products.sort((a, b) => a.category.name.compareTo(b.category.name));
    } else if (sortType == SortType.descendingCategory) {
      products.sort((a, b) => b.category.name.compareTo(a.category.name));
    } else {
      throw Exception('Wrong sort type!');
    }
    return products;
  }
}
