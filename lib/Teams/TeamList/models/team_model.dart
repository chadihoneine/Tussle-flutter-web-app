class Team {
  String name;
  String description;
  String image;
  String location;
  String type;
  num members;

  Team(
      {this.image,
      this.location,
      this.name,
      this.members,
      this.description,
      this.type});
}

final List<Team> teamList = [
  Team(
    name: "Team 1",
    image: 'https://source.unsplash.com/600x800/?football',
    description: "Team Description",
    location: "Location ",
    type: "Competitive",
    members: 4,
  ),
  Team(
    name: "Team 2",
    image: 'https://source.unsplash.com/600x800/?tennis',
    description: "Team Description",
    location: "Location ",
    type: "Competitive",
    members: 4,
  ),
  Team(
    name: "Team 3",
    image: 'https://source.unsplash.com/600x800/?pubg',
    description: "Team Description",
    location: "Location ",
    type: "Competitive",
    members: 4,
  ),
  Team(
    name: "Team 4",
    image: 'https://source.unsplash.com/600x800/?volly',
    description: "Team Description",
    location: "Location ",
    type: "Competitive",
    members: 4,
  ),
  Team(
    name: "Team 5",
    image: 'https://source.unsplash.com/600x800/?swim',
    description: "Team Description",
    location: "Location ",
    type: "Competitive",
    members: 4,
  ),
  Team(
    name: "Team 6",
    image: 'https://source.unsplash.com/600x800/?game',
    description: "Team Description",
    location: "Location ",
    type: "Competitive",
    members: 4,
  ),
  Team(
    name: "Team 7",
    image: 'https://source.unsplash.com/600x800/?programming',
    description: "Team Description",
    location: "Location ",
    type: "Competitive",
    members: 4,
  ),
];
