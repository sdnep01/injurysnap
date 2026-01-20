import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injurysnap/core/constants/app_colors.dart';
import 'package:injurysnap/features/auth/presentation/screens/login_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool pushNotifications = true;
  bool emailNotifications = true;

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
          'Settings',
          style: GoogleFonts.outfit(
            color: AppColors.textDark,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            // User Header
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    FontAwesomeIcons.solidUser,
                    color: AppColors.primary,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Doe',
                      style: GoogleFonts.outfit(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    Text(
                      'sachin.dahal@abc.com',
                      style: GoogleFonts.outfit(
                        fontSize: 12,
                        color: AppColors.textLight,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),

            _buildSectionHeader('ACCOUNT'),
            _buildSettingsTile(
              icon: FontAwesomeIcons.user,
              title: 'Personal Information',
            ),
            _buildSettingsTile(
              icon: FontAwesomeIcons.lock,
              title: 'Password & Security',
            ),
            _buildSettingsTile(
              icon: FontAwesomeIcons.shieldHalved,
              title: 'Privacy',
            ),

            const SizedBox(height: 16),
            _buildSectionHeader('PREFERENCES'),
            _buildSwitchTile(
              icon: FontAwesomeIcons.solidBell,
              title: 'Push Notifications',
              value: pushNotifications,
              onChanged: (val) => setState(() => pushNotifications = val),
            ),
            _buildSwitchTile(
              icon: FontAwesomeIcons.envelope,
              title: 'Email Notifications',
              value: emailNotifications,
              onChanged: (val) => setState(() => emailNotifications = val),
            ),
            _buildSettingsTile(
              icon: FontAwesomeIcons.globe,
              title: 'Language',
              trailing: Text(
                'English (US)',
                style: GoogleFonts.outfit(
                  fontSize: 12,
                  color: AppColors.textLight,
                ),
              ),
            ),

            const SizedBox(height: 16),
            _buildSectionHeader('SUPPORT'),
            _buildSettingsTile(
              icon: FontAwesomeIcons.solidMessage,
              title: 'Contact Support',
            ),
            _buildSettingsTile(
              icon: FontAwesomeIcons.star,
              title: 'Rate the App',
            ),
            _buildSettingsTile(
              icon: FontAwesomeIcons.fileContract,
              title: 'Terms & Privacy',
            ),

            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                    (route) => false,
                  );
                },
                icon: const Icon(Icons.logout, color: Colors.red, size: 18),
                label: Text(
                  'Sign Out',
                  style: GoogleFonts.outfit(
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.red.withOpacity(0.2)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: GoogleFonts.outfit(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: AppColors.textLight,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    Widget? trailing,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.01),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: _getIconColor(icon), size: 18),
        title: Text(
          title,
          style: GoogleFonts.outfit(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textDark,
          ),
        ),
        trailing:
            trailing ??
            const Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: AppColors.textLight,
            ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.01),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: _getIconColor(icon), size: 18),
        title: Text(
          title,
          style: GoogleFonts.outfit(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textDark,
          ),
        ),
        trailing: Transform.scale(
          scale: 0.8,
          child: Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.primary,
          ),
        ),
      ),
    );
  }

  Color _getIconColor(IconData icon) {
    if (icon == FontAwesomeIcons.solidUser) return AppColors.primary;
    if (icon == FontAwesomeIcons.lock) return Colors.orange;
    if (icon == FontAwesomeIcons.shieldHalved) return Colors.blueGrey;
    if (icon == FontAwesomeIcons.solidBell) return AppColors.primary;
    if (icon == FontAwesomeIcons.envelope) return Colors.orange;
    if (icon == FontAwesomeIcons.globe) return Colors.blue;
    if (icon == FontAwesomeIcons.solidMessage) return Colors.amber;
    if (icon == FontAwesomeIcons.star) return Colors.purple;
    if (icon == FontAwesomeIcons.fileContract) return Colors.green;
    return AppColors.textDark;
  }
}
