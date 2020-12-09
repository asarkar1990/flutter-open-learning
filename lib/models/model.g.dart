// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Category> _$categorySerializer = new _$CategorySerializer();
Serializer<Standard> _$standardSerializer = new _$StandardSerializer();
Serializer<Subject> _$subjectSerializer = new _$SubjectSerializer();
Serializer<Content> _$contentSerializer = new _$ContentSerializer();
Serializer<User> _$userSerializer = new _$UserSerializer();

class _$CategorySerializer implements StructuredSerializer<Category> {
  @override
  final Iterable<Type> types = const [Category, _$Category];
  @override
  final String wireName = 'Category';

  @override
  Iterable<Object> serialize(Serializers serializers, Category object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];
    if (object.order != null) {
      result
        ..add('order')
        ..add(serializers.serialize(object.order,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Category deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CategoryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'order':
          result.order = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$StandardSerializer implements StructuredSerializer<Standard> {
  @override
  final Iterable<Type> types = const [Standard, _$Standard];
  @override
  final String wireName = 'Standard';

  @override
  Iterable<Object> serialize(Serializers serializers, Standard object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.title != null) {
      result
        ..add('title')
        ..add(serializers.serialize(object.title,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Standard deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StandardBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$SubjectSerializer implements StructuredSerializer<Subject> {
  @override
  final Iterable<Type> types = const [Subject, _$Subject];
  @override
  final String wireName = 'Subject';

  @override
  Iterable<Object> serialize(Serializers serializers, Subject object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
    ];
    if (object.standard != null) {
      result
        ..add('standard')
        ..add(serializers.serialize(object.standard,
            specifiedType: const FullType(Standard)));
    }
    if (object.categories != null) {
      result
        ..add('categories')
        ..add(serializers.serialize(object.categories,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Category)])));
    }
    if (object.categoryIds != null) {
      result
        ..add('categoryIds')
        ..add(serializers.serialize(object.categoryIds,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    if (object.iconUrl != null) {
      result
        ..add('iconUrl')
        ..add(serializers.serialize(object.iconUrl,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Subject deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SubjectBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'standard':
          result.standard.replace(serializers.deserialize(value,
              specifiedType: const FullType(Standard)) as Standard);
          break;
        case 'categories':
          result.categories.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Category)]))
              as BuiltList<Object>);
          break;
        case 'categoryIds':
          result.categoryIds.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'iconUrl':
          result.iconUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ContentSerializer implements StructuredSerializer<Content> {
  @override
  final Iterable<Type> types = const [Content, _$Content];
  @override
  final String wireName = 'Content';

  @override
  Iterable<Object> serialize(Serializers serializers, Content object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];
    if (object.title != null) {
      result
        ..add('title')
        ..add(serializers.serialize(object.title,
            specifiedType: const FullType(String)));
    }
    if (object.url != null) {
      result
        ..add('pdfUrl')
        ..add(serializers.serialize(object.url,
            specifiedType: const FullType(String)));
    }
    if (object.subject != null) {
      result
        ..add('subject')
        ..add(serializers.serialize(object.subject,
            specifiedType: const FullType(Subject)));
    }
    if (object.category != null) {
      result
        ..add('category')
        ..add(serializers.serialize(object.category,
            specifiedType: const FullType(Category)));
    }
    if (object.version != null) {
      result
        ..add('version')
        ..add(serializers.serialize(object.version,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Content deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ContentBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'pdfUrl':
          result.pdfUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'subject':
          result.subject.replace(serializers.deserialize(value,
              specifiedType: const FullType(Subject)) as Subject);
          break;
        case 'category':
          result.category.replace(serializers.deserialize(value,
              specifiedType: const FullType(Category)) as Category);
          break;
        case 'version':
          result.version = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$UserSerializer implements StructuredSerializer<User> {
  @override
  final Iterable<Type> types = const [User, _$User];
  @override
  final String wireName = 'User';

  @override
  Iterable<Object> serialize(Serializers serializers, User object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.uid != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(object.uid,
            specifiedType: const FullType(String)));
    }
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.email != null) {
      result
        ..add('email')
        ..add(serializers.serialize(object.email,
            specifiedType: const FullType(String)));
    }
    if (object.photoUrl != null) {
      result
        ..add('photoUrl')
        ..add(serializers.serialize(object.photoUrl,
            specifiedType: const FullType(String)));
    }
    if (object.standard != null) {
      result
        ..add('standard')
        ..add(serializers.serialize(object.standard,
            specifiedType: const FullType(Standard)));
    }
    if (object.isAnonymous != null) {
      result
        ..add('isAnonymous')
        ..add(serializers.serialize(object.isAnonymous,
            specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  User deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photoUrl':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'standard':
          result.standard.replace(serializers.deserialize(value,
              specifiedType: const FullType(Standard)) as Standard);
          break;
        case 'isAnonymous':
          result.isAnonymous = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$Category extends Category {
  @override
  final String id;
  @override
  final String name;
  @override
  final int order;

  factory _$Category([void Function(CategoryBuilder) updates]) =>
      (new CategoryBuilder()..update(updates)).build();

  _$Category._({this.id, this.name, this.order}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Category', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Category', 'name');
    }
  }

  @override
  Category rebuild(void Function(CategoryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoryBuilder toBuilder() => new CategoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Category &&
        id == other.id &&
        name == other.name &&
        order == other.order;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, id.hashCode), name.hashCode), order.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Category')
          ..add('id', id)
          ..add('name', name)
          ..add('order', order))
        .toString();
  }
}

class CategoryBuilder implements Builder<Category, CategoryBuilder> {
  _$Category _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  int _order;
  int get order => _$this._order;
  set order(int order) => _$this._order = order;

  CategoryBuilder();

  CategoryBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _order = _$v.order;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Category other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Category;
  }

  @override
  void update(void Function(CategoryBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Category build() {
    final _$result = _$v ?? new _$Category._(id: id, name: name, order: order);
    replace(_$result);
    return _$result;
  }
}

class _$Standard extends Standard {
  @override
  final String id;
  @override
  final int title;

  factory _$Standard([void Function(StandardBuilder) updates]) =>
      (new StandardBuilder()..update(updates)).build();

  _$Standard._({this.id, this.title}) : super._();

  @override
  Standard rebuild(void Function(StandardBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StandardBuilder toBuilder() => new StandardBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Standard && id == other.id && title == other.title;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), title.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Standard')
          ..add('id', id)
          ..add('title', title))
        .toString();
  }
}

class StandardBuilder implements Builder<Standard, StandardBuilder> {
  _$Standard _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  int _title;
  int get title => _$this._title;
  set title(int title) => _$this._title = title;

  StandardBuilder();

  StandardBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _title = _$v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Standard other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Standard;
  }

  @override
  void update(void Function(StandardBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Standard build() {
    final _$result = _$v ?? new _$Standard._(id: id, title: title);
    replace(_$result);
    return _$result;
  }
}

class _$Subject extends Subject {
  @override
  final String id;
  @override
  final String title;
  @override
  final Standard standard;
  @override
  final BuiltList<Category> categories;
  @override
  final BuiltList<String> categoryIds;
  @override
  final String iconUrl;

  factory _$Subject([void Function(SubjectBuilder) updates]) =>
      (new SubjectBuilder()..update(updates)).build();

  _$Subject._(
      {this.id,
      this.title,
      this.standard,
      this.categories,
      this.categoryIds,
      this.iconUrl})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Subject', 'id');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('Subject', 'title');
    }
  }

  @override
  Subject rebuild(void Function(SubjectBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubjectBuilder toBuilder() => new SubjectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Subject &&
        id == other.id &&
        title == other.title &&
        standard == other.standard &&
        categories == other.categories &&
        categoryIds == other.categoryIds &&
        iconUrl == other.iconUrl;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, id.hashCode), title.hashCode),
                    standard.hashCode),
                categories.hashCode),
            categoryIds.hashCode),
        iconUrl.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Subject')
          ..add('id', id)
          ..add('title', title)
          ..add('standard', standard)
          ..add('categories', categories)
          ..add('categoryIds', categoryIds)
          ..add('iconUrl', iconUrl))
        .toString();
  }
}

class SubjectBuilder implements Builder<Subject, SubjectBuilder> {
  _$Subject _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  StandardBuilder _standard;
  StandardBuilder get standard => _$this._standard ??= new StandardBuilder();
  set standard(StandardBuilder standard) => _$this._standard = standard;

  ListBuilder<Category> _categories;
  ListBuilder<Category> get categories =>
      _$this._categories ??= new ListBuilder<Category>();
  set categories(ListBuilder<Category> categories) =>
      _$this._categories = categories;

  ListBuilder<String> _categoryIds;
  ListBuilder<String> get categoryIds =>
      _$this._categoryIds ??= new ListBuilder<String>();
  set categoryIds(ListBuilder<String> categoryIds) =>
      _$this._categoryIds = categoryIds;

  String _iconUrl;
  String get iconUrl => _$this._iconUrl;
  set iconUrl(String iconUrl) => _$this._iconUrl = iconUrl;

  SubjectBuilder();

  SubjectBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _title = _$v.title;
      _standard = _$v.standard?.toBuilder();
      _categories = _$v.categories?.toBuilder();
      _categoryIds = _$v.categoryIds?.toBuilder();
      _iconUrl = _$v.iconUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Subject other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Subject;
  }

  @override
  void update(void Function(SubjectBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Subject build() {
    _$Subject _$result;
    try {
      _$result = _$v ??
          new _$Subject._(
              id: id,
              title: title,
              standard: _standard?.build(),
              categories: _categories?.build(),
              categoryIds: _categoryIds?.build(),
              iconUrl: iconUrl);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'standard';
        _standard?.build();
        _$failedField = 'categories';
        _categories?.build();
        _$failedField = 'categoryIds';
        _categoryIds?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Subject', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Content extends Content {
  @override
  final String id;
  @override
  final String title;
  @override
  final String url;
  @override
  final Subject subject;
  @override
  final Category category;
  @override
  final String version;

  factory _$Content([void Function(ContentBuilder) updates]) =>
      (new ContentBuilder()..update(updates)).build();

  _$Content._(
      {this.id,
      this.title,
      this.url,
      this.subject,
      this.category,
      this.version})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Content', 'id');
    }
  }

  @override
  Content rebuild(void Function(ContentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContentBuilder toBuilder() => new ContentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Content &&
        id == other.id &&
        title == other.title &&
        url == other.url &&
        subject == other.subject &&
        category == other.category &&
        version == other.version;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, id.hashCode), title.hashCode), url.hashCode),
                subject.hashCode),
            category.hashCode),
        version.hashCode));
  }
}

