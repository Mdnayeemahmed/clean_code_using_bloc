import 'package:freezed_annotation/freezed_annotation.dart';

part "movies.g.dart";
part "movies.freezed.dart";

@freezed
class MovieResponse with _$MovieResponse {
  factory MovieResponse({
    @Default(0) int total,
    @Default(0) int page,
    @Default(0) int pages,
    @JsonKey(name: 'tv_shows') @Default([]) List<TVShow> tvShows,
  }) = _MovieResponse;

  factory MovieResponse.fromJson(Map<String, dynamic> json) => _$MovieResponseFromJson(json);
}

@freezed
class TVShow with _$TVShow {
  factory TVShow({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String permalink,
    @JsonKey(name: 'start_date') @Default('') String startDate,
    @JsonKey(name: 'end_date') @Default('') String endDate,
    @Default('') String country,
    @Default('') String network,
    @Default('') String status,
    @JsonKey(name: 'image_thumbnail_path') @Default('') String imageThumbnailPath,
  }) = _TVShow;

  factory TVShow.fromJson(Map<String, dynamic> json) => _$TVShowFromJson(json);
}
