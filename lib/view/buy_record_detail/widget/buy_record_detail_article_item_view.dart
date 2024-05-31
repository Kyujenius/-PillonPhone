import 'package:flutter/material.dart';
import 'package:pill_on_phone/config/color_system.dart';
import 'package:pill_on_phone/config/font_system.dart';
import 'package:pill_on_phone/entity/buy_record/buy_record_detail_article_state.dart';
import 'package:pill_on_phone/widget/box/image_box.dart';

class BuyRecordDetailArticleItemView extends StatelessWidget {
  const BuyRecordDetailArticleItemView({
    super.key,
    required this.state,
    required this.isFirst,
    required this.isLast,
  });

  final BuyRecordDetailArticleState state;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: isFirst ? 0 : 16,
        bottom: isLast ? 0 : 16,
      ),
      child: Row(
        children: [
          ImageBox(
            imageUrl: state.itemImageUrl,
            width: 92,
            height: 92,
            borderRadius: BorderRadius.circular(16),
            backgroundColor: ColorSystem.neutral.shade100,
          ),
          const SizedBox(width: 16),
          SizedBox(
            height: 92,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.itemName,
                  style: FontSystem.H5,
                ),
                Text(
                  state.itemManufacturer,
                  style: FontSystem.Sub3.copyWith(
                    color: ColorSystem.neutral.shade400,
                  ),
                ),
                const Spacer(),
                Text(
                  state.itemPriceStr,
                  style: FontSystem.H4.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
