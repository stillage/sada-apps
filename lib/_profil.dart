import 'package:aad_oauth/model/token.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:launcher_apps/api/api_service.dart';
import 'package:launcher_apps/api/_model_profil_api.dart';

class Profil extends StatefulWidget {
  String token;

  Profil({
    Key? key,
    required this.token,
  }) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  late List<ModelProfilApi>? _profilModel = [];

  @override
  void initState() {
    super.initState();
    // _getData();
  }

  // void _getData() async {
  //   // passing id_kategori
  //   _profilModel = (await ApiServiceProfile().getProfil(widget.token));
  //   try {
  //     Future.delayed(const Duration(seconds: 1))
  //         .then((value) => setState(() {}));
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body:
          // _profilModel == null || _profilModel!.isEmpty
          //     ? const Center(
          //         // child: CircularProgressIndicator(),
          //         child: Text("Data Tidak Tersedia"),
          //       )
          //     :
          Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 9 / 10,
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
          ),
          itemCount: _profilModel!.length,
          itemBuilder: (BuildContext ctx, index) {
            return Text(_profilModel![index].displayName);
          },
        ),
      ),
    );
  }
}
