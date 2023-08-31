import '../models/product_entity.dart';

class Receipt {
  static final products = <ProductEntity>[
    ProductEntity(
      title: 'Арбуз',
      price: 120000,
      category: Category.food,
      imageUrl:
          'https://images.unsplash.com/photo-1589984662646-e7b2e4962f18?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80',
      amount: Grams(1000),
      sale: 50,
    ),
    ProductEntity(
      title: 'Натуральные валенки',
      price: 399999,
      category: Category.wear,
      imageUrl:
          'https://main-cdn.sbermegamarket.ru/big1/hlr-system/-57/870/959/442/219/25/600006696270b0.jpeg',
      amount: Quantity(1),
    ),
    ProductEntity(
      title: 'Массажер для головы',
      price: 10700,
      category: Category.tech,
      imageUrl: 'https://medtehnika-samara.ru/images/detailed/3/murashka.jpg',
      amount: Quantity(1),
    ),
    ProductEntity(
      title: 'Sprite',
      price: 6500,
      category: Category.drinks,
      amount: Quantity(1),
      imageUrl:
          'https://mosnapitki.ru/images/cms/thumbs/9799c8258567b66fc1873aa4697de592b97d61ed/cocacola132_1__535_535_1_100.webp',
    ),
    ProductEntity(
      title: 'Дыня',
      price: 140000,
      category: Category.food,
      amount: Grams(2000),
      imageUrl:
          'https://images.unsplash.com/photo-1598025362874-49480e049c76?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bWVsb258ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
    ),
    ProductEntity(
      title: 'Телевизор',
      price: 2100000,
      category: Category.tech,
      amount: Quantity(1),
      imageUrl:
          'https://images.unsplash.com/photo-1509281373149-e957c6296406?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1328&q=80',
      sale: 45.5,
    ),
    ProductEntity(
      title: 'Миксер',
      price: 250000,
      category: Category.tech,
      amount: Quantity(1),
      imageUrl:
          'https://images.unsplash.com/photo-1578643463396-0997cb5328c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bWl4ZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
    ),
    ProductEntity(
      title: 'Крем для загара',
      price: 90000,
      category: Category.care,
      amount: Quantity(1),
      imageUrl:
          'https://images.unsplash.com/photo-1521223344201-d169129f7b7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1335&q=80',
    ),
    ProductEntity(
      title: 'Крем защитный',
      price: 1900,
      category: Category.care,
      amount: Quantity(1),
      imageUrl:
          'https://images.unsplash.com/photo-1611080541599-8c6dbde6ed28?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80',
    ),
    ProductEntity(
      title: 'Pebsi',
      price: 9000,
      category: Category.drinks,
      amount: Quantity(1),
      imageUrl:
          'https://images.unsplash.com/photo-1567671899076-51a64ddb7c5d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Ymx1ZSUyMGRyaW5rfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
    ),
    ProductEntity(
      title: 'Shpryte',
      price: 10200,
      category: Category.drinks,
      amount: Quantity(1),
      imageUrl:
          'https://images.unsplash.com/photo-1541807120430-f3f78c281225?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Z3JlZW4lMjBkcmlua3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
    ),
    ProductEntity(
      title: 'Аспирин',
      price: 1500,
      amount: Quantity(1),
      category: Category.drugs,
      imageUrl:
          'https://images.unsplash.com/photo-1626716493137-b67fe9501e76?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YXNwaXJpbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
    ),
    ProductEntity(
      title: 'Ибупрофен',
      price: 5400,
      category: Category.drugs,
      amount: Quantity(1),
      imageUrl:
          'https://images.unsplash.com/photo-1550572017-edd951b55104?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aWJ1cHJvZmVufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
    ),
    ProductEntity(
      title: 'Яблоко',
      price: 10000,
      category: Category.food,
      imageUrl:
          'https://magnit.katalog-ceny.ru/image/cache/catalog/magnit/ovoshi-i-frukti/yabloki-gala-1kg-500x500.jpg',
      amount: Grams(200),
    ),
    ProductEntity(
      title: 'Груша',
      price: 8000,
      category: Category.food,
      imageUrl:
          'https://dostavka.magnit.ru/resize/420x420/uf/e79/e794f97145758776d50a00a5df2bc22e/494b222cd4a935d867ef05a122b61040.png',
      amount: Grams(150),
    ),
    ProductEntity(
      title: 'Мандарин',
      price: 12000,
      category: Category.food,
      imageUrl:
          'https://www.retail.ru/upload/medialibrary/03b/oranges_2100108_1280.jpg',
      amount: Grams(250),
    ),
    ProductEntity(
      title: 'Киви',
      price: 15000,
      category: Category.food,
      imageUrl: 'https://www.magazinnoff.ru/images/tovary/90000.webp',
      amount: Grams(100),
    ),
    ProductEntity(
      title: 'Монитор',
      price: 1500000,
      category: Category.tech,
      imageUrl:
          'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bW9uaXRvcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
      amount: Quantity(1),
    ),
    ProductEntity(
      title: 'Клавиатура',
      price: 300000,
      category: Category.tech,
      imageUrl: 'https://ir.ozone.ru/s3/multimedia-3/c1000/6129788571.jpg',
      amount: Quantity(1),
    ),
    ProductEntity(
      title: 'Мыло Хозяйственное Весна',
      price: 8000,
      category: Category.care,
      imageUrl: 'https://img1.almin.ru/upload/iblock/004/p_51044.jpg',
      amount: Quantity(1),
      sale: 20,
    ),
    ProductEntity(
      title: 'Шампунь',
      price: 25000,
      category: Category.care,
      imageUrl: 'https://storum.ru/image/products/371545.jpg',
      amount: Quantity(1),
    ),
    ProductEntity(
      title: 'Fanta',
      price: 6000,
      category: Category.drinks,
      imageUrl:
          'https://main-cdn.sbermegamarket.ru/big1/hlr-system/225/262/548/291/220/100037313233b0.jpg',
      amount: Quantity(1),
    ),
  ];
}
