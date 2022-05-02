class PopularModel {
  String name;
  String image;

  PopularModel(this.name, this.image);
}

/*List<String> imagesPop = [
  "https://images.unsplash.com/photo-1579989197111-928f586796a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1168&q=80"
];*/

List<PopularModel> populars = popularsData
    .map((item) =>
        PopularModel(item['name'].toString(), item['image'].toString()))
    .toList();

var popularsData = [
  {
    "name": "Galle, Sri Lanka",
    "image":
        "https://images.unsplash.com/photo-1579989197111-928f586796a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1168&q=80",
  },
  {
    "name": "Kandy, Sri Lanka",
    "image":
          "https://images.unsplash.com/photo-1642095012223-65ee6d570974?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80"
  },
  {
    "name": "Negombo, Sri Lanka",
    "image":
        "https://images.unsplash.com/photo-1581420456035-58b8efadcdea?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80"
  }
];
