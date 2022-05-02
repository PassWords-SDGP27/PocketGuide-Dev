import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  var count = 57;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return const IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: null);
          },
        ),
        centerTitle: true,
        title: const Text(
          'Reviews',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: const [
          IconButton(
              icon: Icon(
                Icons.info,
                color: Colors.black,
              ),
              onPressed: null)
        ],
        toolbarHeight: 60,
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ratingstar(count),
          horizontalbars('Excellent', 0.9, Colors.green),
          horizontalbars('Good', 0.75, Colors.lightGreen),
          horizontalbars('Average', 0.5, Colors.yellow),
          horizontalbars('Below Average', 0.35, Colors.orangeAccent),
          horizontalbars('Poor', 0.2, Colors.red),
          const Divider(
            indent: 40,
            endIndent: 40,
            thickness: 1.5,
          ),
          reviewslist()
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        icon: const Icon(
          Icons.edit,
          color: Colors.white,
        ),
        label: const Text('Add a Review'),
        onPressed: () {
          //TODO
          modalBottomSheet(context);
        },
      ),
    );
  }
}

reviewslist() {
  return Expanded(
    child: ListView(
      children: [
        feedback(),
        feedback(),
        feedback(),
        feedback(),
        feedback(),
        feedback(),
        feedback()
      ],
    ),
  );
}

feedback() {
  return Container(
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/image/cus2.jpg'),
                            fit: BoxFit.cover)),
                    padding: const EdgeInsets.all(30),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          ' John Person',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        stars(),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                  alignment: Alignment.bottomRight,
                  child: const Text(
                    '1 days ago',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontStyle: FontStyle.italic),
                  ))
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: const Text(
            'This chair is a great addition for any room in your home,not only just the living room. Featuring a mid-centuary design with modern available in the market. however and with that said, if you are like most people in the...',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ),
      ],
    ),
  );
}

Container ratingstar(var count) {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: const BoxDecoration(
      color: Colors.white,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          '4.5',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
        ),
        Padding(
          child: stars(),
          padding: const EdgeInsets.only(top: 10, bottom: 10),
        ),
        Text(
          'based on $count reviews',
          style:
              const TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
        ),
      ],
    ),
  );
}

stars() {
  return Container(
    padding: const EdgeInsets.only(top: 0, bottom: 0),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
       
        Icon(
          Icons.star_rounded,
          color: Colors.orangeAccent,
        ),
        Icon(
          Icons.star_rounded,
          color: Colors.orangeAccent,
        ),
        Icon(
          Icons.star_rounded,
          color: Colors.orangeAccent,
        ),
        Icon(
          Icons.star_rounded,
          color: Colors.orangeAccent,
        ),
        Icon(
          Icons.star_rounded,
          color: Colors.orangeAccent,
        ),
      ],
    ),
  );
}

Container horizontalbars(String text, double val, Color cx) {
  return Container(
      child: Column(
    children: [
      Container(
        padding: const EdgeInsets.only(left: 15, bottom: 5, right: 15),
        child: Row(
          children: [
            SizedBox(
                width: 100,
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                )),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: LinearProgressIndicator(
                  semanticsLabel: 'Excellent',
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(cx),
                  value: val,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  ));
}

void modalBottomSheet(context) {
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
        return SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * .70,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0)),
                color: Colors.white),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                padding: const EdgeInsets.all(15),
                child: const Divider(
                  indent: 130,
                  endIndent: 130,
                  thickness: 7,
                  color: Colors.black54,
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Please Rate Your Experience',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )),
              clickablestars(),
              Container(
                padding: const EdgeInsets.only(top: 50),
                child: const Text(
                  'Please Share Your Opinion',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    backgroundColor: Colors.white12,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    hintText: 'Your review',
                    contentPadding: const EdgeInsets.all(20),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                padding: const EdgeInsets.only(top: 70),
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.only(
                                left: 20, right: 20, top: 20, bottom: 20))),
                    child: const Text(
                      'Submit',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ]),
          ),
        );
      });
}

clickablestars() {
  bool isClicked = true;
  return Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      IconButton(
          icon: const Icon(
            Icons.star_border,
            color: Colors.orangeAccent,
            size: 40,
          ),
          onPressed: () {}),
      IconButton(
          icon: const Icon(
            Icons.star_border,
            color: Colors.orangeAccent,
            size: 40,
          ),
          onPressed: () {}),
      IconButton(
          icon: const Icon(
            Icons.star_border,
            color: Colors.orangeAccent,
            size: 40,
          ),
          onPressed: () {}),
      IconButton(
          icon: const Icon(
            Icons.star_border,
            color: Colors.orangeAccent,
            size: 40,
          ),
          onPressed: () {}),
      IconButton(
          icon: const Icon(
            Icons.star_border,
            color: Colors.orangeAccent,
            size: 40,
          ),
          onPressed: () {}),


    ],
  );
}