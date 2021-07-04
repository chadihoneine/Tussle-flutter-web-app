class Event {
  String name;
  String description;
  DateTime eventDate;
  String image;
  String location;
  String organizer;
  Event(
      {this.eventDate,
      this.image,
      this.location,
      this.name,
      this.organizer,
      this.description});
}

final List<Event> nearbyEvents = [
  Event(
    name: "Seminars",
    eventDate: DateTime.now().add(const Duration(days: 1)),
    image: 'https://source.unsplash.com/600x800/?night',
    description: "Event description",
    location: "Location ",
    organizer: "Chadi Honeine",
  ),
  Event(
    name: "Conferences",
    eventDate: DateTime.now().add(const Duration(days: 1)),
    image: 'https://source.unsplash.com/600x800/?conferences',
    description: "Event description",
    location: "Location ",
    organizer: "Jad Rawas",
  ),
  Event(
    name: "Trade shows",
    eventDate: DateTime.now().add(const Duration(days: 1)),
    image: 'https://source.unsplash.com/600x800/?tradeshows',
    description: "Event description",
    location: "Location ",
    organizer: "Mohammad Sonji",
  ),
  Event(
    name: "Workshops",
    eventDate: DateTime.now().add(const Duration(days: 1)),
    image: 'https://source.unsplash.com/600x800/?workshops',
    description: "Event description",
    location: "Location ",
    organizer: "Hosam Abed Al Latif",
  ),
  Event(
    name: "Reunions",
    eventDate: DateTime.now().add(const Duration(days: 1)),
    image: 'https://source.unsplash.com/600x800/?reunions',
    description: "Event description",
    location: "Location ",
    organizer: "Chadi Honeine",
  ),
  Event(
    name: "Themed parties",
    eventDate: DateTime.now().add(const Duration(days: 1)),
    image: 'https://source.unsplash.com/600x800/?themedparties',
    description: "Event description",
    location: "Location ",
    organizer: "Jad Rawas",
  ),
  Event(
    name: "Classes",
    eventDate: DateTime.now().add(const Duration(days: 1)),
    image: 'https://source.unsplash.com/600x800/?classes',
    description:
        "From twerking to wine tasting, there’s an online class for almost everything. Extra points to consider for a virtual class are whether you need to send out samples (for food or drink tastings), if your students need any special tools (for a cookery or pottery class), and how well your technology works. For example, you may need to invest in higher-quality audio devices so that attendees can clearly hear you.",
    location: "Location ",
    organizer: "Mohammad Sonji",
  ),
];
