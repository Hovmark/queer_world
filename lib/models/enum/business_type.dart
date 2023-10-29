enum BusinessType {
  business(title: "Business"),
  volontaryOrgnisation(title: "Volontary orgnisation"),
  meetup(title: "Meetup"),
  other(title: "Other");

  final String title;
  const BusinessType({required this.title});
  static const fieldName = "businessType";

  factory BusinessType.fromString(String string) {
    return BusinessType.values
        .firstWhere((e) => e.toString() == "BusinessType.$string");
  }
  factory BusinessType.fromJson(Map<String, Object?> json) {
    return BusinessType.values
        .firstWhere((e) => e.toString() == json[fieldName]);
  }
}
