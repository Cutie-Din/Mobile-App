import 'dart:io';

import 'package:credit_hub_new/src/shared/app_export.dart';
import 'package:credit_hub_new/src/ui/main/add/cubit/add_cubit.dart';
import 'package:credit_hub_new/src/ui/main/add/cubit/add_image_state.dart';
import 'package:credit_hub_new/src/ui/main/add/cubit/add_state.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  XFile? _image; // Holds the selected image
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _moneyController = TextEditingController();

  AddImageCubit get _cubitImage => Get.find<AddImageCubit>();
  AddCubit get _cubitAdd => Get.find<AddCubit>();

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _cubitImage.postAddImage(imageFile: pickedFile);
    } else {
      print("No image selected.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddCubit, AddState>(
      bloc: _cubitAdd,
      listener: (context, state) {
        if (state.status == AddStatus.loading) {
          AppLoading.show();
          return;
        }
        AppLoading.dismiss();
        if (state.status == AddStatus.failure) {
          AppDialog.show(context, msg: state.message);
          return;
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.button,
        appBar: AppBar(
          title: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
              child: Text(
                'Tạo yêu cầu rút tiền',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black4,
                ),
              ),
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              FontAwesomeIcons.chevronLeft,
              size: 12,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        const Gap(50),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontFamily: 'SFProDisplay',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black4,
                ),
                children: [
                  TextSpan(text: 'Số lô'),
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(10),
            AppTextField(
              hint: "",
              hintStyle: GoogleFonts.publicSans(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.black4,
              ),
              controller: _idController,
            ),
          ],
        ),
        const Gap(20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontFamily: 'SFProDisplay',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black4,
                ),
                children: [
                  TextSpan(text: 'Số tiền'),
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(10),
            AppTextField(
              hint: "",
              hintStyle: GoogleFonts.publicSans(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.black4,
              ),
              controller: _idController,
            ),
          ],
        ),
        const Gap(20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontFamily: 'SFProDisplay',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black4,
                ),
                children: [
                  TextSpan(text: 'Tải hình ảnh hoá đơn'),
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(10),
            BlocBuilder<AddImageCubit, AddImageState>(
              bloc: _cubitImage,
              builder: (context, state) {
                return GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    width: 318,
                    height: 114,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F6F8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: state.data.url.isEmpty
                        ? DottedBorder(
                            color: Colors.grey,
                            dashPattern: const [6, 8],
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(10),
                            child: Center(
                              child: Image.asset(
                                AppImages.cam,
                                width: 40,
                                height: 40,
                                color: Colors.grey,
                              ),
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              state.data.url,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                  ),
                );
              },
            ),
          ],
        ),
        const Gap(30),
        AppButton(
          onPressed: () {
            Get.offAllNamed(AppRoute.main.name);
          },
          buttonText: "Gửi yêu cầu",
          sizeButton: 'medium',
        ),
      ],
    );
  }
}
