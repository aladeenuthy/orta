class PaginatedResponse<T> {
  PaginatedResponse({
    required this.data,
    required this.total,
    required this.page,
    required this.hasNextPage,
  });

  factory PaginatedResponse.fromJson({
    required Map<String, dynamic> json,
    required T Function(dynamic) fromJson,
    required String dataKey,
  }) {
    return PaginatedResponse<T>(
      data: (json[dataKey] as List<dynamic>).map((dynamic e) => fromJson(e)).toList(),
      total: json["total"] as int,
      page: json["page"] as int,
      hasNextPage: !(json["end"] as bool),
    );
  }

  final List<T> data;
  final int total;
  final int page;
  final bool hasNextPage;
}
