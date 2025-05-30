import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/assets.dart';
import '../../../../../core/utils/text_styles.dart';
import 'favorites_view.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
   // final userId = getIt<FirebaseAuthService>().currentUser!.uid;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Profile Header
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(Assets.imagesProfile),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Doe',
                      style: AppTextStyle.font19Bold,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'john.doe@example.com',
                      style: AppTextStyle.font16Regular,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            // Profile Options
            _buildProfileOption(
              context,
              icon: Icons.person_outline,
              title: 'Edit Profile',
              onTap: () {},
            ),
            _buildProfileOption(
              context,
              icon: Icons.shopping_bag_outlined,
              title: 'My Orders',
              onTap: () {},
            ),
            _buildProfileOption(
              context,
              icon: Icons.favorite_border_outlined,
              title: 'Favorites',
              onTap: () {
                Navigator.pushNamed(context, FavoritesView.routeName);
              },
            ),
            _buildProfileOption(
              context,
              icon: Icons.location_on_outlined,
              title: 'Shipping Addresses',
              onTap: () {},
            ),
            _buildProfileOption(
              context,
              icon: Icons.payment_outlined,
              title: 'Payment Methods',
              onTap: () {},
            ),
            _buildProfileOption(
              context,
              icon: Icons.settings_outlined,
              title: 'Settings',
              onTap: () {},
            ),
            const Spacer(),
            // Logout Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  'Logout',
                  style: AppTextStyle.font16Bold.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(icon, size: 24),
              const SizedBox(width: 16),
              Text(
                title,
                style: AppTextStyle.font16SemiBold,
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}
