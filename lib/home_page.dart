import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app1/video_info.dart';
import 'package:get/get.dart';
import 'colors.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info =[];
  
  _initData(){
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value){
      info = json.decode(value);
    });
  }

  @override
  void initState(){
    super.initState();
    _initData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 30,right: 30),
        child: Column(
          children: [
            Row(
              children: [
                Text("Training",
                style: TextStyle(
                  fontSize: 30,
                  color: color.AppColor.homePageTitle,
                  fontWeight: FontWeight.w700
                ),
                ),
                Expanded(child: Container()),
                Icon(Icons.arrow_back_ios,
                size: 20,
                color: color.AppColor.homePageIcons),
                const SizedBox(width: 10,),

                Icon(Icons.calendar_today_outlined,
                size: 20,
                color: color.AppColor.homePageIcons),
                const SizedBox(width: 15,),

                Icon(Icons.arrow_forward_ios,
                    size: 20,
                    color: color.AppColor.homePageIcons)
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Text("Your Program",
                  style: TextStyle(
                      fontSize: 20,
                      color: color.AppColor.homePageSubtitle,
                      fontWeight: FontWeight.w700
                  ),
                ),
                Expanded(child: Container()),
                Text("Details ",
                  style: TextStyle(
                      fontSize: 20,
                      color: color.AppColor.homePageSubtitle
                  ),
                ),
                InkWell(
                  onTap: (){
                    Get.to(()=>VideoInfo());
                  },
                  child: Icon(Icons.arrow_forward,
                      size: 20,
                      color: color.AppColor.homePageIcons),
                )
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 220,
              decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    color.AppColor.gradientFirst,
                    color.AppColor.gradientSecond
                  ]
              ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(80)
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(5,10),
                    blurRadius: 20,
                    color: color.AppColor.gradientSecond
                  )
                ]
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 15, top: 25,right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Next Workout",
                      style: TextStyle(
                        fontSize: 16,
                        color: color.AppColor.homePageContainerTextSmall
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Text("Legs Toning",
                      style: TextStyle(
                          fontSize: 25,
                          color: color.AppColor.homePageContainerTextSmall
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Text("and Glutes Workout",
                      style: TextStyle(
                          fontSize: 25,
                          color: color.AppColor.homePageContainerTextSmall
                      ),
                    ),
                    const SizedBox(height: 25,),
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.timer,size: 20, color: color.AppColor
                                .homePageContainerTextSmall,),
                            const SizedBox(width: 10,),
                            Text("60 min",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: color.AppColor.homePageContainerTextSmall
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            boxShadow:[
                              BoxShadow(
                                color: color.AppColor.gradientFirst,
                                blurRadius: 10,
                                offset: const Offset(4,8),
                              )
                            ]
                          ),
                        child: const Icon(
                          Icons.play_circle_fill,color: Colors.white,
                          size: 50,),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 30),
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                          image: AssetImage("assets/card.jpg"),
                        fit: BoxFit.fill
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 40,
                          offset: const Offset(8,10),
                          color: color.AppColor.gradientSecond.withOpacity(0.3)
                        ),
                        BoxShadow(
                            blurRadius: 10,
                            offset: const Offset(-1,-5),
                            color: color.AppColor.gradientSecond.withOpacity(0.3)
                        ),
                      ]
                    ),
                  ),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(right: 200,bottom: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(image: AssetImage(
                        "assets/figure.png"
                      ))
                    )
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 100,
                    margin: const EdgeInsets.only(left: 150,top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("You are doing great",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: color.AppColor.homePageDetail
                          ),
                        ),
                        const SizedBox(height: 10,),
                        RichText(text: TextSpan(
                          text: "Keep it up\n",
                          style: TextStyle(
                            color: color.AppColor.homePagePlanColor,
                            fontSize: 16
                          ),
                          children: const [
                            TextSpan(
                              text: "stick to your plan"
                            )
                          ]
                        ),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Text("Area Of Focus",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: color.AppColor.homePageTitle
                ),
                )
              ],
            ),
            Expanded(child: OverflowBox(
              maxWidth: MediaQuery.of(context).size.width,
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                  itemCount: info.length.toDouble()~/2,
                    itemBuilder: (_, i){

                    int a = 2*i;
                    int b = 2*i + 1;
                      return Row(
                        children: [
                          Container(
                            width: (MediaQuery.of(context).size.width-90)/2,
                            height: 170,
                            margin: const EdgeInsets.only(left: 30,bottom: 15,top: 15),
                            padding: const EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(
                                  info[a]['img']
                                )
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  offset: const Offset(5,5),
                                  color: color.AppColor.gradientSecond.withOpacity(0.1)
                                ),
                                BoxShadow(
                                    blurRadius: 3,
                                    offset: const Offset(-5,-5),
                                    color: color.AppColor.gradientSecond.withOpacity(0.1)
                                )
                              ]
                            ),
                            child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  info[a]["title"],
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: color.AppColor.homePageDetail
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: (MediaQuery.of(context).size.width-90)/2,
                            height: 170,
                            margin: const EdgeInsets.only(left: 30,bottom: 15,top: 15),
                            padding: const EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: AssetImage(
                                        info[b]['img']
                                    )
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 3,
                                      offset: const Offset(5,5),
                                      color: color.AppColor.gradientSecond.withOpacity(0.1)
                                  ),
                                  BoxShadow(
                                      blurRadius: 3,
                                      offset: const Offset(-5,-5),
                                      color: color.AppColor.gradientSecond.withOpacity(0.1)
                                  )
                                ]
                            ),
                            child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  info[b]["title"],
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: color.AppColor.homePageDetail
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    }),
              ),
            )
            )
          ],
        ),
      )
    );
  }
}
