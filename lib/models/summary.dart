import 'package:json_annotation/json_annotation.dart';

part 'summary.g.dart';

@JsonSerializable()
class Summary {

  Summary({
    this.id,
    this.cdi,
    this.gain,
    this.hasHistory,
    this.profitability,
    this.total
  });

  int id;
  double profitability;
  double total;
  bool hasHistory;
  double gain;
  double cdi;

  factory Summary.fromJson(Map<String, dynamic> json) => _$SummaryFromJson(json);
  Map<String, dynamic> toJson() => _$SummaryToJson(this);
}