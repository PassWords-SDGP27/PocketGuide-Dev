class DestinationModel {
  String name;
  String tagLine;
  String image;
  List<String> images;
  String description;


  DestinationModel(this.name, this.tagLine, this.image, this.images,
      this.description);
}

List<DestinationModel> destinations = destinationsData
    .map((item) => DestinationModel(item['name'], item['tagLine'],
    item['image'], item['images'], item['description']))
    .toList();

var destinationsData = [
  
  {
    "name": "Ella, Sri Lanka",
    "tagLine": "Paradise With Beauty",
    "image":
    "https://images.unsplash.com/photo-1566296314736-6eaac1ca0cb9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1228&q=80https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
    "images": [
      "https://i.pinimg.com/564x/74/2d/9f/742d9f7897432df44c0d4fc38cd5355a.jpg",
      "https://i.pinimg.com/564x/e6/58/73/e65873ea80055be9181a3e9d31ebba77.jpg",
      "https://i.pinimg.com/564x/d2/da/4b/d2da4b33cfcf1307d9f19e6da8a0f959.jpg"
    ],
    "description":
    "Ella is a small village in the highlands of Sri Lanka which is filled with tea estates, mountains, waterfalls and of course with some good air to breath.",
  },
];
