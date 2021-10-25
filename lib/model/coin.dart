import 'package:equatable/equatable.dart';

class Coin extends Equatable {
  final String imageUrl;
  final String name;
  final String abbreviatedName;
  final String priceInDollar;

  Coin(
      {required this.imageUrl,
      required this.name,
      required this.abbreviatedName,
      required this.priceInDollar});

  @override
  List<Object?> get props => [imageUrl, name, abbreviatedName, priceInDollar];
}
