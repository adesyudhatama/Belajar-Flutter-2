import 'package:flutter/material.dart';

/// Clas UserProfile digunakan untuk menampilkan UI Profile
class UserProfile extends StatelessWidget {
  /// Field ini digunakan untuk menyimpan nama user
  final String name;
  final String role;
  final String photo;

  /// * name berisi *nama user*, nilai default nya adalah `No Name`
  ///
  /// [Role] berisi **jabatan user**
  ///
  /// photo berisi foto user
  UserProfile({this.name = "No Name", this.role = "[No Role]", this.photo});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image(
          image: AssetImage(
              (photo != null) ? photo : "assets/images/knighturnal.png"),
          fit: BoxFit.cover,
          width: 200,
          height: 200,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          name,
          style: TextStyle(
            fontFamily: "poppins",
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(role),
      ],
    );
  }
}
