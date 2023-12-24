import '../export/export.dart';


extension ApiUrlEx on String {
  String toPagination(int page, int limit) {
    return '$this?page=$page&limit=$limit';
  }

  String toPaginationWithSearch(int page, int limit, String search) {
    return '$this?page=$page&limit=$limit&search=$search';
  }

  String toPaginationWithSearchAndFilter(
      int page, int limit, String search, String filter) {
    return '$this?page=$page&limit=$limit&search=$search&filter=$filter';
  }

  String toPaginationWithFilter(int page, int limit, String filter) {
    return '$this?page=$page&limit=$limit&filter=$filter';
  }

  String toPaginationWithFilterAndSort(
      int page, int limit, String filter, String sort) {
    return '$this?page=$page&limit=$limit&filter=$filter&sort=$sort';
  }

  String toPaginationWithSort(int page, int limit, String sort) {
    return '$this?page=$page&limit=$limit&sort=$sort';
  }

  String toPaginationWithSortAndSearch(
      int page, int limit, String sort, String search) {
    return '$this?page=$page&limit=$limit&sort=$sort&search=$search';
  }

  String toPaginationWithSortAndFilterAndSearch(
      int page, int limit, String sort, String filter, String search) {
    return '$this?page=$page&limit=$limit&sort=$sort&filter=$filter&search=$search';
  }

  String toPaginationWithSortAndFilter(
      int page, int limit, String sort, String filter) {
    return '$this?page=$page&limit=$limit&sort=$sort&filter=$filter';
  }

  String toPaginationWithFilterAndSearch(
      int page, int limit, String filter, String search) {
    return '$this?page=$page&limit=$limit&filter=$filter&search=$search';
  }

  String toPaginationWithSortAndSearchAndFilter(
      int page, int limit, String sort, String search, String filter) {
    return '$this?page=$page&limit=$limit&sort=$sort&search=$search&filter=$filter';
  }

  String toNotificationReadingUrl() {
    return '${AppConstants.userNotificationReadingNotificationByIdUrlFirstExtension}$this${AppConstants.userNotificationReadingNotificationByIdUrlSecondExtension}';
  }

  String converToUrlGetItemById(String url) {
    return '$url$this';
  }

}
