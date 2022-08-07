import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techblogtest/gen/assets.gen.dart';
import 'package:techblogtest/models/fack_data.dart';
import 'package:techblogtest/my_component.dart';
import 'package:techblogtest/my_strings.dart';

import '../my_colors.dart';

class MyCats extends StatefulWidget {
  const MyCats({Key? key,

  }) : super(key: key);


  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
     List myList = listTags;
     List selMyList=selListTags;
    TextTheme textThem = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            SizedBox(
                height: 122, child: SvgPicture.asset(Assets.images.tcbot.path)),
            const SizedBox(
              height: 30,
            ),
            Text(
              MyStrings.successfulRegistration,
              style: textThem.headline4,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: TextField(
                onChanged: (value) {},
                style: textThem.headline5,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: MyStrings.nameAndFamily,
                    hintStyle: textThem.headline5),
              ),
            ),
            SizedBox(
              height: size.height / 50,
            ),
            Text(
              MyStrings.chooseCats,
              style: textThem.headline4,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: SizedBox(
                width: double.infinity,
                height: size.height / 10,
                child: GridView.builder(
                    itemCount: myList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const ClampingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            childAspectRatio: .25),
                    itemBuilder: ((context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            bool pointer=false;
                            pointer = selMyList.contains(myList[index]);
                            print(pointer);


                            if (pointer==false) {
                              selMyList.add(myList[index]);
                            }

                            //print(selMyList[index].toString());


                          });
                        },
                        child: WidgetLIstHashTag(
                          size: size,
                          index: index,
                          textTheme: textThem,
                          myList: myList,
                          myGradiantColors: GradiantColors.tags,
                          colorTextAndIcon: SolidColors.lightColor,
                        ),
                      );
                    })),
              ),
            ),
            const Icon(
              Icons.arrow_downward,
              size: 100,
            ),
            SizedBox(
              width: double.infinity,
              height: size.height / 10,
              child: GridView.builder(
                  itemCount: selMyList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,

                  physics:  const ClampingScrollPhysics(),
                  gridDelegate:
                   const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2 ,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: .25),
                  itemBuilder: ((context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {

                          selMyList.removeAt(index);
                          //print(selMyList[index].toString());


                        });
                      },
                      child: WidgetLIstHashTag(
                        size: size,
                        index: index,
                        textTheme: textThem,
                        myList: selMyList,
                        myGradiantColors: GradiantColors.seltags,
                        colorTextAndIcon: SolidColors.lightColor,

                      ),
                    );
                  })),
            ),
          ],
        ),
      ),
    );
  }
}
