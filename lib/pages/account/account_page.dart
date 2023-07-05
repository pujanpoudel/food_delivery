import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/account_widget.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../routes/route_helper.dart';
import '../../utils/dimensions.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(
          text: 'Profile', size: 24, color: Colors.white,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(
          top: Dimensions.height20,

        ),
        child: Column(
          children: [
            //profile icon
            AppIcon(icon: Icons.person,
            backgroundColor: AppColors.mainColor,
            iconColor: Colors.white,
              iconSize: Dimensions.height15*5,
              size: Dimensions.height15*10
            ),
            SizedBox(height: Dimensions.height30),
            //name
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //name
                    AccountWidget(
                      appIcon: AppIcon(icon: Icons.person,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5,
                      ),
                      bigText: BigText(text: "Pujan"),
                    ),
                    SizedBox(height: Dimensions.height20),
                    //phone
                    AccountWidget(
                      appIcon: AppIcon(icon: Icons.phone,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5,
                      ),
                      bigText: BigText(text: "9865010405"),
                    ),
                    SizedBox(height: Dimensions.height20),
                    //email
                    AccountWidget(
                      appIcon: AppIcon(icon: Icons.email,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5,
                      ),
                      bigText: BigText(text: "pujanpoudelj7@gmail.com"),
                    ),
                    SizedBox(height: Dimensions.height20),
                    //address
                    AccountWidget(
                      appIcon: AppIcon(icon: Icons.location_on,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5,
                      ),
                      bigText: BigText(text: "khairahani-5"),
                    ),
                    SizedBox(height: Dimensions.height20),
                    //message
                    AccountWidget(
                      appIcon: AppIcon(icon: Icons.message_outlined,
                        backgroundColor: Colors.redAccent,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5,
                      ),
                      bigText: BigText(text: "Messages"),
                    ),
                    SizedBox(height: Dimensions.height20),
                    GestureDetector(
                      onTap: (){
                        if(Get.find<AuthController>().userLoggedIn()){
                        Get.find<AuthController>().clearSharedData();
                        Get.find<CartController>().clear();
                        Get.find<CartController>().clearCartHistory();
                        Get.offNamed(RouteHelper.getSignInPage());
                        }else{
                          print("You Logged out");
                        }
                      },
                      child: AccountWidget(
                        appIcon: AppIcon(icon: Icons.logout,
                          backgroundColor: Colors.redAccent,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10*5/2,
                          size: Dimensions.height10*5,
                        ),
                        bigText: BigText(text: "Log Out"),
                      ),
                    ),
                    SizedBox(height: Dimensions.height20),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
