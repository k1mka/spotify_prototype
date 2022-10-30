import 'package:hive/hive.dart';
part 'track_model.g.dart';

@HiveType(typeId: 0)
class TrackModel {
  TrackModel({
    required this.artistNames,
    required this.songName,
  });

  @HiveField(0)
  final List songName;
  @HiveField(1)
  final List<String> artistNames;

  String get artistsNamesFormatted => artistNames.join(', ');

  @override
  String toString() => 'TrackModel{songName: $songName, artistName: $artistNames}';
}
