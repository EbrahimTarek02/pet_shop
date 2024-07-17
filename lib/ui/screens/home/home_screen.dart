import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_shop/data/model/pet.dart';
import 'package:pet_shop/ui/screens/home/widgets/pet_item.dart';
import 'package:pet_shop/ui/utils/app_assets.dart';
import 'package:pet_shop/ui/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {

  static const routeName = "home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Pet> petList = [
    Pet("Dog", "Golden", 20,
        "https://drive.google.com/file/d/1SVXNgYjWidATdPpPfswlWtS31DnhjB-2/view ?usp=share_link"),
    Pet("Lablador", "Golden", 18,
        "https://drive.google.com/file/d/152WsHjSIgQUy0gS_WQEo3mWOSMK8v1kM/view?usp=share_link"),
    Pet("Dog", "Cardigan", 12,
        "https://drive.google.com/file/d/1fHoNz-wywIk_ta4RIJzXm7yLrObyKDty/view?usp=share_link"),
    Pet("Cat", "Street Cat", 17,
        "https://drive.google.com/file/d/1SL7ZirhhuTpgk7wRe_t0vB_3xD9iqCGm/view ?usp=share_link"),
    Pet("Cat", "White Cat", 19,
        "https://drive.google.com/file/d/1C_S4qQ4wck3LasJ1Bs5Lz8yhwN60SmTH/view?usp=share_link"),
    Pet("Cat", "Kitten", 18,
        "https://drive.google.com/file/d/1qQILdlJ3gtm_0VBzmSoqgTbisVZ-7kr9/view?usp=share_link"),
    Pet("Bird", "House Bird", 15,
        "https://drive.google.com/file/d/1LbUWy1JxxkSGSd4cu4dMBK5ChilbFud8/view?usp=share_link"),
    Pet("Bird", "Parrot", 14,
        "https://drive.google.com/file/d/1B9eAFq_9D75eXtn0BJM6gtq811eby6QN/view?usp=share_link"),
    Pet("Bird", "Pink Bird", 15,
        "https://drive.google.com/file/d/1Sg8plSKxYt1kRQn_DH_OdvHiE2FoeQah/view?usp=share_link"),
    Pet("Bird", "Talking Parrot", 17,
        "https://drive.google.com/file/d/1Sg8plSKxYt1kRQn_DH_OdvHiE2FoeQah/view?usp=share_link"),
    Pet("Rat", "Hamster ", 9,
        "https://drive.google.com/file/d/11tVuPyyv23mByiFNHrJRuE55gyhMrGA2/view?usp=share_link"),
    Pet("Rabbit", "Brown Rabbit", 16,
        "https://drive.google.com/file/d/1huzYq6qlL4BiFzXqD7SuMYM67J5Ea0bV/view?usp=share_link"),
    Pet("Rabbit", "Gray Rabbit", 17,
        "https://drive.google.com/file/d/1lxI-yXMPIp2nz2MLc7duJ5Sw6lrA-AsJ/view?usp=share_link"
    ),
  ];

  List<Pet> searchList = [];

  @override
  void initState() {
    searchList = petList;
    super.initState();
  }

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,

        title: Text(
          "Pet Market",
          style: GoogleFonts.balsamiqSans(
            fontSize: 30,
            color: AppColors.black
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),

        child: Column(
          children: [
            TextFormField(
              controller: searchController,

              onChanged: (value) {
                search();
              },

              textAlign: TextAlign.center,

              style: GoogleFonts.balsamiqSans(
                fontSize: 22,
                  color: AppColors.subTitleTextColor
              ),

              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.primaryColor,

                prefixIcon: const ImageIcon(
                  AssetImage(
                    AppAssets.searchIcon
                  ),
                  color: AppColors.accentColor,
                ),

                hintText: "Search by pet type",
                hintStyle: GoogleFonts.balsamiqSans(
                  fontSize: 22,
                  color: AppColors.subTitleTextColor
                ),

                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                    borderSide: BorderSide.none
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                  borderSide: BorderSide.none
                ),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                    borderSide: BorderSide.none
                ),
              ),
            ),

            Expanded(
              child: searchList.isEmpty
                  ?
              Center(
                child: Text(
                  "No available pets",
                  style: GoogleFonts.balsamiqSans(
                      fontSize: 18,
                      color: AppColors.black
                  ),
                ),
              )
                  :
              ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                itemCount: searchList.length,
                itemBuilder: (context, index) {
                  print(searchList.length);
                  return PetItem(searchList[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  search() {
    if (searchController.text.isEmpty) {
      searchList = petList;
      setState(() {});
      return;
    }
    setState(() {
      searchList = petList
          .where(
              (pet) => pet.type.toLowerCase().contains(searchController.text.toLowerCase()))
          .toList();
    });
  }
}
