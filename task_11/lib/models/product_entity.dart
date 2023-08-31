/// Модель продукта.
///
/// Содержит в себе название, цену, категорию и ссылку на изображение.
class ProductEntity {
  /// Название товара.
  final String title;

  /// Цена товара в копейках. Без скидки.
  ///
  /// Подумайте и ответьте на три вопроса:
  /// 1. Почему цена хранится в копейках, а не в рублях?
  /// 2. Почему тип данных цены - [int], а не [double]?
  /// 3. Как можно было реализовать передачу цены иначе?
  ///
  /// Ответы на вопросы разместите тут (они будут проверены при код-ревью):
  ///
  /// [ОТВЕТЫ]
  /// 1. Цена хранится в копейках, потому, что позволяет более точно представить
  /// денежное значение. Избежать ошибок при округлении в мат операциях.
  /// 2. Операции с int выполняют быстрее, точнее и проще.
  /// 3. Можно было использовать decimal (?)
  ///
  final int price;

  /// Категория товара.
  final Category category;

  /// Ссылка на изображение товара.
  final String imageUrl;

  /// Количество товара.
  ///
  /// Может быть описано в граммах [Grams] или в штуках [Quantity].
  final Amount amount;

  /// Скидка на товар.
  ///
  /// Требуется высчитать самостоятельно итоговую цену товара.
  final double sale;

  ProductEntity({
    required this.title,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.amount,
    this.sale = 0,
  });

  double get totalPrice => price / 100;

  double get priceWithSale => price * (1 - sale / 100);

  @override
  String toString() {
    return 'ProductEntity(title: $title, price: $price, category: ${category.name})\n';
  }
}

/// Класс, описывающий количество товара.
sealed class Amount {
  int get value;
}

/// Класс, описывающий количество товара в граммах.
class Grams implements Amount {
  @override
  final int value;

  double get toKilogram => value / 1000;

  Grams(this.value);
}

/// Класс, описывающий количество товара в штуках.
class Quantity implements Amount {
  @override
  final int value;

  Quantity(this.value);
}

/// Категория товара.
enum Category {
  food('Продукты питания'),
  tech('Технологичные товары'),
  care('Уход'),
  drinks('Напитки'),
  wear('Одежда'),
  drugs('Медикаменты');

  final String name;

  const Category(this.name);
}
