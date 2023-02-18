> Instead of mutating or copying an object, you can use `copyWith()` _to create a new object with the same properties as the original_, but with some of the values changed.

```dart
Text(
  "I'm using a custom title",
  style: Theme.of(context)
              .textTheme
              .headline
              .copyWith(
                color: Colors.red, 
                fontWeight: FontWeight.bold),
)
```

Here we're copying the `headline` theme and overriding some values such as `color` and `fontWeight`.  

As this is a copy, the original `theme` is not affected and the _other values remain unchanged_.

# Implemintation

You can make your own `copyWith` function by taking in the values you want to change and **_returning a new object_** with the new values.

Here's an example with a Product class:

```dart
class Product {
  final String id;
  final String name;
  final Color color;

  Product({this.id, this.color, this.name});

  Product copyWith({String id, String name, Color color}) => Product(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color ?? this.color,
      );
}
```

Within the `copyWith` function we're taking in the potential overrides such as `id`, name and `color`.   
We're then returning a new `Product` with either the current values, or replacing those values with the ones passed in.

# Usage

We can use this to display a list of our dining room tables that we have for sale. They both have the same name, but have a different id and color:
```dart
class _HomePageState extends State<HomePage> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();

    Product sixSeaterDiningTableBrown = Product(
      id: "0",
      name: "6 Seater Dining Table",
      color: Colors.brown,
    );

    Product sixSeaterDiningTableBlack =
        sixSeaterDiningTableBrown.copyWith(color: Colors.black, id: "1");

    products.add(sixSeaterDiningTableBrown);
    products.add(sixSeaterDiningTableBlack);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello, copyWith!"),
      ),
      body: ListView(
          children: products
              .map((Product product) => ListTile(
                    trailing: Container(
                      width: 14,
                      height: 14,
                      color: product.color,
                    ),
                    title: Text(product.name),
                    subtitle: Text(product.id),
                  ),
                )
              .toList(),
            ),
    );
  }
}
```
In this instance, we have two items visible in the `ListView`. The first item is the `sixSeaterDiningTableBrown` and the second is the `sixSeaterDiningTableBlack`.  

The `id` and color are `different`, but the `name` is the same.   
We used the immutable `copyWith` function to create the sixSeaterDiningTableBlack **_instead of directly copying the sixSeaterDiningTableBrown_**.

Although this is a small example, you can see how this pattern can be used to work with data in larger applications.
