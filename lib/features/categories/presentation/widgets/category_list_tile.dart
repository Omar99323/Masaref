import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/widgets/custom_list_tile.dart';
import 'package:masaref/features/categories/cubits/sub_categories_of_category/sub_categories_of_category_cubit.dart';
import 'package:masaref/features/categories/cubits/sub_categories_of_category/sub_categories_of_category_states.dart';
import 'package:masaref/features/categories/data/category_model.dart';
import 'package:masaref/features/mo3amala/presentation/manager/cubit/mo3amala_cubit.dart';

class CategoryListTile extends StatelessWidget {
  final String title;
  final String image;
  final CategoryModel model;
  const CategoryListTile(
      {super.key,
      required this.title,
      required this.image,
      required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.colorGrey,
            width: 1.w,
          ),
        ),
      ),
      child: BlocBuilder<SubCategoriesOfCategoryCubit,
          SubCategoriesOfCategoryStates>(builder: (_, state) {
        if (state is SubCategoriesOfCategorySuccessState &&
            state.subCategories.isNotEmpty) {
          return GestureDetector(
            onTap: () {
              BlocProvider.of<Mo3amalaCubit>(context).changeCategory(model);
              Navigator.pop(context);
            },
            child: ExpansionTile(
              leading: CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.colorLightBlue,
                backgroundImage: image != "" ? NetworkImage(image) : null,
              ),
              title: Text(
                title,
                style: const TextStyle(
                    color: AppColors.colorBlack, fontWeight: FontWeight.bold),
              ),
              children: List.generate(
                  state.subCategories.length,
                  (index) => CustomListTile(
                        title: state.subCategories[index].name,
                        image: state.subCategories[index].image,
                        textColor: AppColors.colorBlack,
                      )),
            ),
          );
        }
        return GestureDetector(
          onTap: () {
            BlocProvider.of<Mo3amalaCubit>(context).changeCategory(model);
            Navigator.pop(context);
          },
          child: CustomListTile(
            title: title,
            image: image,
            textColor: AppColors.colorBlack,
          ),
        );
      }),
    );
  }
}
