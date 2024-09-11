// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class FundIconscreen extends StatefulWidget {
  final IconData? initialIcon;
  final String? initialTitle;

  const FundIconscreen({super.key, this.initialIcon, this.initialTitle});

  @override
  State<FundIconscreen> createState() => _FundIconscreenState();
}

class _FundIconscreenState extends State<FundIconscreen> {
  final PageController _pageController = PageController();
  String selectedText = AppTexts.groupAppFund;
  IconData? selectedIcon; // Track the selected icon
  String? selectedTitle; // Track the selected title

  @override
  void initState() {
    super.initState();
    // Set initial selection based on passed parameters
    selectedIcon = widget.initialIcon;
    selectedTitle = widget.initialTitle;
  }

  void _onPageChanged(int index) {
    setState(() {
      switch (index) {
        case 0:
          selectedText = AppTexts.groupAppFund;
          break;
      }
    });
  }

  void _onTextTap(String text, int index) {
    setState(() {
      selectedText = text;
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  void _selectIcon(IconData icon, String title) {
    setState(() {
      selectedIcon = icon;
      selectedTitle = title;
    });
    Navigator.pop(context, {'icon': icon, 'title': title});
  }

  Widget _buildIconTile(IconData icon, String title) {
    return GestureDetector(
      onTap: () => _selectIcon(icon, title),
      child: ListTile(
        leading: FaIcon(icon),
        title: Text(title),
        trailing: selectedIcon == icon
            ? Icon(Icons.check, color: AppColors.primary)
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.grey,
        appBar: AppBar(
          leading: IconButton(
            icon: FaIcon(FontAwesomeIcons.x),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Chọn nhóm",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
          backgroundColor: AppColors.grey,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => _onTextTap(AppTexts.groupAppFund, 0),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        color: selectedText == AppTexts.groupAppFund
                            ? AppColors.primary
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: selectedText == AppTexts.groupAppFund
                              ? Colors.transparent
                              : AppColors.primary,
                          width: 3,
                        ),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Text(
                        AppTexts.groupAppFund,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: selectedText == AppTexts.groupAppFund
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppSizes.spaceBtwItems,
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return Container(
                          padding: EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: AppColors.primary,
                              width: 3,
                            ),
                          ),
                          child: Center(
                            child: ListView(
                              children: [
                                _buildIconTile(
                                    FontAwesomeIcons.sackDollar, "Tiền mặt"),
                                Divider(
                                  height: AppSizes.spaceBtwInputFields,
                                  color: AppColors.primary,
                                ),
                                _buildIconTile(
                                    FontAwesomeIcons.bank, "Ngân hàng"),
                                Divider(
                                  height: AppSizes.spaceBtwInputFields,
                                  color: AppColors.primary,
                                ),
                                _buildIconTile(
                                    FontAwesomeIcons.creditCard, "Tín dụng"),
                                Divider(
                                  height: AppSizes.spaceBtwInputFields,
                                  color: AppColors.primary,
                                ),
                                _buildIconTile(
                                    FontAwesomeIcons.piggyBank, "Tiết kiệm"),
                                Divider(
                                  height: AppSizes.spaceBtwInputFields,
                                  color: AppColors.primary,
                                ),
                                _buildIconTile(
                                    FontAwesomeIcons.coffee, "Cà phê"),
                                Divider(
                                  height: AppSizes.spaceBtwInputFields,
                                  color: AppColors.primary,
                                ),
                                _buildIconTile(
                                    FontAwesomeIcons.masksTheater, "Hiếu-Hỉ"),
                                Divider(
                                  height: AppSizes.spaceBtwInputFields,
                                  color: AppColors.primary,
                                ),
                              ],
                            ),
                          ),
                        );
                      default:
                        return Container();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
