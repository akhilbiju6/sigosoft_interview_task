

class ProductResponse {
  final bool? status;
  final ProductData? data;
  final String? message;

  ProductResponse({this.status, this.data, this.message});

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      status: json['status'] as bool?,
      data: json['data'] != null ? ProductData.fromJson(json['data']) : null,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data?.toJson(),
      'message': message,
    };
  }
}

class ProductData {
  final Product? product;
  final List<RelatedProduct>? related;

  ProductData({this.product, this.related});

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      product: json['product'] != null ? Product.fromJson(json['product']) : null,
      related: json['related'] != null
          ? (json['related'] as List)
              .map((item) => RelatedProduct.fromJson(item))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': product?.toJson(),
      'related': related?.map((item) => item.toJson()).toList(),
    };
  }
}

class Product {
  final int? id;
  final String? name;
  final String? price;
  final String? image;
  final String? description;
  final String? storageInstructions;
  final int? serves;
  final int? categoryId;
  final String? stock;
  final List<CuttingType>? cuttingTypes;

  Product({
    this.id,
    this.name,
    this.price,
    this.image,
    this.description,
    this.storageInstructions,
    this.serves,
    this.categoryId,
    this.stock,
    this.cuttingTypes,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int?,
      name: json['name'] as String?,
      price: json['price'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      storageInstructions: json['storage_instructions'] as String?,
      serves: json['serves'] as int?,
      categoryId: json['category_id'] as int?,
      stock: json['stock'] as String?,
      cuttingTypes: json['cutting_types'] != null
          ? (json['cutting_types'] as List)
              .map((item) => CuttingType.fromJson(item))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'image': image,
      'description': description,
      'storage_instructions': storageInstructions,
      'serves': serves,
      'category_id': categoryId,
      'stock': stock,
      'cutting_types': cuttingTypes?.map((item) => item.toJson()).toList(),
    };
  }
}

class CuttingType {
  final int? id;
  final int? productId;
  final int? cuttingTypeId;
  final String? type;
  final String? cuttingImage;
  final String? netWeight;
  final String? grossWeight;
  final String? originalPrice;
  final String? offerPrice;
  final String? offerPercentage;

  CuttingType({
    this.id,
    this.productId,
    this.cuttingTypeId,
    this.type,
    this.cuttingImage,
    this.netWeight,
    this.grossWeight,
    this.originalPrice,
    this.offerPrice,
    this.offerPercentage,
  });

  factory CuttingType.fromJson(Map<String, dynamic> json) {
    return CuttingType(
      id: json['id'] as int?,
      productId: json['product_id'] as int?,
      cuttingTypeId: json['cutting_type_id'] as int?,
      type: json['type'] as String?,
      cuttingImage: json['cutting_image'] as String?,
      netWeight: json['net_weight'] as String?,
      grossWeight: json['gross_weight'] as String?,
      originalPrice: json['original_price'] as String?,
      offerPrice: json['offer_price'] as String?,
      offerPercentage: json['offer_percentage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'cutting_type_id': cuttingTypeId,
      'type': type,
      'cutting_image': cuttingImage,
      'net_weight': netWeight,
      'gross_weight': grossWeight,
      'original_price': originalPrice,
      'offer_price': offerPrice,
      'offer_percentage': offerPercentage,
    };
  }
}

class RelatedProduct {
  final int? id;
  final String? productName;
  final String? productImage;
  final int? cuttingTypeId;
  final String? type;
  final String? cuttingImage;
  final String? netWeight;
  final String? grossWeight;
  final String? originalPrice;
  final String? offerPrice;
  final String? offerPercentage;
  final String? stock;
  final int? categoryId;

  RelatedProduct({
    this.id,
    this.productName,
    this.productImage,
    this.cuttingTypeId,
    this.type,
    this.cuttingImage,
    this.netWeight,
    this.grossWeight,
    this.originalPrice,
    this.offerPrice,
    this.offerPercentage,
    this.stock,
    this.categoryId,
  });

  factory RelatedProduct.fromJson(Map<String, dynamic> json) {
    return RelatedProduct(
      id: json['id'] as int?,
      productName: json['product_name'] as String?,
      productImage: json['product_image'] as String?,
      cuttingTypeId: json['cutting_type_id'] as int?,
      type: json['type'] as String?,
      cuttingImage: json['cutting_image'] as String?,
      netWeight: json['net_weight'] as String?,
      grossWeight: json['gross_weight'] as String?,
      originalPrice: json['original_price'] as String?,
      offerPrice: json['offer_price'] as String?,
      offerPercentage: json['offer_percentage'] as String?,
      stock: json['stock'] as String?,
      categoryId: json['category_id'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_name': productName,
      'product_image': productImage,
      'cutting_type_id': cuttingTypeId,
      'type': type,
      'cutting_image': cuttingImage,
      'net_weight': netWeight,
      'gross_weight': grossWeight,
      'original_price': originalPrice,
      'offer_price': offerPrice,
      'offer_percentage': offerPercentage,
      'stock': stock,
      'category_id': categoryId,
    };
  }
}
