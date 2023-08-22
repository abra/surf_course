void main() {
  final articles = '''
1,хлеб,Бородинский,500,5        
2,хлеб,Белый,200,15
3,молоко,Полосатый кот,50,53
4,молоко,Коровка,50,53
5,вода,Апельсин,25,100
6,вода,Бородинский,500,5''';

  final productList = parseString(articles);

  print('Категория: хлеб, вода');
  applyFilter(productList, CategoryFilter(categories: ['хлеб', 'вода']));

  print('Цена ниже или равно 500:');
  applyFilter(productList, PriceFilter((price) => price <= 500));

  print('Оставшееся кол-во меньше 50:');
  applyFilter(productList, AmountFilter((amount) => amount < 50));
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

class CategoryFilter implements Filter<Product> {
  CategoryFilter({required List<String> categories}) : _categories = categories;

  final List<String> _categories;

  @override
  bool apply(Product product) {
    return _categories.contains(product.category);
  }
}

class PriceFilter implements Filter<Product> {
  PriceFilter(Function(double) callback) : _callback = callback;

  final Function(double) _callback;

  @override
  bool apply(Product product) {
    return _callback(product.price);
  }
}

class AmountFilter implements Filter<Product> {
  AmountFilter(Function(int) callback) : _callback = callback;

  final Function(int) _callback;

  @override
  bool apply(Product product) {
    return _callback(product.qty);
  }
}
