import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/home/category/cubit/caegory_states.dart';
import 'package:news/home/category/cubit/category_view_model.dart';
import 'package:news/home/category/source_tab_widget.dart';
import 'package:news/model/category.dart';
import 'package:news/utils/App_colors.dart';


class CategoryDetails extends StatefulWidget {
  final Category category;
  const CategoryDetails({super.key, required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CubitViewModel cubitViewModel =CubitViewModel();
  @override
  @override
  void initState() {
    super.initState();
    cubitViewModel.getSources(widget.category.id);
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubitViewModel,
      child: BlocBuilder<CubitViewModel,CategoryStates>(builder: (context, state){
        if(state is CategoryLoadingState){
          return Center(
                    child: CircularProgressIndicator(color: AppColors.gery),
                   );
        }
        else if (state is CategoryErrorState){
          return Column(
                    children: [
                      Text(state.errorMessage,style:Theme.of(context).textTheme.headlineMedium),
                      ElevatedButton(onPressed: () {
                        cubitViewModel.getSources(widget.category.id);
                        setState(() {
      
                        });
                      }, child: Text('Try Again',style:  Theme.of(context).textTheme.labelMedium)),
                    ],
                  );
        }
        else if(state is CategorySuccessState){
          return SourceTabWidget(sourcesList: state.sourceList);
        }
        return Container();
      },
      ),
    );
    // FutureBuilder<SourceResponse>(
    //   future: ApiManger.getSources( categoryId:widget.category.id),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(
    //         child: CircularProgressIndicator(color: AppColors.gery),
    //       );
    //     } else if (snapshot.hasError) {
    //       return Column(
    //         children: [
    //           Text('something went wrong '),
    //           ElevatedButton(onPressed: () {}, child: Text('Try Again')),
    //         ],
    //       );
    //     }
    //     if (snapshot.data?.status != 'ok') {
    //       return Column(
    //         children: [
    //           Text(snapshot.data!.message!),
    //           ElevatedButton(onPressed: () {
    //             ApiManger.getSources(categoryId: widget.category.id);
    //             setState(() {
    //
    //             });
    //           }, child: Text('Try Again')),
    //         ],
    //       );
    //     }
    //     var sourceList = snapshot.data?.sources ?? [];
    //     return SourceTabWidget(sourcesList: sourceList);
    //   },
    // );
  }
}
