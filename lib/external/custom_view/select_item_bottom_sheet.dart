import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectItemBottomSheet<T> extends StatefulWidget {
  final String title;
  final List<T> items;
  final T? selectedItem;
  final String Function(T) getItemName;
  final bool Function(T, T?) isSelected;

  const SelectItemBottomSheet({
    required this.title,
    required this.items,
    required this.getItemName,
    required this.isSelected,
    this.selectedItem,
    Key? key,
  }) : super(key: key);

  Future<T?> show(BuildContext context) async {
    return await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => this,
    );
  }

  @override
  State<SelectItemBottomSheet<T>> createState() =>
      _SelectItemBottomSheetState();
}

class _SelectItemBottomSheetState<T> extends State<SelectItemBottomSheet<T>> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          Text(
            widget.title,
            // style: AppStyles.text14Medium
            //     .copyWith(color: AppColors.gray1Color, height: 20 / 14),
          ),
          const SizedBox(height: 16),
          const Divider(
            thickness: 1,
            height: 1,
            // color: AppColors.gray1Color.withOpacity(0.2),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              separatorBuilder: (context, index) => const Divider(
                thickness: 1,
                height: 1,
                // color: AppColors.gray1Color.withOpacity(0.2),
              ),
              itemCount: widget.items.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Get.back(result: widget.items[index]);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  // color: widget.isSelected(
                  //         widget.items[index], widget.selectedItem)
                  //     ? AppColors.primaryLightestColor
                  //     : AppColors.whiteColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.getItemName(widget.items[index]),
                        // style: AppStyles.text14Medium.copyWith(
                        //     color: widget.isSelected(
                        //             widget.items[index], widget.selectedItem)
                        //         ? AppColors.primaryColor
                        //         : AppColors.gray1Color),
                      ),
                      if (widget.isSelected(
                          widget.items[index], widget.selectedItem))
                        Image.asset('assets/icons/ic_check.png')
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16)
        ],
      ),
    );
  }
}
