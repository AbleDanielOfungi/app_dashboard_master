import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../common/widgets/appbar_icons.dart';

PreferredSizeWidget? DesktopAppBar(BuildContext context, bool hasLeading) {
  return PreferredSize(
    preferredSize: Size(MediaQuery.of(context).size.width, 130),
    child: AppBar(
      automaticallyImplyLeading: hasLeading,
      titleSpacing: 0,
      toolbarHeight: 130,
      backgroundColor: Colors.white,
      title: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0XFFd6eadf)),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0XFFd6eadf)),
              ),
              // width: Get.width * 0.249,
              width: 250,
              height: Get.height,
              child: Center(
                  child: Image.asset(
                'assets/logo1.webp',
                width: 120,
                height: 120,
              )),
            ),
            Expanded(
              child: Container(
                width: Get.width * 0.75,
                height: 130,
                decoration: BoxDecoration(
                  // color: Colors.green,
                  color: const Color(0Xffefefef),
                  border: Border.all(
                    color: const Color(0XFFd6eadf),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      // width: 350,
                      constraints: const BoxConstraints(maxWidth: 350),
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextFormField(
                        onTap: () {},
                        textAlignVertical: TextAlignVertical.bottom,
                        // controller: controller,
                        style: const TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          prefixIcon: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10),
                            child: FaIcon(
                              FontAwesomeIcons.magnifyingGlass,
                              color: Color(0Xff5eaa83),
                            ),
                          ),
                          hintText: 'Search your grocery products...',
                          hintStyle: const TextStyle(
                            color: Color(0XFfd7d7d7),
                          ),
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(204, 204, 204, 0.6)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(204, 204, 204, 0.6)),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const AppBarIcons(),
                        Container(
                          // width: 80,
                          // height: 80,
                          constraints: const BoxConstraints(
                            maxHeight: 80,
                            maxWidth: 80,
                          ),
                          margin: const EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/stich.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 3),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
