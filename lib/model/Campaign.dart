class Campaign{
  final String title;
  final String category;
  final String shortDescription;
  final String targetAmount;
  final DateTime startDate;
  final DateTime endDate;
  final String country;
  final String currencyType;

  Campaign(
      {required this.title,
      required this.category,
      required this.targetAmount,
      required this.startDate,
      required this.shortDescription,
      required this.endDate,
      required this.country,
      required this.currencyType});


}