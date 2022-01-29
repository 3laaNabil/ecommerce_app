

class ProductsModel {
  int? id;
  String? name;
  String? title;
  int? categoryId;
  String? description;
  int? price;
  int? discount;
  String? discountType;
  String? currency;
  int? inStock;
  String? avatar;
  double? priceFinal;
  String? priceFinalText;

  ProductsModel(
      {this.id,
        this.name,
        this.title,
        this.categoryId,
        this.description,
        this.price,
        this.discount,
        this.discountType,
        this.currency,
        this.inStock,
        this.avatar,
        this.priceFinal,
        this.priceFinalText});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    title = json['title'];
    categoryId = json['category_id'];
    description = json['description'];
    price = json['price'];
    discount = json['discount'];
    discountType = json['discount_type'];
    currency = json['currency'];
    inStock = json['in_stock'];
    avatar = json['avatar'];
    priceFinal = json['price_final'];
    priceFinalText = json['price_final_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['title'] = this.title;
    data['category_id'] = this.categoryId;
    data['description'] = this.description;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['discount_type'] = this.discountType;
    data['currency'] = this.currency;
    data['in_stock'] = this.inStock;
    data['avatar'] = this.avatar;
    data['price_final'] = this.priceFinal;
    data['price_final_text'] = this.priceFinalText;
    return data;
  }
}

