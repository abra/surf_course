void main() {
  final articles = '''
1,хлеб,Бородинский,500,5        
2,хлеб,Белый,200,15
3,молоко,Полосатый кот,50,53
4,молоко,Коровка,50,53
5,вода,Апельсин,25,100
6,вода,Бородинский,500,5''';

  final productList = parseString(articles);

  print('Категория: хлеб');
  applyFilter(productList, CategoryBreadFilter());

  print('Цена ниже или равно 500:');
  applyFilter(productList, PriceLessOrEqual500Filter());

  print('Оставшееся кол-во меньше 50:');
  applyFilter(productList, AmountLessThan50Filter());
}

void applyFilter(List<Product> products, Filter<Product> filter) {
  products.where(filter.apply).forEach(print);
}

List<Product> parseString(String products) {
  try {
    final list = products
        .split('\n')
        .map((e) => e.trim().split(','))
        .map(
          (e) => Product(
            int.parse(e[0]),
            e[1],
            e[2],
            double.parse(e[3]),
            int.parse(e[4]),
          ),
        )
        .toList();

    return list;
  } catch (e) {
    throw Exception('Ошибка! Неправильный формат данных: $e');
  }
}

class Product {
  final int id;
  final String category;
  final String name;
  final double price;
  final int qty;

  Product(
    this.id,
    this.category,
    this.name,
    this.price,
    this.qty,
  );

  @override
  String toString() {
    return '$id\t$category\t$name\t$price руб.\t$qty шт.';
  }
}

abstract interface class Filter<T> {
  bool apply(T value);
}

class CategoryBreadFilter implements Filter<Product> {
  @override
  bool apply(Product product) {
    return product.category == 'хлеб';
  }
}

class CategoryWaterFilter implements Filter<Product> {
  @override
  bool apply(Product product) {
    return product.category == 'вода';
  }
}

class PriceLessOrEqual500Filter implements Filter<Product> {
  @override
  bool apply(Product product) {
    return product.price <= 500;
  }
}

class AmountLessThan50Filter implements Filter<Product> {
  @override
  bool apply(Product product) {
    return product.qty < 50;
  }
}
