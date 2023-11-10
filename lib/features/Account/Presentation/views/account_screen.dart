import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movieverse/core/utils/app_service.dart';
import 'package:movieverse/features/Account/Presentation/views/widgets/favourite_screen_button.dart';
import 'package:movieverse/features/Account/Presentation/views/widgets/dark_mode_switch.dart';
import 'package:movieverse/features/Account/Presentation/views/widgets/settings_row_with_animated_icon.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          SizedBox(
            height: 45.h,
          ),
          const SettingsRowWithAnimatedIcon(),
          SizedBox(height: 32.h),
          Container(
            height: 0.76.sh,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color(0xff202020)
                    : const Color(0xfffdfffc),
                borderRadius: BorderRadius.circular(16.w)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: 24.h, bottom: 24.h, right: 12.w),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.w),
                          child: CachedNetworkImage(
                              imageUrl: AppService
                                      .instance.currentUser?.profilePic ??
                                  "https://e7.pngegg.com/pngimages/178/595/png-clipart-user-profile-computer-icons-login-user-avatars-monochrome-black.png",
                              width: 40.w,
                              height: 40.h,
                              fit: BoxFit.fill),
                        ),
                      ),
                      Text(
                        "${AppService.instance.currentUser?.email}",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                  const Divider(
                      color: Color(0xffCACACA), height: .5, thickness: .5),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    "Account Settings",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: const Color(0xffADADAD),
                        ),
                  ),
                  SizedBox(
                    height: 31.h,
                  ),
                  const FavouritesScreenButton(),
                  SizedBox(
                    height: 32.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Dark Mode",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const Spacer(),
                      const DarkModeSwitch(),
                    ],
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      showAdaptiveDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog.adaptive(
                            actionsAlignment: MainAxisAlignment.center,
                            title: Text(
                              "Log Out",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            content:
                                const Text("You will have to Login again!"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    AppService.instance.terminate();
                                    context.go("/");
                                  },
                                  child: Text(
                                    "Ok",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(
                                            color: const Color(0xffff3333)),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    context.pop();
                                  },
                                  child: Text(
                                    "Cancel",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  ))
                            ],
                          );
                        },
                      );
                    },
                    child: Text(
                      "Log Out",
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: const Color(0xffff3333),
                              ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
