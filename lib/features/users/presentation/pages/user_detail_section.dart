import 'package:flutter/widgets.dart';
import 'package:task/features/users/domain/entities/user_entity.dart';
import 'package:task/features/users/presentation/widgets/extra_detail_tile.dart';
import 'package:task/features/users/presentation/widgets/user_detail_card.dart';

class UserDetailSection extends StatelessWidget {
  final UserEntity user;
  const UserDetailSection({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Show the “User Detail” cards
        UserDetailCard(
          cardTitle: "Personal Details",
          extraDetailTiles: [
            ExtraDetailTile(title: "Gender", value: user.gender!),
            ExtraDetailTile(title: "Age", value: user.age.toString()),
            ExtraDetailTile(title: "Blood Group", value: user.bloodGroup!),
          ],
        ),

        UserDetailCard(
          cardTitle: "Contact Details",
          extraDetailTiles: [
            ExtraDetailTile(title: "Phone no.", value: user.phone!),
          ],
        ),

        UserDetailCard(
          cardTitle: "Address Details",
          extraDetailTiles: [
            ExtraDetailTile(title: "Country", value: user.address!.country!),
            ExtraDetailTile(title: "State", value: user.address!.state!),
            ExtraDetailTile(title: "City", value: user.address!.city!),
            ExtraDetailTile(title: "Address", value: user.address!.address!),
          ],
        ),

        UserDetailCard(
          cardTitle: "Company Details",
          extraDetailTiles: [
            ExtraDetailTile(title: "Name", value: user.company!.name!),
            ExtraDetailTile(title: "Title", value: user.company!.title!),
            ExtraDetailTile(
              title: "Department",
              value: user.company!.department!,
            ),
            ExtraDetailTile(
              title: "Address",
              value: user.company!.address!.address!,
            ),
          ],
        ),
      ],
    );
  }
}