class ContentBuilder implements Builder<Content, ContentBuilder> {
  _$Content _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _pdfUrl;
  String get pdfUrl => _$this._pdfUrl;
  set pdfUrl(String pdfUrl) => _$this._pdfUrl = pdfUrl;

  SubjectBuilder _subject;
  SubjectBuilder get subject => _$this._subject ??= new SubjectBuilder();
  set subject(SubjectBuilder subject) => _$this._subject = subject;

  CategoryBuilder _category;
  CategoryBuilder get category => _$this._category ??= new CategoryBuilder();
  set category(CategoryBuilder category) => _$this._category = category;

  String _version;
  String get version => _$this._version;
  set version(String version) => _$this._version = version;

  ContentBuilder();

  ContentBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _title = _$v.title;
      _pdfUrl = _$v.url;
      _subject = _$v.subject?.toBuilder();
      _category = _$v.category?.toBuilder();
      _version = _$v.version;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Content other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Content;
  }

  @override
  void update(void Function(ContentBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Content build() {
    _$Content _$result;
    try {
      _$result = _$v ??
          new _$Content._(
              id: id,
              title: title,
              url: pdfUrl,
              subject: _subject?.build(),
              category: _category?.build(),
              version: version);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'subject';
        _subject?.build();
        _$failedField = 'category';
        _category?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Content', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$User extends User {
  @override
  final String uid;
  @override
  final String name;
  @override
  final String email;
  @override
  final String photoUrl;
  @override
  final Standard standard;
  @override
  final bool isAnonymous;

  factory _$User([void Function(UserBuilder) updates]) =>
      (new UserBuilder()..update(updates)).build();

  _$User._(
      {this.uid,
      this.name,
      this.email,
      this.photoUrl,
      this.standard,
      this.isAnonymous})
      : super._();

  @override
  User rebuild(void Function(UserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBuilder toBuilder() => new UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        uid == other.uid &&
        name == other.name &&
        email == other.email &&
        photoUrl == other.photoUrl &&
        standard == other.standard &&
        isAnonymous == other.isAnonymous;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, uid.hashCode), name.hashCode), email.hashCode),
                photoUrl.hashCode),
            standard.hashCode),
        isAnonymous.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('User')
          ..add('uid', uid)
          ..add('name', name)
          ..add('email', email)
          ..add('photoUrl', photoUrl)
          ..add('standard', standard)
          ..add('isAnonymous', isAnonymous))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _photoUrl;
  String get photoUrl => _$this._photoUrl;
  set photoUrl(String photoUrl) => _$this._photoUrl = photoUrl;

  StandardBuilder _standard;
  StandardBuilder get standard => _$this._standard ??= new StandardBuilder();
  set standard(StandardBuilder standard) => _$this._standard = standard;

  bool _isAnonymous;
  bool get isAnonymous => _$this._isAnonymous;
  set isAnonymous(bool isAnonymous) => _$this._isAnonymous = isAnonymous;

  UserBuilder();

  UserBuilder get _$this {
    if (_$v != null) {
      _uid = _$v.uid;
      _name = _$v.name;
      _email = _$v.email;
      _photoUrl = _$v.photoUrl;
      _standard = _$v.standard?.toBuilder();
      _isAnonymous = _$v.isAnonymous;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(User other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$User;
  }

  @override
  void update(void Function(UserBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$User build() {
    _$User _$result;
    try {
      _$result = _$v ??
          new _$User._(
              uid: uid,
              name: name,
              email: email,
              photoUrl: photoUrl,
              standard: _standard?.build(),
              isAnonymous: isAnonymous);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'standard';
        _standard?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'User', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
