import 'package:animal/app/Bindings/ProfileBinding.dart';
import 'package:animal/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AssistancePage extends GetView<ProfileBinding> {
  const AssistancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Config.screenWidth,
      width: Config.screenWidth,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text('Assistance page'),
            Container(height: 200,width: Config.screenWidth,color: Colors.red,),
            Container(height: 200,width: Config.screenWidth,color: Colors.blue,),
            Container(height: 200,width: Config.screenWidth,color: Colors.red,),
            Container(height: 200,width: Config.screenWidth,color: Colors.blue,),
            Container(height: 200,width: Config.screenWidth,color: Colors.red,),
            Container(height: 200,width: Config.screenWidth,color: Colors.blue,),
            Container(height: 200,width: Config.screenWidth,color: Colors.red,),
            Container(height: 200,width: Config.screenWidth,color: Colors.blue,)
          ],
        ),
      ),
    );
  }
}
