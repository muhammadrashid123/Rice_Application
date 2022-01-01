class CatalogModel {
  static List<Item> items = [
    Item(
      id: 1,
      name: "Super Rice",
      desc: "Pakistan Super Kernel Basmati white Rice",
      price: "169",
      image:
          "https://timenlife.com/image/cache/catalog/Images/Kasuri%20Methi/Cereals/FamilyGoldSuperBasmati-612x401.jpg",
    )
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final String price;
  final String image;

  Item({this.id, this.name, this.desc, this.price, this.image});
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      image: map["image"],
    );
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "image": image,
      };
}
