import '../models/product_entity.dart';

class Convertor {
  double totalPrice(ProductEntity productEntity) {
    return productEntity.price / 100;
  }

  double priceWithSale(ProductEntity productEntity) {
    return totalPrice(productEntity) * (1 - productEntity.sale / 100);
  }

  double salePrice(ProductEntity productEntity) {
    return 1 - productEntity.sale / 100;
  }

  String amountAsString(ProductEntity productEntity) {
    if (productEntity.amount is Grams) {
      return productEntity.amount.value >= 1000
          ? '${productEntity.amount.value / 1000} кг'
          : '${productEntity.amount.value} г';
    } else if (productEntity.amount is Quantity) {
      return '${productEntity.amount.value} шт';
    }
    return '';
  }

  String totalPriceAsString(int price) {
    final integer = price ~/ 100;
    final decimal = price % 100;
    final integerString = integer.toString();
    final decimalString = decimal.toInt().toString().padLeft(2, '0');
    if (decimal == 0) {
      return '$integerString руб';
    } else {
      return '$integerString руб $decimalString коп';
    }
  }

  String totalPriceWithSaleAsString(ProductEntity productEntity) {
    final salePrice = productEntity.price * (1 - productEntity.sale / 100);
    final integer = salePrice ~/ 100;
    final decimal = salePrice % 100;
    final integerString = integer.toString();
    final decimalString = decimal.toInt().toString().padLeft(2, '0');
    if (decimal == 0) {
      return '$integerString руб';
    } else {
      return '$integerString руб $decimalString коп';
    }
  }
}
