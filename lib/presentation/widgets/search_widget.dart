import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_prototype/presentation/screens/playlist_screen/bloc/tracklist_events.dart';
import 'package:spotify_prototype/presentation/screens/playlist_screen/bloc/traclist_bloc.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  void initState() {
    controller.addListener(() {
      if (controller.text.isNotEmpty) {
        context.read<PlayListBloc>().add(SearchTrackEvent(controller.text, 20));
      }
    });
    super.initState();
    // инит стейт
  }

  // запрос не в начале

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
