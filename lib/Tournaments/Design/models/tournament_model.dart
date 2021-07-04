class Tournament {
  String name;
  String description;
  DateTime date;
  String image;
  String location;
  String organizer;
  String category;
  String criteria;

  Tournament(
      {this.date,
      this.image,
      this.location,
      this.name,
      this.organizer,
      this.description,
      this.category,
      this.criteria});
}

final List<Tournament> nearbyTournaments = [
  Tournament(
    name: "Tennis",
    date: DateTime.now().add(const Duration(days: 21)),
    image: 'https://source.unsplash.com/600x800/?tennis',
    description: "Tournament rules are:"
        "8 teams",
    location: "Green Field",
    organizer: "Hosam Abed Al Latif",
    category: "Sports",
    criteria: "Team",
  ),
  Tournament(
    name: "Basketball",
    date: DateTime.now().add(const Duration(days: 21)),
    image: 'https://source.unsplash.com/600x800/?basketball',
    description: "Tournament rules are: ",
    location: "Gaming lau",
    organizer: "Hosam Abed Al Latif",
    category: "Sports",
    criteria: "Team",
  ),
  Tournament(
    name: "Football",
    date: DateTime.now().add(const Duration(days: 21)),
    image: 'https://source.unsplash.com/600x800/?football',
    description: "Tournament rules are: ",
    location: "Green Field",
    organizer: "Hosam Abed Al Latif",
    category: "Sports",
    criteria: "Team",
  ),
  Tournament(
    name: "Programming",
    date: DateTime.now().add(const Duration(days: 21)),
    image: 'https://source.unsplash.com/600x800/?programming',
    description: "Tournament rules are: ",
    location: "Green Field",
    organizer: "Hosam Abed Al Latif",
    category: "Programming",
    criteria: "Solo",
  ),
  Tournament(
    name: "Chess",
    date: DateTime.now().add(const Duration(days: 21)),
    image: 'https://source.unsplash.com/600x800/?chess',
    description: "Tournament rules are: ",
    location: "Green Field",
    organizer: "Hosam Abed Al Latif",
    category: "Sports",
    criteria: "Solo",
  ),
  Tournament(
    name: "Dama",
    date: DateTime.now().add(const Duration(days: 21)),
    image: 'https://source.unsplash.com/600x800/?dama',
    description: "Tournament rules are: ",
    location: "Green Field",
    organizer: "Hosam Abed Al Latif",
    category: "Sports",
    criteria: "Solo",
  ),
  Tournament(
    name: "PUBG",
    date: DateTime.now().add(const Duration(days: 21)),
    image: 'https://source.unsplash.com/600x800/?pubg',
    description: "Tournament rules are: ",
    location: "Green Field",
    organizer: "Hosam Abed Al Latif",
    category: "Gaming",
    criteria: "Team",
  ),
];
