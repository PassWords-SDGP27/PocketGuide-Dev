import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ARCoreController extends StatefulWidget {
  static const routeName = '/arCoreScreen';
  const ARCoreController({Key? key}) : super(key: key);

  @override
  State<ARCoreController> createState() => _ARCoreControllerState();
}

class _ARCoreControllerState extends State<ARCoreController> {
  late ArCoreController arCoreController;
  late ArCoreNode node;

  void dipsose(){
    super.dispose();
    arCoreController.dispose();
    //# 20190295 I.S.U.Perera
  }

  _onArCoreViewCreated(ArCoreController controller){
    arCoreController = controller;
    _addToon(arCoreController);
    //arCoreController.onPlaneDetected = _handleOnPlaneDetected;
  }

/*_handleOnPlaneDetected(ArCorePlane plane){
  if(node!=null){
    arCoreController.removeNode(nodeName: node.name);
    //# 20190295 I.S.U.Perera
  }
  _addToon(arCoreController, plane);
}*/

  _addToon(ArCoreController controller){
    final node = ArCoreReferenceNode(
      name: 'Toon',
      object3DFileName: 'Toon.sfb',
      scale: vector.Vector3(0.5,0.5,0.5),
      position: vector.Vector3(0,-1,-1),
      rotation: vector.Vector4(0,180,0,0),
    );
    controller.addArCoreNode(node);
    //# 20190295 I.S.U.Perera
  }

  _addSphere(ArCoreController controller, ArCorePlane plane){
    final material = ArCoreMaterial(color:Colors.red);
    final sphere = ArCoreSphere(materials:[material], radius:0.2);
    node = ArCoreNode(
        name: 'Sphere',
        shape: sphere,
        position: plane.centerPose?.translation,
        rotation: plane.centerPose?.rotation
    );
    controller.addArCoreNode(node);
    //# 20190295 I.S.U.Perera
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ArCoreView(onArCoreViewCreated: _onArCoreViewCreated,
        enableUpdateListener: true,),
    );
  }//# 20190295 I.S.U.Perera
}
