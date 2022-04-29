class RecommendedModel {
  String name;
  String tagLine;
  String image;
  String description;

  RecommendedModel(this.name, this.tagLine, this.image, this.description);
}

List<RecommendedModel> recommendations = recommendationsData
    .map((item) => RecommendedModel(
        item['name'].toString(),
        item['tagLine'].toString(),
        item['image'].toString(),
        item['description'].toString()))
    .toList();

var recommendationsData = [
  {
    "name": "Sigiriya, Sri Lanka",
    "tagLine": "The Lion's Rock",
    "image":
        "https://images.unsplash.com/photo-1588598198321-9735fd52455b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    "description":
        "Sigiriya or Sinhagiri is an ancient rock fortress located in the northern Matale District near the town of Dambulla in the Central Province.",
  },
  {
    "name": "Ella, Sri Lanka",
    "tagLine": "Paradise With Beauty",
    "image":
        "https://images.unsplash.com/photo-1566296314736-6eaac1ca0cb9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1228&q=80",
    "description":
        "Ella is a small village in the highlands of Sri Lanka which is filled with tea estates, mountains, waterfalls and of course with some good air to breath.",
  },
  {
    "name": "Nuwara Eliya, Sri Lanka",
    "tagLine": "Little England",
    "image":
        "https://images.unsplash.com/photo-1586193804147-64d5c02ef9c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
 
    "description":
        "This genteel highland community does have a rose-tinted, vaguely British-country-village feel to it.",
  },
];
