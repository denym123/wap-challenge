enum FieldType {
  text(name: 'text', mask: 'X+', isReverse: false),
  maskPrice(name: 'mask_price', mask: 'R\$! !9+,99', isReverse: true),
  maskDate(name: 'mask_date', mask: '99/99/9999', isReverse: false);

  const FieldType({
    required this.name,
    required this.mask,
    required this.isReverse,
  });

  final String name;
  final String mask;
  final bool isReverse;
}
