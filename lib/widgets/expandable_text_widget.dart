import 'package:flutter/material.dart';
import 'package:flutter_movie_api/utils/app_colors.dart';
import 'package:flutter_movie_api/utils/dimensions.dart';
import 'package:flutter_movie_api/widgets/custom_text_widget.dart';
import 'package:flutter_movie_api/widgets/small_text_widget.dart';

class ExpandableTextWidget extends StatefulWidget {
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = Dimensions.screenHeight / 5.59;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt(), widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: secondHalf.isEmpty
            ? CustomTextWidget(
                text: firstHalf,
                textColor: AppColors.smallTextColor,
                fontSize: Dimensions.font16,
              )
            : Column(
                children: [
                  CustomTextWidget(
                    text: hiddenText
                        ? (firstHalf + '...')
                        : (firstHalf + secondHalf),
                    textColor: AppColors.smallTextColor,
                    fontSize: Dimensions.font16,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        hiddenText = !hiddenText;
                      });
                    },
                    child: Row(
                      children: [
                        SmallTextWidget(
                          text: hiddenText ? 'Show more' : 'Show less',
                          textColor: Colors.white,
                          fontSize: Dimensions.font16,
                        ),
                        Icon(
                          hiddenText
                              ? Icons.arrow_drop_down
                              : Icons.arrow_drop_up,
                          color: Colors.white,
                        )
                      ],
                    ),
                  )
                ],
              ));
  }
}
