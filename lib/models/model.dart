import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'serializers.dart';

part 'model.g.dart';

abstract class Category implements Built<Category, CategoryBuilder> {
  static Serializer<Category> get serializer => _$categorySerializer;

  String get id;

  String get name;

  @nullable
  int get order;

  Category._();

  factory Category([void Function(CategoryBuilder) updates]) = _$Category;

  factory Category.fromMap(Map map) {
    return serializers.deserializeWith(Category.serializer, map);
  }

  Map<String, dynamic> toMap() {
    return serializers.serializeWith(Category.serializer, this);
  }

  factory Category.fromFirestore(DocumentSnapshot doc) {
    Category obj = Category.fromMap(doc.data);
    return obj.rebuild((o) => o..id = doc.documentID);
  }
}

abstract class Standard implements Built<Standard, StandardBuilder> {
  static Serializer<Standard> get serializer => _$standardSerializer;

  @nullable
  String get id;

  @nullable
  int get title;

  Standard._();

  factory Standard([void Function(StandardBuilder) updates]) = _$Standard;

  Map<String, dynamic> toMap() {
    return serializers.serializeWith(Standard.serializer, this);
  }

  factory Standard.fromMap(Map map) {
    return serializers.deserializeWith(Standard.serializer, map);
  }

  factory Standard.fromFirestore(DocumentSnapshot doc) {
    Standard std = Standard.fromMap(doc.data);
    var s = std.rebuild((b) => b..id = doc.documentID);
    return s;
  }
}

abstract class Subject implements Built<Subject, SubjectBuilder> {
  static Serializer<Subject> get serializer => _$subjectSerializer;

  String get id;

  String get title;

  @nullable
  Standard get standard;

  @nullable
  BuiltList<Category> get categories;

  @nullable
  BuiltList<String> get categoryIds;

  @nullable
  String get iconUrl;

  Subject._();

  factory Subject([void Function(SubjectBuilder) updates]) = _$Subject;

  Map<String, dynamic> toMap() {
    return serializers.serializeWith(Subject.serializer, this);
  }

  factory Subject.fromMap(Map map) {
    return serializers.deserializeWith(Subject.serializer, map);
  }

  factory Subject.fromFirestore(DocumentSnapshot doc) {
    Subject std = Subject.fromMap(doc.data);
    var s = std.rebuild((b) => b..id = doc.documentID);
    return s;
  }
}

abstract class Content implements Built<Content, ContentBuilder> {
  static Serializer<Content> get serializer => _$contentSerializer;

  String get id;

  @nullable
  String get title;

  @nullable
  String get url;

  @nullable
  Subject get subject;

  @nullable
  Category get category;

  @nullable
  String get version;

  Content._();

  @override
  String toString() {
    return '$title';
  }

  factory Content([void Function(ContentBuilder) updates]) = _$Content;

  factory Content.fromMap(Map map) {
    return serializers.deserializeWith(Content.serializer, map);
  }

  Map<String, dynamic> toMap() {
    return serializers.serializeWith(Content.serializer, this);
  }

  factory Content.fromFirestore(DocumentSnapshot doc) {
    Content std = Content.fromMap(doc.data);
    var s = std.rebuild((b) => b..id = doc.documentID);
    return s;
  }
}

abstract class User implements Built<User, UserBuilder> {
  static Serializer<User> get serializer => _$userSerializer;

  @nullable
  String get uid;

  @nullable
  String get name;

  @nullable
  String get email;

  @nullable
  String get photoUrl;

  @nullable
  Standard get standard;

  @nullable
  bool get isAnonymous;

  User._();

  factory User([void Function(UserBuilder) updates]) = _$User;

  Map<String, dynamic> toMap() {
    return serializers.serializeWith(User.serializer, this);
  }

  factory User.fromMap(Map map) {
    return serializers.deserializeWith(User.serializer, map);
  }

  factory User.fromFirestore(DocumentSnapshot doc) {
    User std = User.fromMap(doc.data);
    return std;
  }
}

