import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/custom_widgets/custom_see_more_sliver_app_bar.dart';
import '../../../core/services/services_locator.dart';
import '../../../core/utils/app_strings.dart';
import '../components/see_more_popular_tv_movies_component.dart';
import '../controllers/get_tv_movies_bloc/get_tv_movies_bloc.dart';
import '../controllers/get_tv_movies_bloc/get_tv_movies_event.dart';

class SeeMorePopularTvMoviesScreen extends StatelessWidget {
  const SeeMorePopularTvMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => sl<GetTvMoviesBloc>()..add(GetPopularTvMoviesEvent()),
      child: const Scaffold(
        body: CustomScrollView(
          slivers: [
            CustomSliverAppBar(title: AppStrings.kPopularTvs),
            SeeMorePopularTvMoviesComponent(),
          ],
        ),
      ),
    );
  }
}
