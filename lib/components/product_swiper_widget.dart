import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:comecsoft/common/colors.dart' as AppColor;
import 'package:comecsoft/flashsale/models/models.dart';
import 'package:comecsoft/generated/l10n.dart';
import 'package:comecsoft/components/components.dart';


// Swiper for products
class ProductSwiperWidget extends StatefulWidget {
  final List<Product>? products;
  // list of selected product id
  final List<int>? selected;
  // Product selection is possible. Used on the FSPostRegPage
  final bool multiSelect;
  // display discount time in ProductDetailWidget
  final String? discountTime;
  // callback function when product is clicked
  final void Function(List<int>)? onSelect;

  ProductSwiperWidget({
    Key? key,
    required this.products,
    this.selected,
    this.multiSelect = false,
    this.discountTime,
    this.onSelect,
  }) : assert((products != null && products.length > 0)),
        super(key: key);

  @override
  ProductSwiperWidgetState createState() => ProductSwiperWidgetState();
}

class ProductSwiperWidgetState extends State<ProductSwiperWidget> {
  List<Product>? _products;

  late bool _multiSelect;

  late List<int> _selectedList;

  S? _s;                     //application localization

  late double _productListHeight;
  late double _productListWidth;

  bool _showNoSelectionError = false;

  @override
  void initState() {
    super.initState();

    _products = widget.products;

    _selectedList = [];
    if(widget.selected != null) _selectedList.addAll(widget.selected!);
    _multiSelect = widget.multiSelect;

    // height should be _productImageHeight + _productDescriptionHeight in ProductDetailWidgetState
    _productListHeight = 378.h;
    // width should be _productImageWidth in ProductDetailWidgetState
    _productListWidth = 1.sw;
  }

  @override
  Widget build(BuildContext context) {
    _s = S.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: _productListHeight,
          width: _productListWidth,
          child: Swiper(
            itemCount: _products!.length,
            pagination: null,
            control: SwiperControl(
              size: 0
            ),
            viewportFraction: 0.85,
            scale: 0.90,
            loop: false,
            itemBuilder: (BuildContext context,int index){
              return ProductDetailWidget(
                product: _products![index],
                discountTime: widget.discountTime,
                selected: (_multiSelect) ? _selectedList.contains(_products![index].id) : null,
                onSelect: (_multiSelect) ? _productSelected : null,
              );
            },
          ),
        ),
        (_showNoSelectionError) ?
        Container(
          padding: EdgeInsets.only(left: 20.w),
          child: Column(
            children: [
              SizedBox(height: 8.h,),
              Text(
                _s!.postRegSelectProdToPost,
                style: TextStyle(
                  color: Theme.of(context).errorColor,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ) :
        Container(),
      ],
    );
  }

  void _productSelected(id, selected){
    if (_selectedList.contains(id) && !selected!)_selectedList.remove(id);
    else if (!_selectedList.contains(id) && selected!) _selectedList.add(id);

    if(widget.onSelect != null){
      // Return in the order of product registration regardless of selection order
      _selectedList.sort((a, b) => a-b);
      widget.onSelect?.call(_selectedList);
    }
  }

  List<int?>? getSelectedProducts(){
    if (_multiSelect){
      setState(() {
        _showNoSelectionError = (_selectedList.length == 0) ? true : false;
      });
    }

    // Return in the order of product registration regardless of selection order
    _selectedList.sort((a, b) => a-b);
    return _selectedList;
  }
}