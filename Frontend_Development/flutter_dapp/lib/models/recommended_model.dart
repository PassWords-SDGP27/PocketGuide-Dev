class RecommendedModel {
  String name;
  String tagLine;
  String image;
  String description;

  RecommendedModel(
      this.name, this.tagLine, this.image, this.description);
}

List<String> images = [
  "https://images.unsplash.com/photo-1588598198321-9735fd52455b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
];

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
    "images": [
      "https://i.pinimg.com/564x/52/55/76/525576cec5d1badde1238a6a208ce860.jpg",
      "https://i.pinimg.com/564x/b5/f9/cc/b5f9cce095f1ff6cfa08168801dbe6e5.jpg",
      "https://i.pinimg.com/564x/a1/56/b2/a156b202f8bfd7da3d4767af30daf13f.jpg"
    ],
    "description":
        "Sigiriya or Sinhagiri is an ancient rock fortress located in the northern Matale District near the town of Dambulla in the Central Province.",
  },
  {
    "name": "Ella, Sri Lanka",
    "tagLine": "Paradise With Beauty",
    "image":
        "https://images.unsplash.com/photo-1566296314736-6eaac1ca0cb9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1228&q=80",
    "images": [
      "https://i.pinimg.com/564x/74/2d/9f/742d9f7897432df44c0d4fc38cd5355a.jpg",
      "https://i.pinimg.com/564x/e6/58/73/e65873ea80055be9181a3e9d31ebba77.jpg",
      "https://i.pinimg.com/564x/d2/da/4b/d2da4b33cfcf1307d9f19e6da8a0f959.jpg"
    ],
    "description":
        "Ella is a small village in the highlands of Sri Lanka which is filled with tea estates, mountains, waterfalls and of course with some good air to breath.",
  },
  {
    "name": "Nuwara Eliya, Sri Lanka",
    "tagLine": "Little England",
    "image":
        "https://images.unsplash.com/photo-1586193804147-64d5c02ef9c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    "images": [
      "https://i.pinimg.com/564x/f9/6a/85/f96a85af8c05f62afa22ba41c6cb9d0f.jpg",
      "https://i.pinimg.com/564x/0e/b1/ae/0eb1aefeeb8f14f69ed52ae2b0adb6d2.jpg",
      "https://i.pinimg.com/564x/11/ae/bb/11aebbe29dd95ee4d09d19754e380d9a.jpg"
    ],
    "description":
        "This genteel highland community does have a rose-tinted, vaguely British-country-village feel to it.",
  },
];
