class PaginatedResponse<T> {
  const PaginatedResponse({
    required this.data,
    required this.currentPage,
    required this.totalPages,
    required this.totalCount,
    required this.hasNextPage,
    required this.hasPrevPage,
    required this.limit,
  });

  factory PaginatedResponse.fromJson({
    required Map<String, dynamic> json,
    required T Function(dynamic) fromJson,
    required String dataKey,
    String paginationKey = 'pagination',
  }) {
    final Map<String, dynamic> pagination = Map<String, dynamic>.from(
      json[paginationKey] as Map,
    );

    return PaginatedResponse<T>(
      data: (json[dataKey] as List<dynamic>)
          .map((dynamic e) => fromJson(e))
          .toList(),
      currentPage: pagination['currentPage'] as int,
      totalPages: pagination['totalPages'] as int,
      totalCount: pagination['totalCount'] as int,
      hasNextPage: pagination['hasNextPage'] as bool,
      hasPrevPage: pagination['hasPrevPage'] as bool,
      limit: pagination['limit'] as int,
    );
  }

  final List<T> data;
  final int currentPage;
  final int totalPages;
  final int totalCount;
  final bool hasNextPage;
  final bool hasPrevPage;
  final int limit;
}
