import 'package:aitebar/core/components/app_button.dart';
import 'package:aitebar/core/constants/app_strings.dart';
import 'package:aitebar/core/extensions/build_context_extension.dart';
import 'package:aitebar/core/routes/app_router.gr.dart';
import 'package:aitebar/features/generic/presentation/widgets/app_drawer.dart';
import 'package:aitebar/features/generic/presentation/widgets/app_scaffold.dart';
import 'package:aitebar/features/home/presentation/widgets/funds_grid_tile.dart';
import 'package:aitebar/gen/assets.gen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('HomePage.build');
    return AppScaffold(
      endDrawer: const AppDrawer(),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(LineIcons.search),
          onPressed: () {},
        ),
        title: Image.asset(
          Assets.app.appLogoPrimary.path,
          height: kToolbarHeight * 0.8,
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Container(
                alignment: Alignment.center,
                height: kToolbarHeight,
                child: SizedBox(
                  height: kToolbarHeight * 0.8,
                  width: context.width * 0.6,
                  child: AppButton.primary(
                    borderRadius: BorderRadius.circular(8.0),
                    child: const Text(AppStrings.startAFundraiser),
                  ),
                ),
              ),
            ),
          ];
        },
        // The content of the scroll view
        body: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          itemBuilder: (context, index) {
            return FundsGridTile(
              onTap: () {
                context.router.navigate(const FundsDetailsRoute());
              },
            );
          },
        ),
      ),
    );
  }
}
