import 'package:json_annotation/json_annotation.dart';

part 'example_json.g.dart';

@JsonSerializable()
class Example {
  Example({required this.example});

  final String example;

  factory Example.fromJson(Map<String, dynamic> json) =>
      _$ExampleFromJson(json);

  Map<String, dynamic> toJson() => _$ExampleToJson(this);
}
