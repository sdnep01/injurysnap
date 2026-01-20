import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injurysnap/core/constants/app_colors.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Notifications',
          style: GoogleFonts.outfit(
            color: AppColors.textDark,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.checklist_rtl,
              color: AppColors.textDark,
            ), // Placeholder for "read all" visual
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildNotificationItem(
            isUnread: true,
            icon: FontAwesomeIcons.clipboardCheck,
            iconColor: AppColors.primary,
            title: 'Assessment Complete',
            body: 'Your ankle sprain assessment is ready for review',
            time: '2 hours ago',
          ),
          _buildNotificationItem(
            isUnread: true,
            icon: FontAwesomeIcons.calendarCheck,
            iconColor: Colors.orange,
            title: 'Recovery Reminder',
            body: 'Time for your shoulder exercises - 15 minutes today',
            time: '5 hours ago',
          ),
          _buildNotificationItem(
            isUnread: false,
            icon: FontAwesomeIcons.locationDot,
            iconColor: Colors.blue,
            title: 'New Clinic Available',
            body: 'Sports Therapy Center opened near your location',
            time: '1 day ago',
          ),
          _buildNotificationItem(
            isUnread: false,
            icon: FontAwesomeIcons.trophy,
            iconColor: Colors.purple,
            title: 'Recovery Milestone',
            body: 'Congratulations! You\'ve completed 7 days of recovery',
            time: '2 days ago',
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required bool isUnread,
    required IconData icon,
    required Color iconColor,
    required String title,
    required String body,
    required String time,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.01),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isUnread)
            Container(
              margin: const EdgeInsets.only(top: 6, right: 8),
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Colors.orange, // Dot color
                shape: BoxShape.circle,
              ),
            ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 16, color: iconColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.outfit(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  body,
                  style: GoogleFonts.outfit(
                    fontSize: 12,
                    color: AppColors.textLight,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      time,
                      style: GoogleFonts.outfit(
                        fontSize: 10,
                        color: AppColors.textLight,
                      ),
                    ),
                    const Spacer(),
                    if (isUnread)
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Text(
                          'Mark Read',
                          style: GoogleFonts.outfit(
                            fontSize: 10,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    Text(
                      'Delete',
                      style: GoogleFonts.outfit(
                        fontSize: 10,
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
