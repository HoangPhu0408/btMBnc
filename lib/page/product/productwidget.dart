import 'package:flutter/material.dart';
import '../../congf/const.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          "Tạo danh sách product theo chủ đề chọn 1 trong các category, " +
          " hiển thị và trình bày dạng grid hay list các thông tin thuộc tính của Product "+"\n Ví dụ: Category là iphone: tạo danh sách, hình ảnh các Product của iphone" + "theo đúng tên và giá thực tế",
          style: titleStyle,
        ),
      ),
    );
  }
}