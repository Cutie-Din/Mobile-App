import 'package:flutter/material.dart';
import 'package:finance/import.dart'; // Your existing imports

class RecentDashBoard extends StatelessWidget {
  const RecentDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20), // Add some padding around the container
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align title to start
        children: [
          Center(
            child: const Text(
              'Yêu cầu gần đây', // Title
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20), // Space between title and items
          Column(
            children: [
              // Row 1
              _buildRequestTile(
                title: 'Chờ quyết toán',
                orderId: '12345', // Replace with dynamic data if needed
                requestTime: '01/10/2024', // Sample request time
                amount: '1.000.000 VNĐ', // Sample amount
                gradientColors: [Color(0xFFFFD001), Color(0xFFFFC727)],
              ),
              const SizedBox(height: 10), // Space between rows

              // Row 2
              _buildRequestTile(
                title: 'Đã quyết toán',
                orderId: '67890', // Replace with dynamic data if needed
                requestTime: '02/10/2024', // Sample request time
                amount: '500.000 VNĐ', // Sample amount
                gradientColors: [Color(0xFF4BF56C), Color(0xFF1AC53B)],
              ),
              const SizedBox(height: 10), // Space between rows

              // Row 3
              _buildRequestTile(
                title: 'Không quyết toán',
                orderId: '54321', // Replace with dynamic data if needed
                requestTime: '03/10/2024', // Sample request time
                amount: '300.000 VNĐ', // Sample amount
                gradientColors: [Color(0xFFFF754A), Color(0xFFFF4A4A)],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRequestTile({
    required String title,
    required String orderId,
    required String requestTime,
    required String amount,
    required List<Color> gradientColors,
  }) {
    return Container(
      padding: const EdgeInsets.all(10), // Padding for each tile
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1), // Box border color
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Gradient text container for title
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: gradientColors,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Text color for title
                  ),
                ),
              ),
              Text(
                orderId,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Text color for order ID
                ),
              ),
            ],
          ),
          const SizedBox(height: 5), // Space between title and request time
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                requestTime,
                style: const TextStyle(fontSize: 16, color: Colors.black), // Request time style
              ),
              const Text(
                'dd/mm/yyyy hh:mm:ss', // This can be dynamically replaced
                style: TextStyle(
                    fontSize: 16, color: Colors.black), // Replace with dynamic date if needed
              ),
            ],
          ),
          const SizedBox(height: 5), // Space between request time and amount
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Số tiền:',
                style: const TextStyle(fontSize: 16, color: Colors.black), // Amount text style
              ),
              Text(
                amount,
                style: const TextStyle(
                    fontSize: 16, color: Colors.black), // Replace with dynamic amount
              ),
            ],
          ),
        ],
      ),
    );
  }
}
