enum FieldType {
  text(name: 'text', mask: ''),
  maskPrice(name: 'mask-price', mask: 'R\$ 000,00'),
  maskDate(name: 'mask-date', mask: '00/00/0000');

  const FieldType({required this.name, required this.mask});

  final String name;
  final String mask;
}
