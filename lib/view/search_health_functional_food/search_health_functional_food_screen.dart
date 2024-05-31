import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/config/color_system.dart';
import 'package:pill_on_phone/config/font_system.dart';
import 'package:pill_on_phone/view/base/base_screen.dart';
import 'package:pill_on_phone/view/pharmacy_detail/widget/health_functional_food_brief/health_functional_food_brief_item_view.dart';
import 'package:pill_on_phone/view/pharmacy_detail/widget/health_functional_food_brief/health_functional_food_brief_skeleton_item_view.dart';
import 'package:pill_on_phone/view_model/search_health_functional_food/search_health_functional_food_view_model.dart';
import 'package:pill_on_phone/widget/app_bar/default_back_appbar.dart';
import 'package:pill_on_phone/widget/line/infinity_horizon_line.dart';

class SearchHealthFunctionalFoodScreen
    extends BaseScreen<SearchHealthFunctionalFoodViewModel> {
  const SearchHealthFunctionalFoodScreen({super.key});

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: DefaultBackAppBar(
        title: '영양제 검색하기',
        onBackPress: () {
          Get.back();
        },
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Column(
        children: [
          _buildSearchBar(),
          _buildPaddingInfinityHorizonLine(),
          _buildResultView(),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return SearchBar(
      controller: viewModel.searchController,
      padding: MaterialStateProperty.all(
          const EdgeInsets.only(left: 8, right: 16, top: 8, bottom: 8)),
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.all(ColorSystem.transparent),
      surfaceTintColor: MaterialStateProperty.all(ColorSystem.transparent),
      overlayColor: MaterialStateProperty.all(ColorSystem.transparent),
      trailing: [
        GestureDetector(
          onTap: () {
            viewModel.searchByInputToken();
          },
          child: const Icon(Icons.search),
        ),
      ],
      shape: MaterialStateProperty.all(
        ContinuousRectangleBorder(borderRadius: BorderRadius.circular(0)),
      ),
      hintText: '검색하고 싶은 영양제를 입력해주세요',
      hintStyle: MaterialStateProperty.all(
        FontSystem.H5.copyWith(
          color: ColorSystem.neutral.shade400,
        ),
      ),
      textStyle: MaterialStateProperty.all(FontSystem.H5),
      onSubmitted: (value) {
        viewModel.searchByInputToken();
      },
    );
  }

  Widget _buildPaddingInfinityHorizonLine() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InfinityHorizonLine(
        height: 1,
        color: ColorSystem.primary.shade300,
      ),
    );
  }

  Widget _buildResultView() {
    return Expanded(
      child: Obx(() {
        if (viewModel.isSearching) {
          return _buildSkeletonListView();
        } else if (viewModel.briefs.isEmpty) {
          return Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Text(
              '검색 결과가 없습니다.',
              style: FontSystem.H5.copyWith(
                color: ColorSystem.neutral.shade400,
              ),
            ),
          );
        } else {
          return _buildBriefListView();
        }
      }),
    );
  }

  Widget _buildSkeletonListView() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return HealthFunctionalFoodBriefSkeletonItem(
          isFirst: index == 0,
          isLast: index == 4,
        );
      },
    );
  }

  Widget _buildBriefListView() {
    return ListView.builder(
      itemCount: viewModel.briefs.length,
      itemBuilder: (context, index) {
        final brief = viewModel.briefs[index];
        return HealthFunctionalFoodBriefItem(
          state: brief,
          isFirst: index == 0,
          isLast: index == viewModel.briefs.length - 1,
        );
      },
    );
  }
}
