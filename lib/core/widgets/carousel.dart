import 'dart:ui';
import 'package:ayana/features/home/domain/entities/banner_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

enum Tags { bucketList, kids, wellness, romantic }

class Carousel extends StatefulWidget {
  const Carousel({
    super.key,
    required this.bucketList,
    required this.kids,
    required this.wellness,
    required this.romantic,
  });

  final List<Data> bucketList;
  final List<Data> kids;
  final List<Data> wellness;
  final List<Data> romantic;

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final double _itemExtent = 290;
  late InfiniteScrollController _controller;
  var tags = Tags.bucketList;
  final selectColors = const Color(0xff251A00);
  final unselectColors = const Color(0xff807668);

  @override
  void initState() {
    super.initState();
    _controller = InfiniteScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Column(
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    tags = Tags.bucketList;
                  });
                },
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'BUCKET LIST',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: tags == Tags.bucketList
                            ? selectColors
                            : unselectColors,
                      ),
                    ),
                  ),
                ),
              ),
              const Text(
                '/',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffF4EEEB),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    tags = Tags.kids;
                  });
                },
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'KIDS',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color:
                            tags == Tags.kids ? selectColors : unselectColors,
                      ),
                    ),
                  ),
                ),
              ),
              const Text(
                '/',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffF4EEEB),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    tags = Tags.wellness;
                  });
                },
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'WELLNESS',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: tags == Tags.wellness
                            ? selectColors
                            : unselectColors,
                      ),
                    ),
                  ),
                ),
              ),
              const Text(
                '/',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffF4EEEB),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    tags = Tags.romantic;
                  });
                },
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'ROMANTIC',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: tags == Tags.romantic
                            ? selectColors
                            : unselectColors,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: InfiniteCarousel.builder(
              itemCount: tags == Tags.bucketList
                  ? widget.bucketList.length
                  : tags == Tags.kids
                      ? widget.kids.length
                      : tags == Tags.wellness
                          ? widget.wellness.length
                          : widget.romantic.length,
              itemExtent: ScreenUtil().screenWidth < 300
                  ? ScreenUtil().screenWidth.w + 30
                  : _itemExtent,
              center: true,
              velocityFactor: 0.9,
              scrollBehavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
              ),
              controller: _controller,
              itemBuilder: (context, itemIndex, realIndex) {
                final currentOffset = (ScreenUtil().screenWidth < 300
                        ? ScreenUtil().screenWidth.w + 30
                        : _itemExtent) *
                    realIndex;
                return AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    final diff = (_controller.offset - currentOffset);
                    const maxPadding = 40;
                    final carouselRatio = (ScreenUtil().screenWidth < 300
                            ? ScreenUtil().screenWidth.w + 30
                            : _itemExtent) /
                        maxPadding;

                    return Padding(
                      padding: EdgeInsets.only(
                        top: (diff / carouselRatio).abs(),
                        bottom: (diff / carouselRatio).abs(),
                      ),
                      child: child,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                tags == Tags.bucketList
                                    ? widget.bucketList[itemIndex].cover!.url
                                        .toString()
                                    : tags == Tags.kids
                                        ? widget.kids[itemIndex].cover!.url
                                            .toString()
                                        : tags == Tags.wellness
                                            ? widget
                                                .wellness[itemIndex].cover!.url
                                                .toString()
                                            : widget
                                                .romantic[itemIndex].cover!.url
                                                .toString(),
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black54,
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tags == Tags.bucketList
                                    ? widget.bucketList[itemIndex].title
                                        .toString()
                                    : tags == Tags.kids
                                        ? widget.kids[itemIndex].title
                                            .toString()
                                        : tags == Tags.wellness
                                            ? widget.wellness[itemIndex].title
                                                .toString()
                                            : widget.romantic[itemIndex].title
                                                .toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                tags == Tags.bucketList
                                    ? widget.bucketList[itemIndex].description
                                        .toString()
                                    : tags == Tags.kids
                                        ? widget.kids[itemIndex].description
                                            .toString()
                                        : tags == Tags.wellness
                                            ? widget
                                                .wellness[itemIndex].description
                                                .toString()
                                            : widget
                                                .romantic[itemIndex].description
                                                .toString(),
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Icon(
                                Icons.arrow_right_alt_outlined,
                                color: Colors.white,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
