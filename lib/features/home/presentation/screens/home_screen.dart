import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injurysnap/core/constants/app_colors.dart';
import 'package:injurysnap/features/assessment/presentation/screens/assessment_start_screen.dart';
import 'package:injurysnap/features/home/presentation/widgets/assessment_card.dart';
import 'package:injurysnap/features/home/presentation/widgets/home_drawer.dart';
import 'package:injurysnap/features/home/presentation/widgets/injury_card.dart';
import 'package:injurysnap/features/home/presentation/widgets/medical_disclaimer_card.dart';
import 'package:injurysnap/features/home/presentation/widgets/quick_action_card.dart';
import 'package:injurysnap/features/home/presentation/widgets/recovery_stats_card.dart';
import 'package:injurysnap/features/notifications/presentation/screens/notifications_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(FontAwesomeIcons.bars, color: AppColors.textDark),
            onPressed: () {
              // Open Drawer
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Text(
          'InjurySnap',
          style: GoogleFonts.outfit(
            color: AppColors.textDark,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.bell, color: AppColors.textDark),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationsScreen(),
                ),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      drawer: const HomeDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Section
            Text(
              'Welcome back,',
              style: GoogleFonts.outfit(
                fontSize: 14,
                color: AppColors.textLight,
              ),
            ),
            Text(
              'John Doe',
              style: GoogleFonts.outfit(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 24),

            // Assessment Card
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AssessmentStartScreen(),
                  ),
                );
              },
              child: const AssessmentCard(),
            ),

            const SizedBox(height: 24),

            // Recovery Stats
            const RecoveryStatsCard(),

            const SizedBox(height: 24),

            // Quick Actions
            Row(
              children: [
                QuickActionCard(
                  label: 'History',
                  icon: FontAwesomeIcons.clockRotateLeft,
                  onTap: () {},
                ),
                const SizedBox(width: 12),
                QuickActionCard(
                  label: 'Find Clinic',
                  icon: FontAwesomeIcons.locationDot,
                  // Using yellow/orange color for the icon in the implementation if strictly needed,
                  // but keeping it simple based on the previous widget code.
                  // I should probably color this icon orange based on the image:
                  // "Find Clinic" pin is orange. "History" is Greenish. "Resources" is blue-ish
                  // I'll stick to a generic one or update the widget to accept color.
                  // For now, let's just pass the icon.
                  onTap: () {},
                ),
                const SizedBox(width: 12),
                QuickActionCard(
                  label: 'Resources',
                  icon: FontAwesomeIcons.bookMedical,
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Recent Injuries Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Injuries',
                  style: GoogleFonts.outfit(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'View All',
                    style: GoogleFonts.outfit(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Injuries List
            const InjuryCard(
              title: 'Ankle Sprain',
              subtitle: 'Left ankle · Running',
              date: 'Dec 28, 2025',
              severity: 'Moderate',
              icon: FontAwesomeIcons.personRunning,
              iconColor: Colors.orange,
            ),
            const InjuryCard(
              title: 'Shoulder Sprain',
              subtitle: 'Right Shoulder · Gym',
              date: 'Dec 22, 2025',
              severity: 'Mild',
              icon: FontAwesomeIcons.dumbbell,
              iconColor: AppColors.primary,
            ),
            const InjuryCard(
              title: 'Knee Pain',
              subtitle: 'Right Knee · Basketball',
              date: 'Dec 11, 2025',
              severity: 'Severe',
              icon: FontAwesomeIcons.basketball,
              iconColor: Colors.red,
            ),

            const SizedBox(height: 24),

            // Disclaimer
            const MedicalDisclaimerCard(),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
