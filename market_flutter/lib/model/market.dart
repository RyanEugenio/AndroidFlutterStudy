
class Market {

  int? id;
  String? nameProduct;
  String? valueProduct;
  String? quantityProduct;
  String? categoryProduct;

  Market({this.id, this.nameProduct, this.valueProduct, this.quantityProduct, this.categoryProduct});

  Market.fromMap(Map<String, dynamic> map) {
    this.id = map['id_column'];
    this.nameProduct = map['nameProduct_column'];
    this.valueProduct = map['valueProduct_column'];
    this.quantityProduct = map['quantityProduct_column'];
    this.categoryProduct = map['categoryProduct_column'];
  }

  Map<String, Object?> toMap() {
    Map<String, Object?> map = {
      "nameProduct_column" : this.nameProduct,
      "valueProduct_column" : this.valueProduct,
      "quantityProduct_column" : this.quantityProduct,
      "categoryProduct_column" : this.categoryProduct,
    };
    if(id != null) {
      map['id_column'] = this.id;
    }
    return map;
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Market{id: $id, name: $nameProduct, value: $valueProduct, quantity: $quantityProduct, category: $categoryProduct}';
  }
}