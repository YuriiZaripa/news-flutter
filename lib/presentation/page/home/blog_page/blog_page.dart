import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/dependency_injection.dart' as di;
import 'package:news/domain/enums/enuma.dart';
import 'package:news/presentation/page/home/blog_page/cubit/article_cubit.dart';
import 'package:news/presentation/page/home/blog_page/widgets/one_article_containet.dart';
import 'package:news/presentation/theme/app_colors.dart';
import 'package:news/presentation/theme/app_fonts.dart';

@RoutePage()
class BlogPage extends StatefulWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  final ArticleCubit articleCubit = di.getIt.get();
  late final ScrollController _scrollController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    articleCubit.init();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleCubit, ArticleState>(
      bloc: articleCubit,
      builder: (context, state) {
        if (state.status == BlocStatus.loaded ||
            state.status == BlocStatus.loading) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.white,
              elevation: 0,
              title: Text(
                'Blog',
                style: AppFonts.nunito18w700basic0,
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
            ),
            body: Padding(
              padding: const EdgeInsets.only(
                top: 15,
                left: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: state.allArticles.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            bottom: 30,
                            right: 20,
                          ),
                          child: OneArticleContainer(
                              article: state.allArticles[index]),
                        );
                        // }
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        if (state.status == BlocStatus.error) {
          return const Scaffold(
              body: Center(child: Text('Щось пішло не так!')));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
