import 'package:flutter/material.dart';
import 'package:flutter_dapp/widgets/ArCoreController.dart';
class ARTourGuidePage extends StatefulWidget {
  const ARTourGuidePage({Key? key}) : super(key: key);

  @override
  _ARTourGuidePageState createState() => _ARTourGuidePageState();
}

class _ARTourGuidePageState extends State<ARTourGuidePage> {
  @override
  Widget build(BuildContext context) {
    return ARCoreController();
  }
}
