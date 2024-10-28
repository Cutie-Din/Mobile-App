import 'package:finance/import.dart';

class AddForm extends StatefulWidget {
  final GlobalKey<FormState> formKey; // Nhận formKey từ parent

  AddForm({required this.formKey, super.key});

  @override
  _AddFormState createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image; // Biến để lưu ảnh đã chọn

  Future<void> _pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _image = pickedFile; // Lưu ảnh đã chọn
        });
      }
    } catch (e) {
      // Xử lý lỗi nếu có
      print("Error picking image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Số lô
          RichText(
            text: TextSpan(
              text: 'Số lô ',
              style: TextStyle(
                  fontFamily: "SFProDisplay",
                  fontSize: AppFonts.fontSize14,
                  fontWeight: AppFonts.medium,
                  color: Colors.black),
              children: const [
                TextSpan(
                  text: '*',
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.main, width: 2.0),
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.number,
            validator: FormValidator.validateLotNumber,
          ),
          const SizedBox(height: 16),

          // Số tiền
          RichText(
            text: TextSpan(
              text: 'Số tiền ',
              style: TextStyle(
                  fontFamily: "SFProDisplay",
                  fontSize: AppFonts.fontSize14,
                  fontWeight: AppFonts.medium,
                  color: Colors.black),
              children: const [
                TextSpan(
                  text: '*',
                  style: TextStyle(
                    color: Colors.red,
                    fontFamily: "SFProDisplay",
                    fontSize: AppFonts.fontSize14,
                    fontWeight: AppFonts.medium,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.main, width: 2.0),
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
            keyboardType: TextInputType.number,
            validator: FormValidator.validateAmount,
          ),
          const SizedBox(height: 16),

          // Upload Image Section
          RichText(
            text: TextSpan(
              text: 'Tải hình ảnh hoá đơn ',
              style: TextStyle(
                  fontFamily: "SFProDisplay",
                  fontSize: AppFonts.fontSize14,
                  fontWeight: AppFonts.medium,
                  color: Colors.black),
              children: const [
                TextSpan(
                  text: '*',
                  style: TextStyle(
                      fontFamily: "SFProDisplay",
                      fontSize: AppFonts.fontSize14,
                      fontWeight: AppFonts.medium,
                      color: Colors.red),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: _pickImage, // Gọi hàm chọn ảnh
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(8),
              color: Colors.grey,
              strokeWidth: 1.5,
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: _image == null
                      ? const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera_alt_outlined,
                              size: 40,
                              color: Colors.grey,
                            ),
                          ],
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            File(_image!.path),
                            fit: BoxFit.cover, // Giãn ảnh theo khung
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
