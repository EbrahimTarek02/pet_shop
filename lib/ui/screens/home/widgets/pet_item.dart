import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_shop/data/model/pet.dart';
import 'package:pet_shop/ui/utils/app_assets.dart';
import 'package:pet_shop/ui/utils/app_colors.dart';

class PetItem extends StatelessWidget {
  final Pet pet;
  const PetItem(this.pet, {Key? key}) : super(key: key);

  String convertGoogleDriveLink(String link) {
    final startIdx = link.indexOf('/d/') + 3;
    final endIdx = link.indexOf('/view');
    final fileId = link.substring(startIdx, endIdx);
    return 'https://drive.google.com/uc?export=view&id=$fileId';
  }

  @override
  Widget build(BuildContext context) {
    String imageUrl = convertGoogleDriveLink(pet.image); // Use your actual image link here

    return Container(
      margin: EdgeInsets.only(top: 18),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ],
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Image.network(
              imageUrl,
              fit: BoxFit.fill,
              height: MediaQuery.sizeOf(context).height * 0.15,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Text('Failed to load image'),
                );
              },
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pet.category,
                    style: GoogleFonts.balsamiqSans(
                      fontSize: 22,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    pet.type, // Assuming you have a description field in Pet
                    style: GoogleFonts.balsamiqSans(
                      fontSize: 15,
                      color: AppColors.subTitleTextColor,
                    ),
                  ),
                  Row(
                    children: [
                      ImageIcon(
                        AssetImage(AppAssets.petLovIcon),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Pet Love: ${pet.loveCount}",
                        style: GoogleFonts.balsamiqSans(
                          fontSize: 15,
                          color: AppColors.accentColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
