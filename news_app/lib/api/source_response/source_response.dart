import 'source.dart';

class SourceResponse {
  String? status;
  List<SourceApi>? sources;

  SourceResponse({this.status, this.sources});

  factory SourceResponse.fromJson(Map<String, dynamic> json) {
    return SourceResponse(
      status: json['status'] as String?,
      sources: (json['sources'] as List<dynamic>?)
          ?.map((e) => SourceApi.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'sources': sources?.map((e) => e.toJson()).toList(),
      };
}
