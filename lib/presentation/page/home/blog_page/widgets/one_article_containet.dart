import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news/domain/models/article/article_model.dart';
import 'package:news/presentation/routes/router.dart';
import 'package:news/presentation/theme/app_colors.dart';
import 'package:news/presentation/theme/app_fonts.dart';

class OneArticleContainer extends StatelessWidget {
  const OneArticleContainer({
    super.key,
    required this.article,
  });

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushRoute(
          OneArticleRoute(article: article),
        );
      },
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      article.title,
                      style: AppFonts.nunito14w700white.copyWith(
                        color: AppColors.basic0,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 15
                  ),
                  Text(
                    article.getFormattedDate(),
                    style: AppFonts.nunito10w400basic0.copyWith(
                      color: AppColors.grayDateText,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Container(
            height: 100,
            width: 134,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
              color: AppColors.lightGray,
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(4),
              ),
              child: Image(
                image: NetworkImage(article.image.link),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
