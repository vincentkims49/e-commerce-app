import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../animations/fade_in.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * .02, vertical: h * .01),
        child: Column(
          children: [
            FadeInAnimation(
              delay: 1,
              child: FractionallySizedBox(
                widthFactor: .6,
                child: Hero(
                  tag: const Key("profile"),
                  child: CachedNetworkImage(
                      imageBuilder: (context, imageProvider) => Container(
                            height: h * .2,
                            width: w * .5,
                            decoration: ShapeDecoration(
                              shape: const StarBorder(
                                innerRadiusRatio: .9,
                                pointRounding: .2,
                                points: 10,
                              ),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      imageUrl:
                          "https://media.licdn.com/dms/image/D4D03AQGPqZiuen7qZw/profile-displayphoto-shrink_800_800/0/1698177711891?e=1711584000&v=beta&t=auvVIoYhX4u7ew-Ns22sOannnpAJLWFTzGN8cmVr590"),
                ),
              ),
            ),
            SizedBox(height: h * .01),
            const FadeInAnimation(
              delay: 1.5,
              child: Text(
                'Vincent Kimanzi',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: h * .01),
            const FadeInAnimation(
              delay: 2,
              child: Text(
                'Vincentkims@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: h * .01),
            ProfileInfoCard(h: h, w: w),
            SizedBox(height: h * .01),
            ProfileTiles(
              title: 'My Orders',
              icon: Iconsax.activity,
              onTap: () {},
            ),
            ProfileTiles(
              title: 'Wallet',
              icon: Iconsax.wallet_1,
              onTap: () {},
            ),
            ProfileTiles(
              title: 'Edit Profile',
              icon: Iconsax.edit,
              onTap: () {},
            ),
            ProfileTiles(
              title: 'Notifications',
              icon: Iconsax.notification,
              onTap: () {},
            ),
            FadeInAnimation(
              delay: 3.5,
              child: Divider(
                color: Colors.deepPurple.withOpacity(0.7),
                thickness: 0.5,
              ),
            ),
            // logout
            LogOutButton(h: h, w: w),
          ],
        ),
      ),
    );
  }
}

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    super.key,
    required this.h,
    required this.w,
  });

  final double h;
  final double w;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: FadeInAnimation(
            delay: 4,
            child: Container(
              height: h * .05,
              width: w * .5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.deepPurple.withOpacity(.2),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Iconsax.logout,
                      color: Colors.red,
                      size: h * .03,
                    ),
                    SizedBox(width: w * .02),
                    const Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileTiles extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;
  const ProfileTiles({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInAnimation(
      delay: 3,
      child: ListTile(
        onTap: () => onTap(),
        leading: Icon(
          icon,
          color: Colors.deepPurple,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: const Icon(
          Iconsax.arrow_right_2,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}

class ProfileInfoCard extends StatelessWidget {
  const ProfileInfoCard({
    super.key,
    required this.h,
    required this.w,
  });

  final double h;
  final double w;

  @override
  Widget build(BuildContext context) {
    return FadeInAnimation(
      delay: 2.5,
      child: Container(
        height: h * .1,
        width: w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.deepPurple.withOpacity(.2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Iconsax.heart,
                  color: Colors.deepPurple,
                  size: h * .04,
                ),
                SizedBox(height: h * .01),
                const Text(
                  'Wishlist',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Iconsax.user_add,
                  color: Colors.deepPurple,
                  size: h * .04,
                ),
                SizedBox(height: h * .01),
                const Text(
                  'Following',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Iconsax.wallet_2,
                  color: Colors.deepPurple,
                  size: h * .04,
                ),
                SizedBox(height: h * .01),
                const Text(
                  'Vouchers',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
