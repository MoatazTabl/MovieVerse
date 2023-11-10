import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieverse/features/Search/Presentation/Manager/search_cubit.dart';
import 'package:movieverse/features/Search/Presentation/views/widgets/custom_text_field.dart';
import 'package:movieverse/features/Search/Presentation/views/widgets/grid_view.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 36.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            "Find Movies, Tv series,\nand more..",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        CustomTextField(
          textEditingController: textEditingController,
          onPressed: () {
            textFieldOnPressed(context);
          },
          onSubmitted: (value) => textFieldOnPressed(context),
        ),
        SizedBox(
          height: 24.h,
        ),
        SizedBox(
          height: 16.h,
        ),
        BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state is SearchSuccess) {
              return SearchGridView(movieDetail: state.searchResult);
            } else if (state is SearchFailure) {
              return Text(state.errorMessage);
            } else if (state is SearchInitial) {
              return Container();
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    );
  }

  void textFieldOnPressed(BuildContext context) {
    BlocProvider.of<SearchCubit>(context).fetchWantedSearch(
      query: textEditingController.text,
    );
  }
}
