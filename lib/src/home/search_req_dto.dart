class SearchReq {
  final String? query;
  final List<String>? dataType;
  final int? pageSize;
  final int? pageNumber;
  final String? sortBy;
  final String? sortOrder;
  final String? apiKey;
  const SearchReq(
      {this.query,
      this.dataType,
      this.pageSize,
      this.pageNumber,
      this.sortBy,
      this.sortOrder,
      this.apiKey});
  SearchReq copyWith(
      {String? query,
      List<String>? dataType,
      int? pageSize,
      int? pageNumber,
      String? sortBy,
      String? sortOrder,
      String? apiKey}) {
    return SearchReq(
        query: query ?? this.query,
        dataType: dataType ?? this.dataType,
        pageSize: pageSize ?? this.pageSize,
        pageNumber: pageNumber ?? this.pageNumber,
        sortBy: sortBy ?? this.sortBy,
        sortOrder: sortOrder ?? this.sortOrder,
        apiKey: apiKey ?? this.apiKey);
  }

  Map<String, Object?> toJson() {
    return {
      'query': query,
      'dataType': dataType,
      'pageSize': pageSize,
      'pageNumber': pageNumber,
      'sortBy': sortBy,
      'sortOrder': sortOrder,
      'api_key': apiKey
    };
  }

  static SearchReq fromJson(Map<String, Object?> json) {
    return SearchReq(
        query: json['query'] == null ? null : json['query'] as String,
        dataType:
            json['dataType'] == null ? null : json['dataType'] as List<String>,
        pageSize: json['pageSize'] == null ? null : json['pageSize'] as int,
        pageNumber:
            json['pageNumber'] == null ? null : json['pageNumber'] as int,
        sortBy: json['sortBy'] == null ? null : json['sortBy'] as String,
        sortOrder:
            json['sortOrder'] == null ? null : json['sortOrder'] as String,
        apiKey: json['api_key'] == null ? null : json['api_key'] as String);
  }

  @override
  String toString() {
    return '''SearchReq(
                query:$query,
dataType:$dataType,
pageSize:$pageSize,
pageNumber:$pageNumber,
sortBy:$sortBy,
sortOrder:$sortOrder,
apiKey:$apiKey
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is SearchReq &&
        other.runtimeType == runtimeType &&
        other.query == query &&
        other.dataType == dataType &&
        other.pageSize == pageSize &&
        other.pageNumber == pageNumber &&
        other.sortBy == sortBy &&
        other.sortOrder == sortOrder &&
        other.apiKey == apiKey;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, query, dataType, pageSize, pageNumber,
        sortBy, sortOrder, apiKey);
  }
}
