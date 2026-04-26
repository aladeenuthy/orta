import 'package:freezed_annotation/freezed_annotation.dart';

part 'shift_filters.freezed.dart';

@freezed
class ShiftFilters with _$ShiftFilters {
  const factory ShiftFilters({
    ShiftStatusFilter? status,
    ShiftSortBy? sortBy,
    ShiftSortOrder? sortOrder,
  }) = _ShiftFilters;
}

enum ShiftStatusFilter {
  active('active'),
  cancelled('cancelled'),
  completed('completed'),
  inProgress('in_progress');

  const ShiftStatusFilter(this.value);

  final String value;
}

enum ShiftSortBy {
  date('date');

  const ShiftSortBy(this.value);

  final String value;
}

enum ShiftSortOrder {
  asc('asc'),
  desc('desc');

  const ShiftSortOrder(this.value);

  final String value;
}
