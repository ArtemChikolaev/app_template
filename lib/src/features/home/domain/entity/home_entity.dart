class HomeEntity {
  const HomeEntity({
    required this.title,
    required this.description,
  });

  /// Title text that will be shown on the Home page.
  final String title;

  /// Additional description or subtitle for the Home page.
  final String description;
}