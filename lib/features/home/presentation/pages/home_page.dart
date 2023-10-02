import 'package:ayana/core/di/service_locator.dart';
import 'package:ayana/core/widgets/carousel.dart';
import 'package:ayana/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..getBanner(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 0,
          title: Image.asset(
            'images/ayana_text_logo.png',
            width: 80,
          ),
        ),
        body: ListView(
          children: [
            ColoredBox(
              color: const Color(0xffF4EEEC),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 20, 8, 20),
                child: Center(
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'images/dining.svg',
                                  height: 40,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Dining',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'images/spa.svg',
                                  height: 40,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Spa',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'images/experiences.svg',
                                  height: 40,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Experiences',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'images/tram.svg',
                                  height: 40,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Tram',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'images/room_service.svg',
                                  height: 40,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Room Service',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Get Inspired',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                color: Color(0xff795A00),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Base on what's trending right now",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return state.maybeWhen(
                  success: (bucketList, kids, wellness, romantic) {
                    return Carousel(
                      bucketList: bucketList,
                      kids: kids,
                      wellness: wellness,
                      romantic: romantic,
                    );
                  },
                  orElse: () => const SizedBox(),
                );
              },
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: const Color(0xff795A00),
          unselectedFontSize: 12,
          selectedFontSize: 12,
          unselectedItemColor: const Color(0xff795A00),
          selectedLabelStyle: const TextStyle(
            color: Color(0xff795A00),
          ),
          unselectedLabelStyle: const TextStyle(
            color: Color(0xff795A00),
          ),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('images/home_outline.svg'),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('images/chat_outline.svg'),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('images/location_on.svg'),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('images/user_profile.svg'),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
