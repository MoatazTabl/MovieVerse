import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieverse/core/utils/theme.dart';
import 'package:movieverse/features/Movie_details/data/models/top_cast_model.dart';

class TopCastListViewItem extends StatelessWidget {
  const TopCastListViewItem({super.key, required this.topCastModel});

  final TopCastCastModel? topCastModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CachedNetworkImage(
            maxHeightDiskCache: 300,
            maxWidthDiskCache: 300,
            imageUrl:
                "https://image.tmdb.org/t/p/original/${topCastModel?.profilePath}",
            imageBuilder: (context, imageProvider) => Container(
              height: 106.h,
              width: 120.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.w),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.fill)),
            ),
            errorWidget: (context, url, error) {
              return SizedBox(
                height: 106.h,
                width: 120.w,
                child: const Center(
                    child: Icon(
                  Icons.error,
                  color: Colors.red,
                )),
              );
            },
            placeholder: (context, url) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppThemes.mainOrangeColor,
                ),
              );
            },
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 142.w, maxHeight: 92.h),
            child: Text(
              "${topCastModel?.name}",
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 142.w, maxHeight: 92.h),
            child: Text(
              "${topCastModel?.character}",
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
