// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_database.dart';

// ignore_for_file: type=lint
class $ProductsTable extends Products
    with TableInfo<$ProductsTable, StoredProduct> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _discountPercentageMeta =
      const VerificationMeta('discountPercentage');
  @override
  late final GeneratedColumn<double> discountPercentage =
      GeneratedColumn<double>(
        'discount_percentage',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
        defaultValue: const Constant(0),
      );
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
    'rating',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _stockMeta = const VerificationMeta('stock');
  @override
  late final GeneratedColumn<int> stock = GeneratedColumn<int>(
    'stock',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _brandMeta = const VerificationMeta('brand');
  @override
  late final GeneratedColumn<String> brand = GeneratedColumn<String>(
    'brand',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _skuMeta = const VerificationMeta('sku');
  @override
  late final GeneratedColumn<String> sku = GeneratedColumn<String>(
    'sku',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _thumbnailMeta = const VerificationMeta(
    'thumbnail',
  );
  @override
  late final GeneratedColumn<String> thumbnail = GeneratedColumn<String>(
    'thumbnail',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _availabilityStatusMeta =
      const VerificationMeta('availabilityStatus');
  @override
  late final GeneratedColumn<String> availabilityStatus =
      GeneratedColumn<String>(
        'availability_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant(''),
      );
  static const VerificationMeta _warrantyInformationMeta =
      const VerificationMeta('warrantyInformation');
  @override
  late final GeneratedColumn<String> warrantyInformation =
      GeneratedColumn<String>(
        'warranty_information',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant(''),
      );
  static const VerificationMeta _shippingInformationMeta =
      const VerificationMeta('shippingInformation');
  @override
  late final GeneratedColumn<String> shippingInformation =
      GeneratedColumn<String>(
        'shipping_information',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant(''),
      );
  static const VerificationMeta _returnPolicyMeta = const VerificationMeta(
    'returnPolicy',
  );
  @override
  late final GeneratedColumn<String> returnPolicy = GeneratedColumn<String>(
    'return_policy',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    description,
    category,
    price,
    discountPercentage,
    rating,
    stock,
    brand,
    sku,
    thumbnail,
    availabilityStatus,
    warrantyInformation,
    shippingInformation,
    returnPolicy,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(
    Insertable<StoredProduct> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('discount_percentage')) {
      context.handle(
        _discountPercentageMeta,
        discountPercentage.isAcceptableOrUnknown(
          data['discount_percentage']!,
          _discountPercentageMeta,
        ),
      );
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    }
    if (data.containsKey('stock')) {
      context.handle(
        _stockMeta,
        stock.isAcceptableOrUnknown(data['stock']!, _stockMeta),
      );
    }
    if (data.containsKey('brand')) {
      context.handle(
        _brandMeta,
        brand.isAcceptableOrUnknown(data['brand']!, _brandMeta),
      );
    }
    if (data.containsKey('sku')) {
      context.handle(
        _skuMeta,
        sku.isAcceptableOrUnknown(data['sku']!, _skuMeta),
      );
    }
    if (data.containsKey('thumbnail')) {
      context.handle(
        _thumbnailMeta,
        thumbnail.isAcceptableOrUnknown(data['thumbnail']!, _thumbnailMeta),
      );
    }
    if (data.containsKey('availability_status')) {
      context.handle(
        _availabilityStatusMeta,
        availabilityStatus.isAcceptableOrUnknown(
          data['availability_status']!,
          _availabilityStatusMeta,
        ),
      );
    }
    if (data.containsKey('warranty_information')) {
      context.handle(
        _warrantyInformationMeta,
        warrantyInformation.isAcceptableOrUnknown(
          data['warranty_information']!,
          _warrantyInformationMeta,
        ),
      );
    }
    if (data.containsKey('shipping_information')) {
      context.handle(
        _shippingInformationMeta,
        shippingInformation.isAcceptableOrUnknown(
          data['shipping_information']!,
          _shippingInformationMeta,
        ),
      );
    }
    if (data.containsKey('return_policy')) {
      context.handle(
        _returnPolicyMeta,
        returnPolicy.isAcceptableOrUnknown(
          data['return_policy']!,
          _returnPolicyMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StoredProduct map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StoredProduct(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      )!,
      discountPercentage: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}discount_percentage'],
      )!,
      rating: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rating'],
      )!,
      stock: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stock'],
      )!,
      brand: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}brand'],
      ),
      sku: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sku'],
      )!,
      thumbnail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}thumbnail'],
      )!,
      availabilityStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}availability_status'],
      )!,
      warrantyInformation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}warranty_information'],
      )!,
      shippingInformation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}shipping_information'],
      )!,
      returnPolicy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}return_policy'],
      )!,
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class StoredProduct extends DataClass implements Insertable<StoredProduct> {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String? brand;
  final String sku;
  final String thumbnail;
  final String availabilityStatus;
  final String warrantyInformation;
  final String shippingInformation;
  final String returnPolicy;
  const StoredProduct({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    this.brand,
    required this.sku,
    required this.thumbnail,
    required this.availabilityStatus,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.returnPolicy,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['category'] = Variable<String>(category);
    map['price'] = Variable<double>(price);
    map['discount_percentage'] = Variable<double>(discountPercentage);
    map['rating'] = Variable<double>(rating);
    map['stock'] = Variable<int>(stock);
    if (!nullToAbsent || brand != null) {
      map['brand'] = Variable<String>(brand);
    }
    map['sku'] = Variable<String>(sku);
    map['thumbnail'] = Variable<String>(thumbnail);
    map['availability_status'] = Variable<String>(availabilityStatus);
    map['warranty_information'] = Variable<String>(warrantyInformation);
    map['shipping_information'] = Variable<String>(shippingInformation);
    map['return_policy'] = Variable<String>(returnPolicy);
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      category: Value(category),
      price: Value(price),
      discountPercentage: Value(discountPercentage),
      rating: Value(rating),
      stock: Value(stock),
      brand: brand == null && nullToAbsent
          ? const Value.absent()
          : Value(brand),
      sku: Value(sku),
      thumbnail: Value(thumbnail),
      availabilityStatus: Value(availabilityStatus),
      warrantyInformation: Value(warrantyInformation),
      shippingInformation: Value(shippingInformation),
      returnPolicy: Value(returnPolicy),
    );
  }

  factory StoredProduct.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StoredProduct(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      category: serializer.fromJson<String>(json['category']),
      price: serializer.fromJson<double>(json['price']),
      discountPercentage: serializer.fromJson<double>(
        json['discountPercentage'],
      ),
      rating: serializer.fromJson<double>(json['rating']),
      stock: serializer.fromJson<int>(json['stock']),
      brand: serializer.fromJson<String?>(json['brand']),
      sku: serializer.fromJson<String>(json['sku']),
      thumbnail: serializer.fromJson<String>(json['thumbnail']),
      availabilityStatus: serializer.fromJson<String>(
        json['availabilityStatus'],
      ),
      warrantyInformation: serializer.fromJson<String>(
        json['warrantyInformation'],
      ),
      shippingInformation: serializer.fromJson<String>(
        json['shippingInformation'],
      ),
      returnPolicy: serializer.fromJson<String>(json['returnPolicy']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'category': serializer.toJson<String>(category),
      'price': serializer.toJson<double>(price),
      'discountPercentage': serializer.toJson<double>(discountPercentage),
      'rating': serializer.toJson<double>(rating),
      'stock': serializer.toJson<int>(stock),
      'brand': serializer.toJson<String?>(brand),
      'sku': serializer.toJson<String>(sku),
      'thumbnail': serializer.toJson<String>(thumbnail),
      'availabilityStatus': serializer.toJson<String>(availabilityStatus),
      'warrantyInformation': serializer.toJson<String>(warrantyInformation),
      'shippingInformation': serializer.toJson<String>(shippingInformation),
      'returnPolicy': serializer.toJson<String>(returnPolicy),
    };
  }

  StoredProduct copyWith({
    int? id,
    String? title,
    String? description,
    String? category,
    double? price,
    double? discountPercentage,
    double? rating,
    int? stock,
    Value<String?> brand = const Value.absent(),
    String? sku,
    String? thumbnail,
    String? availabilityStatus,
    String? warrantyInformation,
    String? shippingInformation,
    String? returnPolicy,
  }) => StoredProduct(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    category: category ?? this.category,
    price: price ?? this.price,
    discountPercentage: discountPercentage ?? this.discountPercentage,
    rating: rating ?? this.rating,
    stock: stock ?? this.stock,
    brand: brand.present ? brand.value : this.brand,
    sku: sku ?? this.sku,
    thumbnail: thumbnail ?? this.thumbnail,
    availabilityStatus: availabilityStatus ?? this.availabilityStatus,
    warrantyInformation: warrantyInformation ?? this.warrantyInformation,
    shippingInformation: shippingInformation ?? this.shippingInformation,
    returnPolicy: returnPolicy ?? this.returnPolicy,
  );
  StoredProduct copyWithCompanion(ProductsCompanion data) {
    return StoredProduct(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      category: data.category.present ? data.category.value : this.category,
      price: data.price.present ? data.price.value : this.price,
      discountPercentage: data.discountPercentage.present
          ? data.discountPercentage.value
          : this.discountPercentage,
      rating: data.rating.present ? data.rating.value : this.rating,
      stock: data.stock.present ? data.stock.value : this.stock,
      brand: data.brand.present ? data.brand.value : this.brand,
      sku: data.sku.present ? data.sku.value : this.sku,
      thumbnail: data.thumbnail.present ? data.thumbnail.value : this.thumbnail,
      availabilityStatus: data.availabilityStatus.present
          ? data.availabilityStatus.value
          : this.availabilityStatus,
      warrantyInformation: data.warrantyInformation.present
          ? data.warrantyInformation.value
          : this.warrantyInformation,
      shippingInformation: data.shippingInformation.present
          ? data.shippingInformation.value
          : this.shippingInformation,
      returnPolicy: data.returnPolicy.present
          ? data.returnPolicy.value
          : this.returnPolicy,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StoredProduct(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('price: $price, ')
          ..write('discountPercentage: $discountPercentage, ')
          ..write('rating: $rating, ')
          ..write('stock: $stock, ')
          ..write('brand: $brand, ')
          ..write('sku: $sku, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('availabilityStatus: $availabilityStatus, ')
          ..write('warrantyInformation: $warrantyInformation, ')
          ..write('shippingInformation: $shippingInformation, ')
          ..write('returnPolicy: $returnPolicy')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    description,
    category,
    price,
    discountPercentage,
    rating,
    stock,
    brand,
    sku,
    thumbnail,
    availabilityStatus,
    warrantyInformation,
    shippingInformation,
    returnPolicy,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StoredProduct &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.category == this.category &&
          other.price == this.price &&
          other.discountPercentage == this.discountPercentage &&
          other.rating == this.rating &&
          other.stock == this.stock &&
          other.brand == this.brand &&
          other.sku == this.sku &&
          other.thumbnail == this.thumbnail &&
          other.availabilityStatus == this.availabilityStatus &&
          other.warrantyInformation == this.warrantyInformation &&
          other.shippingInformation == this.shippingInformation &&
          other.returnPolicy == this.returnPolicy);
}

class ProductsCompanion extends UpdateCompanion<StoredProduct> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<String> category;
  final Value<double> price;
  final Value<double> discountPercentage;
  final Value<double> rating;
  final Value<int> stock;
  final Value<String?> brand;
  final Value<String> sku;
  final Value<String> thumbnail;
  final Value<String> availabilityStatus;
  final Value<String> warrantyInformation;
  final Value<String> shippingInformation;
  final Value<String> returnPolicy;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.category = const Value.absent(),
    this.price = const Value.absent(),
    this.discountPercentage = const Value.absent(),
    this.rating = const Value.absent(),
    this.stock = const Value.absent(),
    this.brand = const Value.absent(),
    this.sku = const Value.absent(),
    this.thumbnail = const Value.absent(),
    this.availabilityStatus = const Value.absent(),
    this.warrantyInformation = const Value.absent(),
    this.shippingInformation = const Value.absent(),
    this.returnPolicy = const Value.absent(),
  });
  ProductsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.description = const Value.absent(),
    this.category = const Value.absent(),
    required double price,
    this.discountPercentage = const Value.absent(),
    this.rating = const Value.absent(),
    this.stock = const Value.absent(),
    this.brand = const Value.absent(),
    this.sku = const Value.absent(),
    this.thumbnail = const Value.absent(),
    this.availabilityStatus = const Value.absent(),
    this.warrantyInformation = const Value.absent(),
    this.shippingInformation = const Value.absent(),
    this.returnPolicy = const Value.absent(),
  }) : title = Value(title),
       price = Value(price);
  static Insertable<StoredProduct> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? category,
    Expression<double>? price,
    Expression<double>? discountPercentage,
    Expression<double>? rating,
    Expression<int>? stock,
    Expression<String>? brand,
    Expression<String>? sku,
    Expression<String>? thumbnail,
    Expression<String>? availabilityStatus,
    Expression<String>? warrantyInformation,
    Expression<String>? shippingInformation,
    Expression<String>? returnPolicy,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (category != null) 'category': category,
      if (price != null) 'price': price,
      if (discountPercentage != null) 'discount_percentage': discountPercentage,
      if (rating != null) 'rating': rating,
      if (stock != null) 'stock': stock,
      if (brand != null) 'brand': brand,
      if (sku != null) 'sku': sku,
      if (thumbnail != null) 'thumbnail': thumbnail,
      if (availabilityStatus != null) 'availability_status': availabilityStatus,
      if (warrantyInformation != null)
        'warranty_information': warrantyInformation,
      if (shippingInformation != null)
        'shipping_information': shippingInformation,
      if (returnPolicy != null) 'return_policy': returnPolicy,
    });
  }

  ProductsCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? description,
    Value<String>? category,
    Value<double>? price,
    Value<double>? discountPercentage,
    Value<double>? rating,
    Value<int>? stock,
    Value<String?>? brand,
    Value<String>? sku,
    Value<String>? thumbnail,
    Value<String>? availabilityStatus,
    Value<String>? warrantyInformation,
    Value<String>? shippingInformation,
    Value<String>? returnPolicy,
  }) {
    return ProductsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      price: price ?? this.price,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      rating: rating ?? this.rating,
      stock: stock ?? this.stock,
      brand: brand ?? this.brand,
      sku: sku ?? this.sku,
      thumbnail: thumbnail ?? this.thumbnail,
      availabilityStatus: availabilityStatus ?? this.availabilityStatus,
      warrantyInformation: warrantyInformation ?? this.warrantyInformation,
      shippingInformation: shippingInformation ?? this.shippingInformation,
      returnPolicy: returnPolicy ?? this.returnPolicy,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (discountPercentage.present) {
      map['discount_percentage'] = Variable<double>(discountPercentage.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (stock.present) {
      map['stock'] = Variable<int>(stock.value);
    }
    if (brand.present) {
      map['brand'] = Variable<String>(brand.value);
    }
    if (sku.present) {
      map['sku'] = Variable<String>(sku.value);
    }
    if (thumbnail.present) {
      map['thumbnail'] = Variable<String>(thumbnail.value);
    }
    if (availabilityStatus.present) {
      map['availability_status'] = Variable<String>(availabilityStatus.value);
    }
    if (warrantyInformation.present) {
      map['warranty_information'] = Variable<String>(warrantyInformation.value);
    }
    if (shippingInformation.present) {
      map['shipping_information'] = Variable<String>(shippingInformation.value);
    }
    if (returnPolicy.present) {
      map['return_policy'] = Variable<String>(returnPolicy.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('price: $price, ')
          ..write('discountPercentage: $discountPercentage, ')
          ..write('rating: $rating, ')
          ..write('stock: $stock, ')
          ..write('brand: $brand, ')
          ..write('sku: $sku, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('availabilityStatus: $availabilityStatus, ')
          ..write('warrantyInformation: $warrantyInformation, ')
          ..write('shippingInformation: $shippingInformation, ')
          ..write('returnPolicy: $returnPolicy')
          ..write(')'))
        .toString();
  }
}

class $ProductImagesTable extends ProductImages
    with TableInfo<$ProductImagesTable, ProductImage> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductImagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _positionMeta = const VerificationMeta(
    'position',
  );
  @override
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
    'position',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [productId, position, url];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_images';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductImage> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('position')) {
      context.handle(
        _positionMeta,
        position.isAcceptableOrUnknown(data['position']!, _positionMeta),
      );
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {productId, position};
  @override
  ProductImage map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductImage(
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}product_id'],
      )!,
      position: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}position'],
      )!,
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      )!,
    );
  }

  @override
  $ProductImagesTable createAlias(String alias) {
    return $ProductImagesTable(attachedDatabase, alias);
  }
}

