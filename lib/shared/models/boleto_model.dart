import 'dart:convert';

class BoletoModel {
  factory BoletoModel.fromJson(String source) =>
      BoletoModel.fromMap(json.decode(source));

  factory BoletoModel.fromMap(Map<String, dynamic> map) {
    return BoletoModel(
      name: map['name'],
      dueDate: map['dueDate'],
      value: map['value'],
      barcode: map['barcode'],
    );
  }

  factory BoletoModel.empty() {
    return BoletoModel(
      name: '',
      dueDate: '',
      value: 0,
      barcode: '',
    );
  }

  BoletoModel({
    required this.name,
    required this.dueDate,
    required this.value,
    required this.barcode,
  });

  final String name;
  final String dueDate;
  final double value;
  final String barcode;

  BoletoModel copyWith({
    String? name,
    String? dueDate,
    double? value,
    String? barcode,
  }) {
    return BoletoModel(
      name: name ?? this.name,
      dueDate: dueDate ?? this.dueDate,
      value: value ?? this.value,
      barcode: barcode ?? this.barcode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dueDate': dueDate,
      'value': value,
      'barcode': barcode,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BoletoModel &&
        other.name == name &&
        other.dueDate == dueDate &&
        other.value == value &&
        other.barcode == barcode;
  }

  @override
  int get hashCode {
    return name.hashCode ^ dueDate.hashCode ^ value.hashCode ^ barcode.hashCode;
  }

  @override
  String toString() {
    return 'BoletoModel(name: $name, dueDate: $dueDate, value: $value, barcode: $barcode)';
  }
}
