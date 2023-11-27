import 'package:animal/app/Bindings/ProfileBinding.dart';
import 'package:animal/config.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileBinding> {
  const ProfilePage({super.key});
  Widget TextWidget(String string){
    return Text(string,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),);
  }
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    var width = Config.screenWidth;
    var height = Config.screenHeight;
    return SizedBox(
      height: height,
      width: width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height! * 0.1,
            ),
            Text("Profile",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
            Container(
              height: height * 0.2,
              width: Config.screenWidth,
              color: Colors.red,
              child: Image.asset('assets/images/img_1.png'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width! * 0.06),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    SizedBox(height: height*0.035,),
                  const Text("Huffu",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                  SizedBox(height: height*0.02,),
                  TextWidget('Holstein Friesian'),
                  SizedBox(height: height*0.02,),
                   Row(
                    children: [
                      TextWidget('Male'),
                      SizedBox(width: 20),
                      TextWidget('20kg'),
                      SizedBox(width: 20,),
                      TextWidget('Jan16,2023'),
                    ],
                  ),
                  SizedBox(height: height*0.02,),
                  FadeInUp(
                      duration: const Duration(milliseconds: 1600),
                      child: MaterialButton(
                        onPressed: () {},
                        height: height*0.05,
                        color: Colors.orange[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Center(
                          child: Text(
                            "Edit Profile",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                  ),
                  SizedBox(height: height*0.02,),
                  SizedBox(
                    height: Config.screenHeight! * 0.04,
                    width: Config.screenWidth,
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Medical Records"),
                          Icon(Icons.navigate_next,size: 30)
                        ],
                      ),
                    ),
                  ),
                  Divider(thickness: width! * 0.003,color: Colors.black),
                  SizedBox(
                    height: Config.screenHeight! * 0.04,
                    width: Config.screenWidth,
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Track Orders"),
                          Icon(Icons.navigate_next,size: 30,)
                        ],
                      ),
                    ),
                  ),
                  Divider(thickness: width! * 0.003,color: Colors.black),
                  Container(
                    height: Config.screenHeight! * 0.04,
                    width: Config.screenWidth,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget("Vaccine schedules"),
                          const Icon(Icons.navigate_next,size: 30)
                        ],
                      ),
                    ),
                  ),
                  Divider(thickness: width! * 0.003,color: Colors.black),
                  SizedBox(
                    height: Config.screenHeight! * 0.04,
                    width: Config.screenWidth,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget("Scheduled Visits"),
                          const Icon(Icons.navigate_next,size: 30)
                        ],
                      ),
                    ),
                  ),
                  Divider(thickness: width! * 0.003,color: Colors.black),
                  Container(
                    height: Config.screenHeight! * 0.04,
                    width: Config.screenWidth,
                    child:Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget("Care Plans"),
                          const Icon(Icons.navigate_next,size: 30)
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
