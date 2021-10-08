import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:comecsoft/components/components.dart';
import 'package:comecsoft/flashsale/models/models.dart';
import 'package:comecsoft/generated/l10n.dart';
import 'package:comecsoft/common/colors.dart' as AppColor;

class ProductInfoInputWidget extends StatefulWidget {
  final Product product;
  // products is used for reviewing the validity of the product
  final List<Product>? products;

  ProductInfoInputWidget({
    Key? key,
    required this.product,
    required this.products,
  }) : super(key: key);

  @override
  ProductInfoInputWidgetState createState() => ProductInfoInputWidgetState();
}

class ProductInfoInputWidgetState extends State<ProductInfoInputWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _commentController = TextEditingController();
  final _priceController = TextEditingController();
  final _dPriceController = TextEditingController();
  final _dRateController = TextEditingController();

  Product? _product;
  List<Product>? _products;

  S? _s;                     //application localization

  @override
  void initState() {
    super.initState();
    _product = widget.product;
    _products = widget.products;

    _nameController.text = _product!.name!;
    _commentController.text = _product!.comment!;
    _priceController.text = (_product!.price == 0) ? '' : _product!.price.toString();
    _dPriceController.text = (_product!.dPrice == 0) ? '' : _product!.dPrice.toString();

    _dRateController.text = _calcDRate(_product!.price, _product!.dPrice);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _nameController.dispose();
    _commentController.dispose();
    _priceController.dispose();
    _dPriceController.dispose();
    _dRateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _s = S.of(context);

    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // [ product name ]
            FSTitleWithDesc(context, _s!.productRegProductName, _s!.productRegProductNameDesc),
            SizedBox(height: 4.h,),
            TextFormField(
              controller: _nameController,
              keyboardType: TextInputType.text,
              style: TextStyle(fontSize: 16.sp),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w,),
                border: OutlineInputBorder(),
                counterText: "",
              ),
              maxLines: 1,
              maxLength: 20,
              onSaved: (String? value) => _product!.name = value,
              validator: _validateName,
            ),
            SizedBox(height: 16.h),
            // [ product price ]
            FSTitleWithDesc(context, _s!.productRegProductPrice, _s!.productRegProductPriceDesc),
            SizedBox(height: 4.h,),
            TextFormField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 16.sp),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w,),
                border: OutlineInputBorder(),
                counterText: "",
              ),
              maxLines: 1,
              maxLength: 8,
              onChanged: (value) => _dRateController.text = _calcDRate(int.parse(value), int.parse(_dPriceController.text)),
              onSaved: (String? value) => _product!.price = int.parse(value!),
              validator: _validatePrice,
            ),
            SizedBox(height: 16.h),
            // [ product discount price ]
            FSTitleWithDesc(context, _s!.productRegProductDPrice, _s!.productRegProductDPriceDesc),
            SizedBox(height: 4.h,),
            TextFormField(
              controller: _dPriceController,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 16.sp),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w,),
                border: OutlineInputBorder(),
                counterText: "",
              ),
              maxLines: 1,
              maxLength: 8,
              onChanged: (value) => _dRateController.text = _calcDRate(int.parse(_priceController.text), int.parse(value)),
              onSaved: (String? value) => _product!.dPrice = int.parse(value!),
              validator: _validateDPrice,
            ),
            SizedBox(height: 16.h),
            // [ product discount rate ]
            Text(
              _s!.productRegProductDRate,
              style: TextStyle(
                color: AppColor.color1012,
                fontSize: 14.sp,
                fontFamily: "SpoqaHanSansNeo",
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 8.h,),
            TextFormField(
              readOnly: true,
              controller: _dRateController,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 16.sp),
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColor.color1018,
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                border: OutlineInputBorder(),
                counterText: "",
              ),
              onSaved: (String? value) => _product!.dRate = int.parse(value!),
            ),
            SizedBox(height: 16.h),
            // [ product description ]
            FSTitleWithDesc(context, _s!.productRegProductDesc, _s!.productRegProductDescDesc),
            SizedBox(height: 4.h,),
            TextFormField(
              controller: _commentController,
              keyboardType: TextInputType.text,
              style: TextStyle(fontSize: 16.sp),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                border: OutlineInputBorder(),
              ),
              maxLength: 60,
              minLines: 1,
              maxLines: 3,
              onSaved: (String? value) => _product!.comment = value,
              validator: _validateComment,
            ),
          ],
        ),
      ),
    );
  }

  String? _validateName(String? value) {
    if (value!.isEmpty)
      return _s!.productRegEnterProductNameCorrectly;

    if (_products != null && _products!.length >= 0){
      // in case of registering a new product and there are already registered products
      if (_product!.id == null && _products!.where((element) => element.name == value).isNotEmpty)
        return _s!.productRegSameProdRegistered;
      // in case of modifying product and there are already registered products
      else if(_products!.where((element) => element.name == value).isNotEmpty && _product?.name != value)
        return _s!.productRegSameProdRegistered;
    }

    return null;
  }

  String? _validateComment(String? value) {
    if (value!.isEmpty)
      return _s!.productRegEnterProductDesc;

    return null;
  }

  String? _validatePrice(String? value) {
    if (value!.isEmpty)
      return _s!.productRegEnterProductPrice;

    return null;
  }

  String? _validateDPrice(String? value) {
    if (value!.isEmpty)
      return _s!.productRegEnterProductDPrice;

    if (int.parse(_priceController.text) < int.parse(_dPriceController.text))
      return _s!.productRegDProductExpensive;

    return null;
  }

  String _calcDRate(price, dPrice){
    double rate = (price - dPrice) / price * 100;
    return (rate.isNaN || rate < 0) ? '' : rate.toStringAsFixed(0);
  }

  Product? getProduct(){
    final FormState form = _formKey.currentState!;

    if(form.validate()){
      form.save();
      return _product;
    }else return null;
  }
}