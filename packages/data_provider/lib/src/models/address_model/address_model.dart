// ignore_for_file: public_member_api_docs, sort_constructors_first, lines_longer_than_80_chars, must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'address_model.g.dart';

/*
  Hive type must be between 0 and 223
*/

/// Address model to store user addresses
@HiveType(typeId: 0)
class AddressModel extends Equatable with HiveObjectMixin {
  @HiveField(0)
  final String uuid;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String address;

  AddressModel({
    required this.name,
    required this.address,
    String? uuid,
  }) : uuid = uuid ?? const Uuid().v4();

  @override
  List<Object?> get props => [uuid, name, address];

  AddressModel copyWith({
    String? uuid,
    String? name,
    String? address,
  }) {
    return AddressModel(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      address: address ?? this.address,
    );
  }
}
