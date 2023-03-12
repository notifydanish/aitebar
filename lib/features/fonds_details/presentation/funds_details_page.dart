import 'package:aitebar/core/components/app_button.dart';
import 'package:aitebar/core/components/app_image.dart';
import 'package:aitebar/core/constants/app_strings.dart';
import 'package:aitebar/core/extensions/build_context_extension.dart';
import 'package:aitebar/features/generic/presentation/widgets/app_drawer.dart';
import 'package:aitebar/features/generic/presentation/widgets/app_scaffold.dart';
import 'package:aitebar/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class FundsDetailsPage extends StatelessWidget {
  const FundsDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppImage.network(
              imageUrl:
                  'https://images.unsplash.com/photo-1606166187734-a4cb74079037?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHBhdGllbnR8ZW58MHx8MHx8&w=1000&q=80',
              width: double.infinity,
              height: 220.0,
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(4.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Taxes A&M student Mithal Pager fighter for life',
              style: context.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12.0),
            Container(
              height: 4.0,
              decoration: BoxDecoration(color: context.primary, borderRadius: BorderRadius.circular(8.0)),
            ),
            const SizedBox(height: 8.0),
            RichText(
              text: TextSpan(
                text: '\$9000',
                style: context.labelLarge,
                children: [
                  TextSpan(
                    text: ' USD raised of \$10000 goal',
                    style: context.labelLarge?.copyWith(color: Colors.grey),
                  ),
                  TextSpan(
                    text: ' \u2022 ',
                    style: context.labelLarge?.copyWith(color: Colors.grey),
                  ),
                  TextSpan(
                    text: ' 7.1k ',
                    style: context.labelLarge,
                  ),
                  TextSpan(
                    text: ' donor',
                    style: context.labelLarge?.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12.0),
            AppButton.gradient(onPressed: () {}, child: const Text(AppStrings.share)),
            const SizedBox(height: 8.0),
            AppButton.gradient(onPressed: () {}, child: const Text(AppStrings.donateNow)),
            const SizedBox(height: 12.0),
            ListTile(
              leading: AppImage.network(
                imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png',
                borderRadius: BorderRadius.circular(80.0),
              ),
              title: const Text(
                'Mithal Pager Mithal Pager Mithal Pager Mithal Pager Mithal Pager Mithal Pager Mithal Pager Mithal Pager Mithal',
              ),
            ),
            const SizedBox(height: 12.0),
            const Divider(color: Colors.grey),
            const SizedBox(height: 12.0),
            RichText(
              text: TextSpan(
                text: '2 day ago',
                style: context.labelLarge,
                children: [
                  TextSpan(
                    text: '    \u2022    ',
                    style: context.labelLarge?.copyWith(color: Colors.grey),
                  ),
                  TextSpan(
                    text: 'Medical',
                    style: context.labelLarge?.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12.0),
            const Divider(color: Colors.grey),
            const SizedBox(height: 12.0),
            Text(
              'Mithal Pager is a student at Taxes A&M student who is fight for this lift against cancer',
              style: context.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12.0),
            Container(
              height: 4.0,
              decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8.0)),
            ),
          ],
        ),
      ),
    );
  }
}
