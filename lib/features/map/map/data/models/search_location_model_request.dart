class SearchLocationModelRequest {
  final String? keyWord;
  final String? lat;
  final String? lon;
  final int? pageNo;
  final int? pageSize;

  SearchLocationModelRequest({
    this.keyWord,
    this.lat,
    this.lon,
    this.pageNo,
    this.pageSize,
  });
}
