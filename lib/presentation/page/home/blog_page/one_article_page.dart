import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news/domain/models/article/article_model.dart';
import 'package:news/presentation/theme/app_colors.dart';
import 'package:news/presentation/theme/app_fonts.dart';
import 'package:news/presentation/theme/app_http_fonts.dart';
import 'package:news/presentation/theme/app_icons.dart';
import 'package:news/presentation/theme/app_image.dart';

@RoutePage()
class OneArticlePage extends StatelessWidget {
  const OneArticlePage({
    super.key,
    required this.article,
  });

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.darkGray,
        onPressed: () {
          context.popRoute();
        },
        child: SvgPicture.asset(
          AppIcons.backButton,
          height: 40,
          width: 40,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                image: NetworkImage(
                  article.image.link,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      style: AppFonts.nunito24w700,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: const AssetImage(
                            AppImages.emptyAvatar,
                          ),
                          backgroundColor: AppColors.backgroundAuthorAvatar,
                          foregroundImage: article.author.photo == null
                              ? null
                              : NetworkImage(article.author.photo!),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${article.author.name} | ${article.getFormattedDate()}',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Html(
                      data: article.shortContent,
                      style: {
                        "p": AppHttpFonts.blog,
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
