import 'dart:convert';

import 'package:http/http.dart';
import 'package:spotify_prototype/data/models/track_model.dart';
import 'package:spotify_prototype/data/network%20services/mocked_network_service.dart';

class NetworkServiceImpl extends NetworkService {
  static const tokenValue =
      'BQBAMQXBhuPH4_Uzk9MuqH3Bshm3ohRZ6Mx_JN5qmfv3Jo7dV3LUAsScXw_zODAv_cUOUSwK7gQlyfC-8VYRzoJivcaV16g6n0fvApIiWgO2wPQHO6HCbPnN-nBSqeTedy-0O3Oc4FmtqTVCstyGSTXLU31dEq3dWJ8g2eqUCFP3KyVkr4meE_H4zIhI3AihTO7BqDQ';
  static const authorizationKey = 'Authorization';
  static const authHeadersMap = {authorizationKey: 'Bearer $tokenValue'};

  @override
  Future<List<TrackModel>> fetchModel() async {
    final url = Uri.parse('https://api.spotify.com/v1/search?q=superman&type=track&limit=3');
    final response = await get(url, headers: authHeadersMap);
    Map<String, dynamic> responseMap = json.decode(response.body);
    final result = <TrackModel>[];
    final artistName = responseMap['tracks']['items'][0]['artists'][0]['name'] ?? 'null';
    final songName = responseMap['tracks']['items'][0]['name'];
    result.add(TrackModel(artistName: artistName, songName: songName));
    return result;
  }
}
