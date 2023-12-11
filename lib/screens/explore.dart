// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/theme.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: appBgColor,
          pinned: true,
          snap: true,
          floating: true,
          title: _buildHeader(),
        ),
        SliverToBoxAdapter(
          child: _buildSearch(),
        ),
        SliverToBoxAdapter(
          child: _buildCategory(),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) => RecipeItem(
            data: recipes[index],
            onFavoriteTap: () {
              setState(() {
                recipes[index]["is_favorited"] =
                    !recipes[index]["is_favorited"];
              });
            },
            onTap: () {},
          ),
          childCount: recipes.length,
        ))
      ],
    );
  }

  Widget _buildHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Explore",
          style: TextStyle(
            fontSize: 28,
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
      child: Row(
        children: [
          const Expanded(
            child: CustomRoundTextBox(
              hint: "Search",
              prefix: Icon(Icons.search, color: Colors.grey),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          IconBox(
            child: SvgPicture.asset(
              "assets/icons/filter1.svg",
              width: 18,
              height: 18,
            ),
            radius: 50,
            padding: 8,
          )
        ],
      ),
    );
  }

  int selectedCategoryIndex = 0;
  Widget _buildCategory() {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15, 5, 7, 20),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            categories.length,
            (index) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: CategoryItem(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                data: categories[index],
                isSelected: index == selectedCategoryIndex,
                onTap: () {
                  setState(() {
                    selectedCategoryIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