class ProductImage extends DataClass implements Insertable<ProductImage> {
  final int productId;
  final int position;
  final String url;
  const ProductImage({
    required this.productId,
    required this.position,
    required this.url,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['product_id'] = Variable<int>(productId);
    map['position'] = Variable<int>(position);
    map['url'] = Variable<String>(url);
    return map;
  }

  ProductImagesCompanion toCompanion(bool nullToAbsent) {
    return ProductImagesCompanion(
      productId: Value(productId),
      position: Value(position),
      url: Value(url),
    );
  }

  factory ProductImage.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductImage(
      productId: serializer.fromJson<int>(json['productId']),
      position: serializer.fromJson<int>(json['position']),
      url: serializer.fromJson<String>(json['url']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'productId': serializer.toJson<int>(productId),
      'position': serializer.toJson<int>(position),
      'url': serializer.toJson<String>(url),
    };
  }

  ProductImage copyWith({int? productId, int? position, String? url}) =>
      ProductImage(
        productId: productId ?? this.productId,
        position: position ?? this.position,
        url: url ?? this.url,
      );
  ProductImage copyWithCompanion(ProductImagesCompanion data) {
    return ProductImage(
      productId: data.productId.present ? data.productId.value : this.productId,
      position: data.position.present ? data.position.value : this.position,
      url: data.url.present ? data.url.value : this.url,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductImage(')
          ..write('productId: $productId, ')
          ..write('position: $position, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(productId, position, url);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductImage &&
          other.productId == this.productId &&
          other.position == this.position &&
          other.url == this.url);
}

class ProductImagesCompanion extends UpdateCompanion<ProductImage> {
  final Value<int> productId;
  final Value<int> position;
  final Value<String> url;
  final Value<int> rowid;
  const ProductImagesCompanion({
    this.productId = const Value.absent(),
    this.position = const Value.absent(),
    this.url = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductImagesCompanion.insert({
    required int productId,
    required int position,
    required String url,
    this.rowid = const Value.absent(),
  }) : productId = Value(productId),
       position = Value(position),
       url = Value(url);
  static Insertable<ProductImage> custom({
    Expression<int>? productId,
    Expression<int>? position,
    Expression<String>? url,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (productId != null) 'product_id': productId,
      if (position != null) 'position': position,
      if (url != null) 'url': url,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductImagesCompanion copyWith({
    Value<int>? productId,
    Value<int>? position,
    Value<String>? url,
    Value<int>? rowid,
  }) {
    return ProductImagesCompanion(
      productId: productId ?? this.productId,
      position: position ?? this.position,
      url: url ?? this.url,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductImagesCompanion(')
          ..write('productId: $productId, ')
          ..write('position: $position, ')
          ..write('url: $url, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProductTagsTable extends ProductTags
    with TableInfo<$ProductTagsTable, ProductTag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductTagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _positionMeta = const VerificationMeta(
    'position',
  );
  @override
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
    'position',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tagMeta = const VerificationMeta('tag');
  @override
  late final GeneratedColumn<String> tag = GeneratedColumn<String>(
    'tag',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [productId, position, tag];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_tags';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductTag> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('position')) {
      context.handle(
        _positionMeta,
        position.isAcceptableOrUnknown(data['position']!, _positionMeta),
      );
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('tag')) {
      context.handle(
        _tagMeta,
        tag.isAcceptableOrUnknown(data['tag']!, _tagMeta),
      );
    } else if (isInserting) {
      context.missing(_tagMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {productId, position};
  @override
  ProductTag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductTag(
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}product_id'],
      )!,
      position: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}position'],
      )!,
      tag: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tag'],
      )!,
    );
  }

  @override
  $ProductTagsTable createAlias(String alias) {
    return $ProductTagsTable(attachedDatabase, alias);
  }
}

class ProductTag extends DataClass implements Insertable<ProductTag> {
  final int productId;
  final int position;
  final String tag;
  const ProductTag({
    required this.productId,
    required this.position,
    required this.tag,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['product_id'] = Variable<int>(productId);
    map['position'] = Variable<int>(position);
    map['tag'] = Variable<String>(tag);
    return map;
  }

  ProductTagsCompanion toCompanion(bool nullToAbsent) {
    return ProductTagsCompanion(
      productId: Value(productId),
      position: Value(position),
      tag: Value(tag),
    );
  }

  factory ProductTag.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductTag(
      productId: serializer.fromJson<int>(json['productId']),
      position: serializer.fromJson<int>(json['position']),
      tag: serializer.fromJson<String>(json['tag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'productId': serializer.toJson<int>(productId),
      'position': serializer.toJson<int>(position),
      'tag': serializer.toJson<String>(tag),
    };
  }

  ProductTag copyWith({int? productId, int? position, String? tag}) =>
      ProductTag(
        productId: productId ?? this.productId,
        position: position ?? this.position,
        tag: tag ?? this.tag,
      );
  ProductTag copyWithCompanion(ProductTagsCompanion data) {
    return ProductTag(
      productId: data.productId.present ? data.productId.value : this.productId,
      position: data.position.present ? data.position.value : this.position,
      tag: data.tag.present ? data.tag.value : this.tag,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductTag(')
          ..write('productId: $productId, ')
          ..write('position: $position, ')
          ..write('tag: $tag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(productId, position, tag);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductTag &&
          other.productId == this.productId &&
          other.position == this.position &&
          other.tag == this.tag);
}

class ProductTagsCompanion extends UpdateCompanion<ProductTag> {
  final Value<int> productId;
  final Value<int> position;
  final Value<String> tag;
  final Value<int> rowid;
  const ProductTagsCompanion({
    this.productId = const Value.absent(),
    this.position = const Value.absent(),
    this.tag = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductTagsCompanion.insert({
    required int productId,
    required int position,
    required String tag,
    this.rowid = const Value.absent(),
  }) : productId = Value(productId),
       position = Value(position),
       tag = Value(tag);
  static Insertable<ProductTag> custom({
    Expression<int>? productId,
    Expression<int>? position,
    Expression<String>? tag,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (productId != null) 'product_id': productId,
      if (position != null) 'position': position,
      if (tag != null) 'tag': tag,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductTagsCompanion copyWith({
    Value<int>? productId,
    Value<int>? position,
    Value<String>? tag,
    Value<int>? rowid,
  }) {
    return ProductTagsCompanion(
      productId: productId ?? this.productId,
      position: position ?? this.position,
      tag: tag ?? this.tag,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (tag.present) {
      map['tag'] = Variable<String>(tag.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductTagsCompanion(')
          ..write('productId: $productId, ')
          ..write('position: $position, ')
          ..write('tag: $tag, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReviewsTable extends Reviews
    with TableInfo<$ReviewsTable, StoredReview> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReviewsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _positionMeta = const VerificationMeta(
    'position',
  );
  @override
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
    'position',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<int> rating = GeneratedColumn<int>(
    'rating',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _commentMeta = const VerificationMeta(
    'comment',
  );
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
    'comment',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _reviewerNameMeta = const VerificationMeta(
    'reviewerName',
  );
  @override
  late final GeneratedColumn<String> reviewerName = GeneratedColumn<String>(
    'reviewer_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reviewedOnMeta = const VerificationMeta(
    'reviewedOn',
  );
  @override
  late final GeneratedColumn<String> reviewedOn = GeneratedColumn<String>(
    'reviewed_on',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    productId,
    position,
    rating,
    comment,
    reviewerName,
    reviewedOn,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reviews';
  @override
  VerificationContext validateIntegrity(
    Insertable<StoredReview> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('position')) {
      context.handle(
        _positionMeta,
        position.isAcceptableOrUnknown(data['position']!, _positionMeta),
      );
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('comment')) {
      context.handle(
        _commentMeta,
        comment.isAcceptableOrUnknown(data['comment']!, _commentMeta),
      );
    }
    if (data.containsKey('reviewer_name')) {
      context.handle(
        _reviewerNameMeta,
        reviewerName.isAcceptableOrUnknown(
          data['reviewer_name']!,
          _reviewerNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_reviewerNameMeta);
    }
    if (data.containsKey('reviewed_on')) {
      context.handle(
        _reviewedOnMeta,
        reviewedOn.isAcceptableOrUnknown(data['reviewed_on']!, _reviewedOnMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StoredReview map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StoredReview(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}product_id'],
      )!,
      position: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}position'],
      )!,
      rating: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rating'],
      )!,
      comment: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}comment'],
      )!,
      reviewerName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reviewer_name'],
      )!,
      reviewedOn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reviewed_on'],
      ),
    );
  }

  @override
  $ReviewsTable createAlias(String alias) {
    return $ReviewsTable(attachedDatabase, alias);
  }
}

class StoredReview extends DataClass implements Insertable<StoredReview> {
  final int id;
  final int productId;
  final int position;
  final int rating;
  final String comment;
  final String reviewerName;
  final String? reviewedOn;
  const StoredReview({
    required this.id,
    required this.productId,
    required this.position,
    required this.rating,
    required this.comment,
    required this.reviewerName,
    this.reviewedOn,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_id'] = Variable<int>(productId);
    map['position'] = Variable<int>(position);
    map['rating'] = Variable<int>(rating);
    map['comment'] = Variable<String>(comment);
    map['reviewer_name'] = Variable<String>(reviewerName);
    if (!nullToAbsent || reviewedOn != null) {
      map['reviewed_on'] = Variable<String>(reviewedOn);
    }
    return map;
  }

  ReviewsCompanion toCompanion(bool nullToAbsent) {
    return ReviewsCompanion(
      id: Value(id),
      productId: Value(productId),
      position: Value(position),
      rating: Value(rating),
      comment: Value(comment),
      reviewerName: Value(reviewerName),
      reviewedOn: reviewedOn == null && nullToAbsent
          ? const Value.absent()
          : Value(reviewedOn),
    );
  }

  factory StoredReview.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StoredReview(
      id: serializer.fromJson<int>(json['id']),
      productId: serializer.fromJson<int>(json['productId']),
      position: serializer.fromJson<int>(json['position']),
      rating: serializer.fromJson<int>(json['rating']),
      comment: serializer.fromJson<String>(json['comment']),
      reviewerName: serializer.fromJson<String>(json['reviewerName']),
      reviewedOn: serializer.fromJson<String?>(json['reviewedOn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productId': serializer.toJson<int>(productId),
      'position': serializer.toJson<int>(position),
      'rating': serializer.toJson<int>(rating),
      'comment': serializer.toJson<String>(comment),
      'reviewerName': serializer.toJson<String>(reviewerName),
      'reviewedOn': serializer.toJson<String?>(reviewedOn),
    };
  }

  StoredReview copyWith({
    int? id,
    int? productId,
    int? position,
    int? rating,
    String? comment,
    String? reviewerName,
    Value<String?> reviewedOn = const Value.absent(),
  }) => StoredReview(
    id: id ?? this.id,
    productId: productId ?? this.productId,
    position: position ?? this.position,
    rating: rating ?? this.rating,
    comment: comment ?? this.comment,
    reviewerName: reviewerName ?? this.reviewerName,
    reviewedOn: reviewedOn.present ? reviewedOn.value : this.reviewedOn,
  );
  StoredReview copyWithCompanion(ReviewsCompanion data) {
    return StoredReview(
      id: data.id.present ? data.id.value : this.id,
      productId: data.productId.present ? data.productId.value : this.productId,
      position: data.position.present ? data.position.value : this.position,
      rating: data.rating.present ? data.rating.value : this.rating,
      comment: data.comment.present ? data.comment.value : this.comment,
      reviewerName: data.reviewerName.present
          ? data.reviewerName.value
          : this.reviewerName,
      reviewedOn: data.reviewedOn.present
          ? data.reviewedOn.value
          : this.reviewedOn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StoredReview(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('position: $position, ')
          ..write('rating: $rating, ')
          ..write('comment: $comment, ')
          ..write('reviewerName: $reviewerName, ')
          ..write('reviewedOn: $reviewedOn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    productId,
    position,
    rating,
    comment,
    reviewerName,
    reviewedOn,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StoredReview &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.position == this.position &&
          other.rating == this.rating &&
          other.comment == this.comment &&
          other.reviewerName == this.reviewerName &&
          other.reviewedOn == this.reviewedOn);
}

class ReviewsCompanion extends UpdateCompanion<StoredReview> {
  final Value<int> id;
  final Value<int> productId;
  final Value<int> position;
  final Value<int> rating;
  final Value<String> comment;
  final Value<String> reviewerName;
  final Value<String?> reviewedOn;
  const ReviewsCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.position = const Value.absent(),
    this.rating = const Value.absent(),
    this.comment = const Value.absent(),
    this.reviewerName = const Value.absent(),
    this.reviewedOn = const Value.absent(),
  });
  ReviewsCompanion.insert({
    this.id = const Value.absent(),
    required int productId,
    required int position,
    required int rating,
    this.comment = const Value.absent(),
    required String reviewerName,
    this.reviewedOn = const Value.absent(),
  }) : productId = Value(productId),
       position = Value(position),
       rating = Value(rating),
       reviewerName = Value(reviewerName);
  static Insertable<StoredReview> custom({
    Expression<int>? id,
    Expression<int>? productId,
    Expression<int>? position,
    Expression<int>? rating,
    Expression<String>? comment,
    Expression<String>? reviewerName,
    Expression<String>? reviewedOn,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (position != null) 'position': position,
      if (rating != null) 'rating': rating,
      if (comment != null) 'comment': comment,
      if (reviewerName != null) 'reviewer_name': reviewerName,
      if (reviewedOn != null) 'reviewed_on': reviewedOn,
    });
  }

  ReviewsCompanion copyWith({
    Value<int>? id,
    Value<int>? productId,
    Value<int>? position,
    Value<int>? rating,
    Value<String>? comment,
    Value<String>? reviewerName,
    Value<String?>? reviewedOn,
  }) {
    return ReviewsCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      position: position ?? this.position,
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
      reviewerName: reviewerName ?? this.reviewerName,
      reviewedOn: reviewedOn ?? this.reviewedOn,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (rating.present) {
      map['rating'] = Variable<int>(rating.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    if (reviewerName.present) {
      map['reviewer_name'] = Variable<String>(reviewerName.value);
    }
    if (reviewedOn.present) {
      map['reviewed_on'] = Variable<String>(reviewedOn.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReviewsCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('position: $position, ')
          ..write('rating: $rating, ')
          ..write('comment: $comment, ')
          ..write('reviewerName: $reviewerName, ')
          ..write('reviewedOn: $reviewedOn')
          ..write(')'))
        .toString();
  }
}

class $PagesTable extends Pages with TableInfo<$PagesTable, Page> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _pageLimitMeta = const VerificationMeta(
    'pageLimit',
  );
  @override
  late final GeneratedColumn<int> pageLimit = GeneratedColumn<int>(
    'page_limit',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pageSkipMeta = const VerificationMeta(
    'pageSkip',
  );
  @override
  late final GeneratedColumn<int> pageSkip = GeneratedColumn<int>(
    'page_skip',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<int> total = GeneratedColumn<int>(
    'total',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [pageLimit, pageSkip, total];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pages';
  @override
  VerificationContext validateIntegrity(
    Insertable<Page> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('page_limit')) {
      context.handle(
        _pageLimitMeta,
        pageLimit.isAcceptableOrUnknown(data['page_limit']!, _pageLimitMeta),
      );
    } else if (isInserting) {
      context.missing(_pageLimitMeta);
    }
    if (data.containsKey('page_skip')) {
      context.handle(
        _pageSkipMeta,
        pageSkip.isAcceptableOrUnknown(data['page_skip']!, _pageSkipMeta),
      );
    } else if (isInserting) {
      context.missing(_pageSkipMeta);
    }
    if (data.containsKey('total')) {
      context.handle(
        _totalMeta,
        total.isAcceptableOrUnknown(data['total']!, _totalMeta),
      );
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pageLimit, pageSkip};
  @override
  Page map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Page(
      pageLimit: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}page_limit'],
      )!,
      pageSkip: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}page_skip'],
      )!,
      total: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total'],
      )!,
    );
  }

  @override
  $PagesTable createAlias(String alias) {
    return $PagesTable(attachedDatabase, alias);
  }
}

class Page extends DataClass implements Insertable<Page> {
  final int pageLimit;
  final int pageSkip;
  final int total;
  const Page({
    required this.pageLimit,
    required this.pageSkip,
    required this.total,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['page_limit'] = Variable<int>(pageLimit);
    map['page_skip'] = Variable<int>(pageSkip);
    map['total'] = Variable<int>(total);
    return map;
  }

  PagesCompanion toCompanion(bool nullToAbsent) {
    return PagesCompanion(
      pageLimit: Value(pageLimit),
      pageSkip: Value(pageSkip),
      total: Value(total),
    );
  }

  factory Page.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Page(
      pageLimit: serializer.fromJson<int>(json['pageLimit']),
      pageSkip: serializer.fromJson<int>(json['pageSkip']),
      total: serializer.fromJson<int>(json['total']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pageLimit': serializer.toJson<int>(pageLimit),
      'pageSkip': serializer.toJson<int>(pageSkip),
      'total': serializer.toJson<int>(total),
    };
  }

  Page copyWith({int? pageLimit, int? pageSkip, int? total}) => Page(
    pageLimit: pageLimit ?? this.pageLimit,
    pageSkip: pageSkip ?? this.pageSkip,
    total: total ?? this.total,
  );
  Page copyWithCompanion(PagesCompanion data) {
    return Page(
      pageLimit: data.pageLimit.present ? data.pageLimit.value : this.pageLimit,
      pageSkip: data.pageSkip.present ? data.pageSkip.value : this.pageSkip,
      total: data.total.present ? data.total.value : this.total,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Page(')
          ..write('pageLimit: $pageLimit, ')
          ..write('pageSkip: $pageSkip, ')
          ..write('total: $total')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(pageLimit, pageSkip, total);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Page &&
          other.pageLimit == this.pageLimit &&
          other.pageSkip == this.pageSkip &&
          other.total == this.total);
}

class PagesCompanion extends UpdateCompanion<Page> {
  final Value<int> pageLimit;
  final Value<int> pageSkip;
  final Value<int> total;
  final Value<int> rowid;
  const PagesCompanion({
    this.pageLimit = const Value.absent(),
    this.pageSkip = const Value.absent(),
    this.total = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PagesCompanion.insert({
    required int pageLimit,
    required int pageSkip,
    required int total,
    this.rowid = const Value.absent(),
  }) : pageLimit = Value(pageLimit),
       pageSkip = Value(pageSkip),
       total = Value(total);
  static Insertable<Page> custom({
    Expression<int>? pageLimit,
    Expression<int>? pageSkip,
    Expression<int>? total,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (pageLimit != null) 'page_limit': pageLimit,
      if (pageSkip != null) 'page_skip': pageSkip,
      if (total != null) 'total': total,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PagesCompanion copyWith({
    Value<int>? pageLimit,
    Value<int>? pageSkip,
    Value<int>? total,
    Value<int>? rowid,
  }) {
    return PagesCompanion(
      pageLimit: pageLimit ?? this.pageLimit,
      pageSkip: pageSkip ?? this.pageSkip,
      total: total ?? this.total,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pageLimit.present) {
      map['page_limit'] = Variable<int>(pageLimit.value);
    }
    if (pageSkip.present) {
      map['page_skip'] = Variable<int>(pageSkip.value);
    }
    if (total.present) {
      map['total'] = Variable<int>(total.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PagesCompanion(')
          ..write('pageLimit: $pageLimit, ')
          ..write('pageSkip: $pageSkip, ')
          ..write('total: $total, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PageItemsTable extends PageItems
    with TableInfo<$PageItemsTable, PageItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PageItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _pageLimitMeta = const VerificationMeta(
    'pageLimit',
  );
  @override
  late final GeneratedColumn<int> pageLimit = GeneratedColumn<int>(
    'page_limit',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pageSkipMeta = const VerificationMeta(
    'pageSkip',
  );
  @override
  late final GeneratedColumn<int> pageSkip = GeneratedColumn<int>(
    'page_skip',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _positionMeta = const VerificationMeta(
    'position',
  );
  @override
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
    'position',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    pageLimit,
    pageSkip,
    position,
    productId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'page_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<PageItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('page_limit')) {
      context.handle(
        _pageLimitMeta,
        pageLimit.isAcceptableOrUnknown(data['page_limit']!, _pageLimitMeta),
      );
    } else if (isInserting) {
      context.missing(_pageLimitMeta);
    }
    if (data.containsKey('page_skip')) {
      context.handle(
        _pageSkipMeta,
        pageSkip.isAcceptableOrUnknown(data['page_skip']!, _pageSkipMeta),
      );
    } else if (isInserting) {
      context.missing(_pageSkipMeta);
    }
    if (data.containsKey('position')) {
      context.handle(
        _positionMeta,
        position.isAcceptableOrUnknown(data['position']!, _positionMeta),
      );
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pageLimit, pageSkip, position};
  @override
  PageItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PageItem(
      pageLimit: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}page_limit'],
      )!,
      pageSkip: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}page_skip'],
      )!,
      position: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}position'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}product_id'],
      )!,
    );
  }

  @override
  $PageItemsTable createAlias(String alias) {
    return $PageItemsTable(attachedDatabase, alias);
  }
}

class PageItem extends DataClass implements Insertable<PageItem> {
  final int pageLimit;
  final int pageSkip;
  final int position;
  final int productId;
  const PageItem({
    required this.pageLimit,
    required this.pageSkip,
    required this.position,
    required this.productId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['page_limit'] = Variable<int>(pageLimit);
    map['page_skip'] = Variable<int>(pageSkip);
    map['position'] = Variable<int>(position);
    map['product_id'] = Variable<int>(productId);
    return map;
  }

  PageItemsCompanion toCompanion(bool nullToAbsent) {
    return PageItemsCompanion(
      pageLimit: Value(pageLimit),
      pageSkip: Value(pageSkip),
      position: Value(position),
      productId: Value(productId),
    );
  }

  factory PageItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PageItem(
      pageLimit: serializer.fromJson<int>(json['pageLimit']),
      pageSkip: serializer.fromJson<int>(json['pageSkip']),
      position: serializer.fromJson<int>(json['position']),
      productId: serializer.fromJson<int>(json['productId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pageLimit': serializer.toJson<int>(pageLimit),
      'pageSkip': serializer.toJson<int>(pageSkip),
      'position': serializer.toJson<int>(position),
      'productId': serializer.toJson<int>(productId),
    };
  }

  PageItem copyWith({
    int? pageLimit,
    int? pageSkip,
    int? position,
    int? productId,
  }) => PageItem(
    pageLimit: pageLimit ?? this.pageLimit,
    pageSkip: pageSkip ?? this.pageSkip,
    position: position ?? this.position,
    productId: productId ?? this.productId,
  );
  PageItem copyWithCompanion(PageItemsCompanion data) {
    return PageItem(
      pageLimit: data.pageLimit.present ? data.pageLimit.value : this.pageLimit,
      pageSkip: data.pageSkip.present ? data.pageSkip.value : this.pageSkip,
      position: data.position.present ? data.position.value : this.position,
      productId: data.productId.present ? data.productId.value : this.productId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PageItem(')
          ..write('pageLimit: $pageLimit, ')
          ..write('pageSkip: $pageSkip, ')
          ..write('position: $position, ')
          ..write('productId: $productId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(pageLimit, pageSkip, position, productId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PageItem &&
          other.pageLimit == this.pageLimit &&
          other.pageSkip == this.pageSkip &&
          other.position == this.position &&
          other.productId == this.productId);
}

class PageItemsCompanion extends UpdateCompanion<PageItem> {
  final Value<int> pageLimit;
  final Value<int> pageSkip;
  final Value<int> position;
  final Value<int> productId;
  final Value<int> rowid;
  const PageItemsCompanion({
    this.pageLimit = const Value.absent(),
    this.pageSkip = const Value.absent(),
    this.position = const Value.absent(),
    this.productId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PageItemsCompanion.insert({
    required int pageLimit,
    required int pageSkip,
    required int position,
    required int productId,
    this.rowid = const Value.absent(),
  }) : pageLimit = Value(pageLimit),
       pageSkip = Value(pageSkip),
       position = Value(position),
       productId = Value(productId);
  static Insertable<PageItem> custom({
    Expression<int>? pageLimit,
    Expression<int>? pageSkip,
    Expression<int>? position,
    Expression<int>? productId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (pageLimit != null) 'page_limit': pageLimit,
      if (pageSkip != null) 'page_skip': pageSkip,
      if (position != null) 'position': position,
      if (productId != null) 'product_id': productId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PageItemsCompanion copyWith({
    Value<int>? pageLimit,
    Value<int>? pageSkip,
    Value<int>? position,
    Value<int>? productId,
    Value<int>? rowid,
  }) {
    return PageItemsCompanion(
      pageLimit: pageLimit ?? this.pageLimit,
      pageSkip: pageSkip ?? this.pageSkip,
      position: position ?? this.position,
      productId: productId ?? this.productId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pageLimit.present) {
      map['page_limit'] = Variable<int>(pageLimit.value);
    }
    if (pageSkip.present) {
      map['page_skip'] = Variable<int>(pageSkip.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PageItemsCompanion(')
          ..write('pageLimit: $pageLimit, ')
          ..write('pageSkip: $pageSkip, ')
          ..write('position: $position, ')
          ..write('productId: $productId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$CatalogDatabase extends GeneratedDatabase {
  _$CatalogDatabase(QueryExecutor e) : super(e);
  $CatalogDatabaseManager get managers => $CatalogDatabaseManager(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $ProductImagesTable productImages = $ProductImagesTable(this);
  late final $ProductTagsTable productTags = $ProductTagsTable(this);
  late final $ReviewsTable reviews = $ReviewsTable(this);
  late final $PagesTable pages = $PagesTable(this);
  late final $PageItemsTable pageItems = $PageItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    products,
    productImages,
    productTags,
    reviews,
    pages,
    pageItems,
  ];
}

typedef $$ProductsTableCreateCompanionBuilder =
    ProductsCompanion Function({
      Value<int> id,
      required String title,
      Value<String> description,
      Value<String> category,
      required double price,
      Value<double> discountPercentage,
      Value<double> rating,
      Value<int> stock,
      Value<String?> brand,
      Value<String> sku,
      Value<String> thumbnail,
      Value<String> availabilityStatus,
      Value<String> warrantyInformation,
      Value<String> shippingInformation,
      Value<String> returnPolicy,
    });
typedef $$ProductsTableUpdateCompanionBuilder =
    ProductsCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> description,
      Value<String> category,
      Value<double> price,
      Value<double> discountPercentage,
      Value<double> rating,
      Value<int> stock,
      Value<String?> brand,
      Value<String> sku,
      Value<String> thumbnail,
      Value<String> availabilityStatus,
      Value<String> warrantyInformation,
      Value<String> shippingInformation,
      Value<String> returnPolicy,
    });

class $$ProductsTableFilterComposer
    extends Composer<_$CatalogDatabase, $ProductsTable> {
  $$ProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get discountPercentage => $composableBuilder(
    column: $table.discountPercentage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stock => $composableBuilder(
    column: $table.stock,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get brand => $composableBuilder(
    column: $table.brand,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sku => $composableBuilder(
    column: $table.sku,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get thumbnail => $composableBuilder(
    column: $table.thumbnail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get availabilityStatus => $composableBuilder(
    column: $table.availabilityStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get warrantyInformation => $composableBuilder(
    column: $table.warrantyInformation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shippingInformation => $composableBuilder(
    column: $table.shippingInformation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get returnPolicy => $composableBuilder(
    column: $table.returnPolicy,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProductsTableOrderingComposer
    extends Composer<_$CatalogDatabase, $ProductsTable> {
  $$ProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get discountPercentage => $composableBuilder(
    column: $table.discountPercentage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stock => $composableBuilder(
    column: $table.stock,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get brand => $composableBuilder(
    column: $table.brand,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sku => $composableBuilder(
    column: $table.sku,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thumbnail => $composableBuilder(
    column: $table.thumbnail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get availabilityStatus => $composableBuilder(
    column: $table.availabilityStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get warrantyInformation => $composableBuilder(
    column: $table.warrantyInformation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shippingInformation => $composableBuilder(
    column: $table.shippingInformation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get returnPolicy => $composableBuilder(
    column: $table.returnPolicy,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductsTableAnnotationComposer
    extends Composer<_$CatalogDatabase, $ProductsTable> {
  $$ProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<double> get discountPercentage => $composableBuilder(
    column: $table.discountPercentage,
    builder: (column) => column,
  );

  GeneratedColumn<double> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<int> get stock =>
      $composableBuilder(column: $table.stock, builder: (column) => column);

  GeneratedColumn<String> get brand =>
      $composableBuilder(column: $table.brand, builder: (column) => column);

  GeneratedColumn<String> get sku =>
      $composableBuilder(column: $table.sku, builder: (column) => column);

  GeneratedColumn<String> get thumbnail =>
      $composableBuilder(column: $table.thumbnail, builder: (column) => column);

  GeneratedColumn<String> get availabilityStatus => $composableBuilder(
    column: $table.availabilityStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get warrantyInformation => $composableBuilder(
    column: $table.warrantyInformation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get shippingInformation => $composableBuilder(
    column: $table.shippingInformation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get returnPolicy => $composableBuilder(
    column: $table.returnPolicy,
    builder: (column) => column,
  );
}

class $$ProductsTableTableManager
    extends
        RootTableManager<
          _$CatalogDatabase,
          $ProductsTable,
          StoredProduct,
          $$ProductsTableFilterComposer,
          $$ProductsTableOrderingComposer,
          $$ProductsTableAnnotationComposer,
          $$ProductsTableCreateCompanionBuilder,
          $$ProductsTableUpdateCompanionBuilder,
          (
            StoredProduct,
            BaseReferences<_$CatalogDatabase, $ProductsTable, StoredProduct>,
          ),
          StoredProduct,
          PrefetchHooks Function()
        > {
  $$ProductsTableTableManager(_$CatalogDatabase db, $ProductsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<double> price = const Value.absent(),
                Value<double> discountPercentage = const Value.absent(),
                Value<double> rating = const Value.absent(),
                Value<int> stock = const Value.absent(),
                Value<String?> brand = const Value.absent(),
                Value<String> sku = const Value.absent(),
                Value<String> thumbnail = const Value.absent(),
                Value<String> availabilityStatus = const Value.absent(),
                Value<String> warrantyInformation = const Value.absent(),
                Value<String> shippingInformation = const Value.absent(),
                Value<String> returnPolicy = const Value.absent(),
              }) => ProductsCompanion(
                id: id,
                title: title,
                description: description,
                category: category,
                price: price,
                discountPercentage: discountPercentage,
                rating: rating,
                stock: stock,
                brand: brand,
                sku: sku,
                thumbnail: thumbnail,
                availabilityStatus: availabilityStatus,
                warrantyInformation: warrantyInformation,
                shippingInformation: shippingInformation,
                returnPolicy: returnPolicy,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                Value<String> description = const Value.absent(),
                Value<String> category = const Value.absent(),
                required double price,
                Value<double> discountPercentage = const Value.absent(),
                Value<double> rating = const Value.absent(),
                Value<int> stock = const Value.absent(),
                Value<String?> brand = const Value.absent(),
                Value<String> sku = const Value.absent(),
                Value<String> thumbnail = const Value.absent(),
                Value<String> availabilityStatus = const Value.absent(),
                Value<String> warrantyInformation = const Value.absent(),
                Value<String> shippingInformation = const Value.absent(),
                Value<String> returnPolicy = const Value.absent(),
              }) => ProductsCompanion.insert(
                id: id,
                title: title,
                description: description,
                category: category,
                price: price,
                discountPercentage: discountPercentage,
                rating: rating,
                stock: stock,
                brand: brand,
                sku: sku,
                thumbnail: thumbnail,
                availabilityStatus: availabilityStatus,
                warrantyInformation: warrantyInformation,
                shippingInformation: shippingInformation,
                returnPolicy: returnPolicy,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProductsTableProcessedTableManager =
    ProcessedTableManager<
      _$CatalogDatabase,
      $ProductsTable,
      StoredProduct,
      $$ProductsTableFilterComposer,
      $$ProductsTableOrderingComposer,
      $$ProductsTableAnnotationComposer,
      $$ProductsTableCreateCompanionBuilder,
      $$ProductsTableUpdateCompanionBuilder,
      (
        StoredProduct,
        BaseReferences<_$CatalogDatabase, $ProductsTable, StoredProduct>,
      ),
      StoredProduct,
      PrefetchHooks Function()
    >;
typedef $$ProductImagesTableCreateCompanionBuilder =
    ProductImagesCompanion Function({
      required int productId,
      required int position,
      required String url,
      Value<int> rowid,
    });
typedef $$ProductImagesTableUpdateCompanionBuilder =
    ProductImagesCompanion Function({
      Value<int> productId,
      Value<int> position,
      Value<String> url,
      Value<int> rowid,
    });

class $$ProductImagesTableFilterComposer
    extends Composer<_$CatalogDatabase, $ProductImagesTable> {
  $$ProductImagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProductImagesTableOrderingComposer
    extends Composer<_$CatalogDatabase, $ProductImagesTable> {
  $$ProductImagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductImagesTableAnnotationComposer
    extends Composer<_$CatalogDatabase, $ProductImagesTable> {
  $$ProductImagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<int> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);
}

class $$ProductImagesTableTableManager
    extends
        RootTableManager<
          _$CatalogDatabase,
          $ProductImagesTable,
          ProductImage,
          $$ProductImagesTableFilterComposer,
          $$ProductImagesTableOrderingComposer,
          $$ProductImagesTableAnnotationComposer,
          $$ProductImagesTableCreateCompanionBuilder,
          $$ProductImagesTableUpdateCompanionBuilder,
          (
            ProductImage,
            BaseReferences<
              _$CatalogDatabase,
              $ProductImagesTable,
              ProductImage
            >,
          ),
          ProductImage,
          PrefetchHooks Function()
        > {
  $$ProductImagesTableTableManager(
    _$CatalogDatabase db,
    $ProductImagesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductImagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductImagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductImagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> productId = const Value.absent(),
                Value<int> position = const Value.absent(),
                Value<String> url = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductImagesCompanion(
                productId: productId,
                position: position,
                url: url,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int productId,
                required int position,
                required String url,
                Value<int> rowid = const Value.absent(),
              }) => ProductImagesCompanion.insert(
                productId: productId,
                position: position,
                url: url,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProductImagesTableProcessedTableManager =
    ProcessedTableManager<
      _$CatalogDatabase,
      $ProductImagesTable,
      ProductImage,
      $$ProductImagesTableFilterComposer,
      $$ProductImagesTableOrderingComposer,
      $$ProductImagesTableAnnotationComposer,
      $$ProductImagesTableCreateCompanionBuilder,
      $$ProductImagesTableUpdateCompanionBuilder,
      (
        ProductImage,
        BaseReferences<_$CatalogDatabase, $ProductImagesTable, ProductImage>,
      ),
      ProductImage,
      PrefetchHooks Function()
    >;
typedef $$ProductTagsTableCreateCompanionBuilder =
    ProductTagsCompanion Function({
      required int productId,
      required int position,
      required String tag,
      Value<int> rowid,
    });
typedef $$ProductTagsTableUpdateCompanionBuilder =
    ProductTagsCompanion Function({
      Value<int> productId,
      Value<int> position,
      Value<String> tag,
      Value<int> rowid,
    });

class $$ProductTagsTableFilterComposer
    extends Composer<_$CatalogDatabase, $ProductTagsTable> {
  $$ProductTagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tag => $composableBuilder(
    column: $table.tag,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProductTagsTableOrderingComposer
    extends Composer<_$CatalogDatabase, $ProductTagsTable> {
  $$ProductTagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tag => $composableBuilder(
    column: $table.tag,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductTagsTableAnnotationComposer
    extends Composer<_$CatalogDatabase, $ProductTagsTable> {
  $$ProductTagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<int> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  GeneratedColumn<String> get tag =>
      $composableBuilder(column: $table.tag, builder: (column) => column);
}

class $$ProductTagsTableTableManager
    extends
        RootTableManager<
          _$CatalogDatabase,
          $ProductTagsTable,
          ProductTag,
          $$ProductTagsTableFilterComposer,
          $$ProductTagsTableOrderingComposer,
          $$ProductTagsTableAnnotationComposer,
          $$ProductTagsTableCreateCompanionBuilder,
          $$ProductTagsTableUpdateCompanionBuilder,
          (
            ProductTag,
            BaseReferences<_$CatalogDatabase, $ProductTagsTable, ProductTag>,
          ),
          ProductTag,
          PrefetchHooks Function()
        > {
  $$ProductTagsTableTableManager(_$CatalogDatabase db, $ProductTagsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductTagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductTagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductTagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> productId = const Value.absent(),
                Value<int> position = const Value.absent(),
                Value<String> tag = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductTagsCompanion(
                productId: productId,
                position: position,
                tag: tag,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int productId,
                required int position,
                required String tag,
                Value<int> rowid = const Value.absent(),
              }) => ProductTagsCompanion.insert(
                productId: productId,
                position: position,
                tag: tag,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProductTagsTableProcessedTableManager =
    ProcessedTableManager<
      _$CatalogDatabase,
      $ProductTagsTable,
      ProductTag,
      $$ProductTagsTableFilterComposer,
      $$ProductTagsTableOrderingComposer,
      $$ProductTagsTableAnnotationComposer,
      $$ProductTagsTableCreateCompanionBuilder,
      $$ProductTagsTableUpdateCompanionBuilder,
      (
        ProductTag,
        BaseReferences<_$CatalogDatabase, $ProductTagsTable, ProductTag>,
      ),
      ProductTag,
      PrefetchHooks Function()
    >;
typedef $$ReviewsTableCreateCompanionBuilder =
    ReviewsCompanion Function({
      Value<int> id,
      required int productId,
      required int position,
      required int rating,
      Value<String> comment,
      required String reviewerName,
      Value<String?> reviewedOn,
    });
typedef $$ReviewsTableUpdateCompanionBuilder =
    ReviewsCompanion Function({
      Value<int> id,
      Value<int> productId,
      Value<int> position,
      Value<int> rating,
      Value<String> comment,
      Value<String> reviewerName,
      Value<String?> reviewedOn,
    });

class $$ReviewsTableFilterComposer
    extends Composer<_$CatalogDatabase, $ReviewsTable> {
  $$ReviewsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get comment => $composableBuilder(
    column: $table.comment,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reviewerName => $composableBuilder(
    column: $table.reviewerName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reviewedOn => $composableBuilder(
    column: $table.reviewedOn,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ReviewsTableOrderingComposer
    extends Composer<_$CatalogDatabase, $ReviewsTable> {
  $$ReviewsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get comment => $composableBuilder(
    column: $table.comment,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reviewerName => $composableBuilder(
    column: $table.reviewerName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reviewedOn => $composableBuilder(
    column: $table.reviewedOn,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ReviewsTableAnnotationComposer
    extends Composer<_$CatalogDatabase, $ReviewsTable> {
  $$ReviewsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<int> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  GeneratedColumn<int> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<String> get comment =>
      $composableBuilder(column: $table.comment, builder: (column) => column);

  GeneratedColumn<String> get reviewerName => $composableBuilder(
    column: $table.reviewerName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get reviewedOn => $composableBuilder(
    column: $table.reviewedOn,
    builder: (column) => column,
  );
}

class $$ReviewsTableTableManager
    extends
        RootTableManager<
          _$CatalogDatabase,
          $ReviewsTable,
          StoredReview,
          $$ReviewsTableFilterComposer,
          $$ReviewsTableOrderingComposer,
          $$ReviewsTableAnnotationComposer,
          $$ReviewsTableCreateCompanionBuilder,
          $$ReviewsTableUpdateCompanionBuilder,
          (
            StoredReview,
            BaseReferences<_$CatalogDatabase, $ReviewsTable, StoredReview>,
          ),
          StoredReview,
          PrefetchHooks Function()
        > {
  $$ReviewsTableTableManager(_$CatalogDatabase db, $ReviewsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReviewsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReviewsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReviewsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> productId = const Value.absent(),
                Value<int> position = const Value.absent(),
                Value<int> rating = const Value.absent(),
                Value<String> comment = const Value.absent(),
                Value<String> reviewerName = const Value.absent(),
                Value<String?> reviewedOn = const Value.absent(),
              }) => ReviewsCompanion(
                id: id,
                productId: productId,
                position: position,
                rating: rating,
                comment: comment,
                reviewerName: reviewerName,
                reviewedOn: reviewedOn,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int productId,
                required int position,
                required int rating,
                Value<String> comment = const Value.absent(),
                required String reviewerName,
                Value<String?> reviewedOn = const Value.absent(),
              }) => ReviewsCompanion.insert(
                id: id,
                productId: productId,
                position: position,
                rating: rating,
                comment: comment,
                reviewerName: reviewerName,
                reviewedOn: reviewedOn,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReviewsTableProcessedTableManager =
    ProcessedTableManager<
      _$CatalogDatabase,
      $ReviewsTable,
      StoredReview,
      $$ReviewsTableFilterComposer,
      $$ReviewsTableOrderingComposer,
      $$ReviewsTableAnnotationComposer,
      $$ReviewsTableCreateCompanionBuilder,
      $$ReviewsTableUpdateCompanionBuilder,
      (
        StoredReview,
        BaseReferences<_$CatalogDatabase, $ReviewsTable, StoredReview>,
      ),
      StoredReview,
      PrefetchHooks Function()
    >;
typedef $$PagesTableCreateCompanionBuilder =
    PagesCompanion Function({
      required int pageLimit,
      required int pageSkip,
      required int total,
      Value<int> rowid,
    });
typedef $$PagesTableUpdateCompanionBuilder =
    PagesCompanion Function({
      Value<int> pageLimit,
      Value<int> pageSkip,
      Value<int> total,
      Value<int> rowid,
    });

class $$PagesTableFilterComposer
    extends Composer<_$CatalogDatabase, $PagesTable> {
  $$PagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get pageLimit => $composableBuilder(
    column: $table.pageLimit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pageSkip => $composableBuilder(
    column: $table.pageSkip,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get total => $composableBuilder(
    column: $table.total,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PagesTableOrderingComposer
    extends Composer<_$CatalogDatabase, $PagesTable> {
  $$PagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get pageLimit => $composableBuilder(
    column: $table.pageLimit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pageSkip => $composableBuilder(
    column: $table.pageSkip,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get total => $composableBuilder(
    column: $table.total,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PagesTableAnnotationComposer
    extends Composer<_$CatalogDatabase, $PagesTable> {
  $$PagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get pageLimit =>
      $composableBuilder(column: $table.pageLimit, builder: (column) => column);

  GeneratedColumn<int> get pageSkip =>
      $composableBuilder(column: $table.pageSkip, builder: (column) => column);

  GeneratedColumn<int> get total =>
      $composableBuilder(column: $table.total, builder: (column) => column);
}

class $$PagesTableTableManager
    extends
        RootTableManager<
          _$CatalogDatabase,
          $PagesTable,
          Page,
          $$PagesTableFilterComposer,
          $$PagesTableOrderingComposer,
          $$PagesTableAnnotationComposer,
          $$PagesTableCreateCompanionBuilder,
          $$PagesTableUpdateCompanionBuilder,
          (Page, BaseReferences<_$CatalogDatabase, $PagesTable, Page>),
          Page,
          PrefetchHooks Function()
        > {
  $$PagesTableTableManager(_$CatalogDatabase db, $PagesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> pageLimit = const Value.absent(),
                Value<int> pageSkip = const Value.absent(),
                Value<int> total = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PagesCompanion(
                pageLimit: pageLimit,
                pageSkip: pageSkip,
                total: total,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int pageLimit,
                required int pageSkip,
                required int total,
                Value<int> rowid = const Value.absent(),
              }) => PagesCompanion.insert(
                pageLimit: pageLimit,
                pageSkip: pageSkip,
                total: total,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PagesTableProcessedTableManager =
    ProcessedTableManager<
      _$CatalogDatabase,
      $PagesTable,
      Page,
      $$PagesTableFilterComposer,
      $$PagesTableOrderingComposer,
      $$PagesTableAnnotationComposer,
      $$PagesTableCreateCompanionBuilder,
      $$PagesTableUpdateCompanionBuilder,
      (Page, BaseReferences<_$CatalogDatabase, $PagesTable, Page>),
      Page,
      PrefetchHooks Function()
    >;
typedef $$PageItemsTableCreateCompanionBuilder =
    PageItemsCompanion Function({
      required int pageLimit,
      required int pageSkip,
      required int position,
      required int productId,
      Value<int> rowid,
    });
typedef $$PageItemsTableUpdateCompanionBuilder =
    PageItemsCompanion Function({
      Value<int> pageLimit,
      Value<int> pageSkip,
      Value<int> position,
      Value<int> productId,
      Value<int> rowid,
    });

class $$PageItemsTableFilterComposer
    extends Composer<_$CatalogDatabase, $PageItemsTable> {
  $$PageItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get pageLimit => $composableBuilder(
    column: $table.pageLimit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pageSkip => $composableBuilder(
    column: $table.pageSkip,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PageItemsTableOrderingComposer
    extends Composer<_$CatalogDatabase, $PageItemsTable> {
  $$PageItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get pageLimit => $composableBuilder(
    column: $table.pageLimit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pageSkip => $composableBuilder(
    column: $table.pageSkip,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PageItemsTableAnnotationComposer
    extends Composer<_$CatalogDatabase, $PageItemsTable> {
  $$PageItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get pageLimit =>
      $composableBuilder(column: $table.pageLimit, builder: (column) => column);

  GeneratedColumn<int> get pageSkip =>
      $composableBuilder(column: $table.pageSkip, builder: (column) => column);

  GeneratedColumn<int> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  GeneratedColumn<int> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);
}

class $$PageItemsTableTableManager
    extends
        RootTableManager<
          _$CatalogDatabase,
          $PageItemsTable,
          PageItem,
          $$PageItemsTableFilterComposer,
          $$PageItemsTableOrderingComposer,
          $$PageItemsTableAnnotationComposer,
          $$PageItemsTableCreateCompanionBuilder,
          $$PageItemsTableUpdateCompanionBuilder,
          (
            PageItem,
            BaseReferences<_$CatalogDatabase, $PageItemsTable, PageItem>,
          ),
          PageItem,
          PrefetchHooks Function()
        > {
  $$PageItemsTableTableManager(_$CatalogDatabase db, $PageItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PageItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PageItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PageItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> pageLimit = const Value.absent(),
                Value<int> pageSkip = const Value.absent(),
                Value<int> position = const Value.absent(),
                Value<int> productId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PageItemsCompanion(
                pageLimit: pageLimit,
                pageSkip: pageSkip,
                position: position,
                productId: productId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int pageLimit,
                required int pageSkip,
                required int position,
                required int productId,
                Value<int> rowid = const Value.absent(),
              }) => PageItemsCompanion.insert(
                pageLimit: pageLimit,
                pageSkip: pageSkip,
                position: position,
                productId: productId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PageItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$CatalogDatabase,
      $PageItemsTable,
      PageItem,
      $$PageItemsTableFilterComposer,
      $$PageItemsTableOrderingComposer,
      $$PageItemsTableAnnotationComposer,
      $$PageItemsTableCreateCompanionBuilder,
      $$PageItemsTableUpdateCompanionBuilder,
      (PageItem, BaseReferences<_$CatalogDatabase, $PageItemsTable, PageItem>),
      PageItem,
      PrefetchHooks Function()
    >;

class $CatalogDatabaseManager {
  final _$CatalogDatabase _db;
  $CatalogDatabaseManager(this._db);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
  $$ProductImagesTableTableManager get productImages =>
      $$ProductImagesTableTableManager(_db, _db.productImages);
  $$ProductTagsTableTableManager get productTags =>
      $$ProductTagsTableTableManager(_db, _db.productTags);
  $$ReviewsTableTableManager get reviews =>
      $$ReviewsTableTableManager(_db, _db.reviews);
  $$PagesTableTableManager get pages =>
      $$PagesTableTableManager(_db, _db.pages);
  $$PageItemsTableTableManager get pageItems =>
      $$PageItemsTableTableManager(_db, _db.pageItems);
}
