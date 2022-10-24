import 'dart:convert';

import 'package:http/http.dart';
import 'package:spotify_prototype/data/models/track_model.dart';
import 'package:spotify_prototype/data/network_services/mocked_network_service.dart';

class NetworkServiceImpl extends NetworkService {
  static const tokenValue =
      'BQCoJyeyUjc3_1-NXwPVuPS5TTHKQdYXxkywnr3mqLeRH54uljd8s-Ao12amVYIQet20cPmiHmJzDcYu6kwaaZ7s84luUrf-XIbe_DIAI59WNrd0KM-dMNS_OoYTY5GsJQeX_En4NkWtiWq50brKYtF7IpvMcsQN4YFBoewVgJ9QYghlRYksEKy1VssAznu406c0pTI';
  static const authorizationKey = 'Authorization';
  static const authHeadersMap = {authorizationKey: 'Bearer $tokenValue'};

  static const clientID = '90da421af5ec49e59fc29d7b7b8fd6d6';
  static const clientSecret = '31657ea47b704240813eaa28131421c5';

  static const httpsScheme = 'https://';
  static const spotifyHost = 'api.spotify.com';
  static const spotifyUrl = '$httpsScheme$spotifyHost';

  static const searchEndpoint = '/v1/search?q=';
  static const searchParams = '&type=track&limit=';
  static String searchParamsQuery(String search, int limit) => '$search$searchParams$limit';

  static const _trackKey = 'tracks';
  static const _itemsKey = 'items';
  static const _nameKey = 'name';
  static const _artistsKey = 'artists';

  @override
  Future<List<TrackModel>> fetchModel({
    required String search,
    required int limit,
  }) async {
    final url = Uri.parse('$spotifyUrl$searchEndpoint${searchParamsQuery(search, limit)}');

    final response = await get(url, headers: authHeadersMap);
    final Map responseMapList = json.decode(response.body);
    final result = <TrackModel>[];
    final items = responseMapList[_trackKey][_itemsKey];
    for (final item in items) {
      final String songName = item[_nameKey];
      final List artistsRawData = item[_artistsKey];
      final artistNames = <String>[];

      for (final Map rawArtistData in artistsRawData) {
        final artistMap = Map<String, dynamic>.from(rawArtistData);
        artistNames.add(artistMap[_nameKey]);
      }

      result.add(
        TrackModel(artistNames: artistNames, songName: songName),
      );
    }
    return result;
  }
}
