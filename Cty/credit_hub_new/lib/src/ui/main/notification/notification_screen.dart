import 'package:credit_hub_new/src/shared/app_export.dart';
import 'package:credit_hub_new/src/ui/main/notification/cubit/notification_cubit.dart';
import 'package:credit_hub_new/src/ui/main/notification/cubit/notification_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  NotificationCubit get _cubit => Get.find<NotificationCubit>();
  ScrollController _scrollController = ScrollController();
  int pageNo = 1;
  bool isLoadingMore = false;

  Future<void> _fetchData({bool refresh = false}) async {
    if (refresh) {
      pageNo = 1;
    }
    await _cubit.postNotification(page_no: pageNo, page_size: 10);
  }

  void _loadMore() async {
    if (!isLoadingMore) {
      setState(() {
        isLoadingMore = true;
      });
      pageNo++;
      await _fetchData();
      setState(() {
        isLoadingMore = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData(refresh: true);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _loadMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      bloc: _cubit,
      builder: (context, state) {
        if (state.status == NotificationStatus.loading && pageNo == 1) {
          return const AppLoading();
        }

        return Scaffold(
          backgroundColor: AppColors.button,
          appBar: AppBar(
            title: Center(
              child: Text(
                'Thông báo',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            elevation: 0,
            automaticallyImplyLeading: false,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Expanded(
                  child: (state.data == null || state.data.isEmpty)
                      ? const Center(
                          child: Text(
                            "Chưa có thông báo mới",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
                            ),
                          ),
                        )
                      : ListView.builder(
                          controller: _scrollController,
                          itemCount: state.data.length + (isLoadingMore ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (index < state.data.length) {
                              final notification = state.data[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: _buildNotify(
                                  notification.status_name ?? "Không có tiêu đề",
                                  notification.date_finish ?? "Không có ngày",
                                ),
                              );
                            } else {
                              return const Padding(
                                padding: EdgeInsets.all(10),
                                child: Center(child: CircularProgressIndicator()),
                              );
                            }
                          },
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNotify(String status_name, String time_finish) {
    Color backgroundColor = Colors.white;
    Color borderColor = Colors.transparent;

    if (status_name.contains("không được")) {
      backgroundColor = const Color(0xFFFF6E41).withOpacity(0.1);
      borderColor = Colors.grey.withOpacity(0.1);
    } else {
      borderColor = Colors.grey.withOpacity(0.1);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: borderColor,
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            status_name,
            style: GoogleFonts.publicSans(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.black5,
            ),
          ),
          const Gap(10),
          Row(
            children: [
              const Icon(
                FontAwesomeIcons.clock,
                size: 12,
                color: AppColors.grey2,
              ),
              const Gap(5),
              Text(
                time_finish,
                style: GoogleFonts.publicSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
