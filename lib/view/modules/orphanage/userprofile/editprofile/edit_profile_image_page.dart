import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:orphanagemanagement/model/orphanage/orphn_reg_model.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/images.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/custome_widgets/easyButton.dart';
import 'package:orphanagemanagement/view/modules/orphanage/main_page_orphanage.dart';
import 'package:orphanagemanagement/viewmodel/firestore.dart';
import 'package:orphanagemanagement/viewmodel/store_image.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class EditProfileImageOrphanage extends StatefulWidget {
  // OrphnRegModel orphnRegModel;
  EditProfileImageOrphanage({
    // required this.orphnRegModel,
    super.key,
  });

  @override
  State<EditProfileImageOrphanage> createState() =>
      _EditProfileImageOrphanageState();
}

class _EditProfileImageOrphanageState extends State<EditProfileImageOrphanage> {
  @override
  Widget build(BuildContext context) {
    final firestore = Provider.of<FireStore>(context);

    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: customeText(text: "Profile Image"),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.all(20),
          child: Column(children: [
            customeText(
                text: "Edit profile image", size: 18, textcolor: grey600),
            Gap(20),
            Container(
              height: hight * .22,
              width: double.infinity,
              decoration: BoxDecoration(
                  // color: Colors.amber,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: "${storeInstence. orphnRegModel?.image}".isNotEmpty
                          ? NetworkImage("${storeInstence. orphnRegModel?.image}")
                          : imageNotFound)),
            ),
            Gap(20),
            easyButton(
              onpressed: () async {
                await selectImage(context).then((value) =>
                    firestore.uploadUsersImageToFirebase(imageFile!));
                storeInstence.fetchCurrentOrphanage(currentUserId);

                // PermissionStatus galleryPermission =
                //     await Permission.photos.request();

                // if (galleryPermission == PermissionStatus.granted) {

                // }
              },
              bordersideWidth: 1.5,
              context: context,
              text: "Add new Image",
              fontWeight: FontWeight.w400,
              textcolor: black,
              bgColor: MaterialStatePropertyAll(Colors.transparent),
            ),
            Gap(20),
            easyButton(
              onpressed: () {
                storeInstence.deleteOrphanageImage(currentUserId);
                storeInstence.fetchCurrentOrphanage(currentUserId);
              },
              bordersideWidth: 1.5,
              context: context,
              text: "Remove Image",
              fontWeight: FontWeight.w400,
              textcolor: black,
              bgColor: MaterialStatePropertyAll(Colors.transparent),
            ),
          ]),
        ));
  }
}
