import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_manav/constants/constants.dart';
import 'package:flutter_e_manav/model/usersModel.dart';
import 'package:flutter_e_manav/provider/provider.dart';
import 'package:flutter_e_manav/widgets/project_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {

  final TextEditingController _edit = TextEditingController();

  File? image;

  void profilePicture() async{
    XFile? file = await ImagePicker().pickImage(source: ImageSource.camera);
    if(file != null){
      setState(() {
        image = File(file.path);
      });
    } 
  }

  @override
  Widget build(BuildContext context) {
    AppProvider? provider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Profili Düzenle"),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image == null ? CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: profilePicture,
              child: CircleAvatar(
                maxRadius: 64,
                backgroundColor: Colors.red,
                child: Icon(Icons.add_photo_alternate_outlined,color: Colors.white, size: 35,),
              ),
            ) :
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: profilePicture,
              child: CircleAvatar(
                maxRadius: 64,
                backgroundColor: Colors.red,
                backgroundImage: FileImage(image!),
              ),
            ),
            SizedBox(height: 30,),
            TextField(
              controller: _edit,
              decoration: InputDecoration(
                hintText: "${provider.getUserInformation?.name}.."
              ),
            ),
            SizedBox(height: 30,),
            ProjectButton(title: "Güncelle", onPressed: () async{
              UsersModel model = await provider.getUserInformation!.copyWith(name: _edit.text);
              provider.updateProfile(context, image!, model);
            },)
          ],
        ),
      ),
    );
  }
}