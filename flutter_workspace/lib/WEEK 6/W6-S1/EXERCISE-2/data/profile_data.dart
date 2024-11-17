import 'package:flutter/material.dart';
import 'package:flutter_workspace/WEEK%206/W6-S1/EXERCISE-2/model/profile_tile_model.dart';

ProfileData ronanProfile = ProfileData(
    name: "Ronan",
    position: "Flutter Developer",
    avatarUrl: 'assets/images/w4-s2/khun.jpg',
    tiles: [
      TileData(
          icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
      TileData(
          icon: Icons.location_on, title: "Address", value: "123 Cambodia"),
      TileData(icon: Icons.email, title: "Mail", value: "ronan.ogogr@cadt.edu"),
      TileData(icon: Icons.person, title: "Gender", value: "Male"),
      TileData(icon: Icons.favorite, title: "Favorite", value: "Music"),
      TileData(icon: Icons.verified, title: "Zin heh", value: "Zin"),
    ]);
