import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_prototype/presentation/screens/search_screen/bloc/search_bloc.dart';
import 'package:spotify_prototype/presentation/screens/search_screen/bloc/search_events.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  Timer? _debounce;
  final controller = TextEditingController();

  @override
  void initState() {
    controller.addListener(() {
      if (controller.text.isNotEmpty) {
        _debounce = Timer(const Duration(milliseconds: 500), () {
          context.read<SearchBloc>().add(SearchTrackEvent(controller.text, 20));
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        suffixIcon: controller.text.isNotEmpty
            ? null
            : IconButton(
                onPressed: () {
                  setState(() {
                    controller.clear();
                    FocusManager.instance.primaryFocus?.unfocus();
                  });
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.white,
        ),
        hintText: 'Search',
        hintStyle: const TextStyle(color: Colors.white),
      ),
    );
  }
}
