import 'package:aitebar/core/components/app_image.dart';
import 'package:aitebar/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class FundsGridTile extends StatelessWidget {
  const FundsGridTile({this.onTap, Key? key}) : super(key: key);
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppImage.network(
                imageUrl:
                    'https://images.unsplash.com/photo-1606166187734-a4cb74079037?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHBhdGllbnR8ZW58MHx8MHx8&w=1000&q=80',
                width: double.infinity,
                height: 100.0,
                fit: BoxFit.cover,
                borderRadius: BorderRadius.circular(4.0),
              ),
              const SizedBox(height: 12.0),
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Collage Station TX',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.titleMedium?.copyWith(
                        color: context.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Taxes A&M student Mithal Pager fighter for life',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: context.labelLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      'Last donation 2m ago',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.bodySmall?.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12.0),
              Container(
                height: 4.0,
                decoration: BoxDecoration(color: context.primary, borderRadius: BorderRadius.circular(8.0)),
              ),
              const SizedBox(height: 8.0),
              Text(
                '\$9000.0 raised',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.titleSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
