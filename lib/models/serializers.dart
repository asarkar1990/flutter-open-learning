library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:ncert/models/time_stamp_serializer_plugin.dart';

import 'model.dart';

part 'serializers.g.dart';

@SerializersFor(const [Standard, User, Content, Subject])
final Serializers serializers = (_$serializers.toBuilder()
      ..add(TimestampSerializer())
      ..addPlugin(StandardJsonPlugin()))
    .build();
