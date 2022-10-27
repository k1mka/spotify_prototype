import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_prototype/data/repository/repository.dart';
import 'package:spotify_prototype/get_it.dart';
import 'package:spotify_prototype/presentation/screens/likest_screen/bloc/favourite_bloc.dart';
import 'package:spotify_prototype/presentation/screens/likest_screen/favorite_layout.dart';

class LikestScreen extends StatelessWidget {
  const LikestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavoriteBloc>(
      create: (context) => FavoriteBloc(getIt<Repository>()),
      child: const FavoriteLayout(),
    );
  }
}
