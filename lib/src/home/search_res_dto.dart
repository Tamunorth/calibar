class SearchResponse {
  final int? totalHits;
  final int? currentPage;
  final int? totalPages;
  final List<int>? pageList;
  final List<Foods>? foods;
  const SearchResponse(
      {this.totalHits,
      this.currentPage,
      this.totalPages,
      this.pageList,
      this.foods});
  SearchResponse copyWith(
      {int? totalHits,
      int? currentPage,
      int? totalPages,
      List<int>? pageList,
      List<Foods>? foods}) {
    return SearchResponse(
        totalHits: totalHits ?? this.totalHits,
        currentPage: currentPage ?? this.currentPage,
        totalPages: totalPages ?? this.totalPages,
        pageList: pageList ?? this.pageList,
        foods: foods ?? this.foods);
  }

  Map<String, Object?> toJson() {
    return {
      'totalHits': totalHits,
      'currentPage': currentPage,
      'totalPages': totalPages,
      'pageList': pageList,
      'foods':
          foods?.map<Map<String, dynamic>>((data) => data.toJson()).toList()
    };
  }

  static SearchResponse fromJson(Map<String, Object?> json) {
    return SearchResponse(
        totalHits: json['totalHits'] == null ? null : json['totalHits'] as int,
        currentPage:
            json['currentPage'] == null ? null : json['currentPage'] as int,
        totalPages:
            json['totalPages'] == null ? null : json['totalPages'] as int,
        pageList:
            json['pageList'] == null ? null : json['pageList'] as List<int>,
        foods: json['foods'] == null
            ? null
            : (json['foods'] as List)
                .map<Foods>(
                    (data) => Foods.fromJson(data as Map<String, Object?>))
                .toList());
  }

  @override
  String toString() {
    return '''SearchResponse(
                totalHits:$totalHits,
currentPage:$currentPage,
totalPages:$totalPages,
pageList:$pageList,
foods:${foods.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is SearchResponse &&
        other.runtimeType == runtimeType &&
        other.totalHits == totalHits &&
        other.currentPage == currentPage &&
        other.totalPages == totalPages &&
        other.pageList == pageList &&
        other.foods == foods;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, totalHits, currentPage, totalPages, pageList, foods);
  }
}

class Foods {
  final int? fdcId;
  final String? description;
  final String? commonNames;
  final String? additionalDescriptions;
  final String? dataType;
  final int? ndbNumber;
  final String? publishedDate;
  final String? foodCategory;
  final String? mostRecentAcquisitionDate;
  final String? allHighlightFields;
  final num? score;
  final List<dynamic>? microbes;
  final List<FoodNutrients>? foodNutrients;
  final List<dynamic>? finalFoodInputFoods;
  final List<dynamic>? foodMeasures;
  final List<dynamic>? foodAttributes;
  final List<dynamic>? foodAttributeTypes;
  final List<dynamic>? foodVersionIds;
  const Foods(
      {this.fdcId,
      this.description,
      this.commonNames,
      this.additionalDescriptions,
      this.dataType,
      this.ndbNumber,
      this.publishedDate,
      this.foodCategory,
      this.mostRecentAcquisitionDate,
      this.allHighlightFields,
      this.score,
      this.microbes,
      this.foodNutrients,
      this.finalFoodInputFoods,
      this.foodMeasures,
      this.foodAttributes,
      this.foodAttributeTypes,
      this.foodVersionIds});
  Foods copyWith(
      {int? fdcId,
      String? description,
      String? commonNames,
      String? additionalDescriptions,
      String? dataType,
      int? ndbNumber,
      String? publishedDate,
      String? foodCategory,
      String? mostRecentAcquisitionDate,
      String? allHighlightFields,
      num? score,
      List<dynamic>? microbes,
      List<FoodNutrients>? foodNutrients,
      List<dynamic>? finalFoodInputFoods,
      List<dynamic>? foodMeasures,
      List<dynamic>? foodAttributes,
      List<dynamic>? foodAttributeTypes,
      List<dynamic>? foodVersionIds}) {
    return Foods(
        fdcId: fdcId ?? this.fdcId,
        description: description ?? this.description,
        commonNames: commonNames ?? this.commonNames,
        additionalDescriptions:
            additionalDescriptions ?? this.additionalDescriptions,
        dataType: dataType ?? this.dataType,
        ndbNumber: ndbNumber ?? this.ndbNumber,
        publishedDate: publishedDate ?? this.publishedDate,
        foodCategory: foodCategory ?? this.foodCategory,
        mostRecentAcquisitionDate:
            mostRecentAcquisitionDate ?? this.mostRecentAcquisitionDate,
        allHighlightFields: allHighlightFields ?? this.allHighlightFields,
        score: score ?? this.score,
        microbes: microbes ?? this.microbes,
        foodNutrients: foodNutrients ?? this.foodNutrients,
        finalFoodInputFoods: finalFoodInputFoods ?? this.finalFoodInputFoods,
        foodMeasures: foodMeasures ?? this.foodMeasures,
        foodAttributes: foodAttributes ?? this.foodAttributes,
        foodAttributeTypes: foodAttributeTypes ?? this.foodAttributeTypes,
        foodVersionIds: foodVersionIds ?? this.foodVersionIds);
  }

  Map<String, Object?> toJson() {
    return {
      'fdcId': fdcId,
      'description': description,
      'commonNames': commonNames,
      'additionalDescriptions': additionalDescriptions,
      'dataType': dataType,
      'ndbNumber': ndbNumber,
      'publishedDate': publishedDate,
      'foodCategory': foodCategory,
      'mostRecentAcquisitionDate': mostRecentAcquisitionDate,
      'allHighlightFields': allHighlightFields,
      'score': score,
      'microbes': microbes,
      'foodNutrients': foodNutrients
          ?.map<Map<String, dynamic>>((data) => data.toJson())
          .toList(),
      'finalFoodInputFoods': finalFoodInputFoods,
      'foodMeasures': foodMeasures,
      'foodAttributes': foodAttributes,
      'foodAttributeTypes': foodAttributeTypes,
      'foodVersionIds': foodVersionIds
    };
  }

  static Foods fromJson(Map<String, Object?> json) {
    return Foods(
        fdcId: json['fdcId'] == null ? null : json['fdcId'] as int,
        description:
            json['description'] == null ? null : json['description'] as String,
        commonNames:
            json['commonNames'] == null ? null : json['commonNames'] as String,
        additionalDescriptions: json['additionalDescriptions'] == null
            ? null
            : json['additionalDescriptions'] as String,
        dataType: json['dataType'] == null ? null : json['dataType'] as String,
        ndbNumber: json['ndbNumber'] == null ? null : json['ndbNumber'] as int,
        publishedDate: json['publishedDate'] == null
            ? null
            : json['publishedDate'] as String,
        foodCategory: json['foodCategory'] == null
            ? null
            : json['foodCategory'] as String,
        mostRecentAcquisitionDate: json['mostRecentAcquisitionDate'] == null
            ? null
            : json['mostRecentAcquisitionDate'] as String,
        allHighlightFields: json['allHighlightFields'] == null
            ? null
            : json['allHighlightFields'] as String,
        score: json['score'] == null ? null : json['score'] as num,
        microbes:
            json['microbes'] == null ? null : json['microbes'] as List<dynamic>,
        foodNutrients: json['foodNutrients'] == null
            ? null
            : (json['foodNutrients'] as List)
                .map<FoodNutrients>((data) =>
                    FoodNutrients.fromJson(data as Map<String, Object?>))
                .toList(),
        finalFoodInputFoods: json['finalFoodInputFoods'] == null
            ? null
            : json['finalFoodInputFoods'] as List<dynamic>,
        foodMeasures: json['foodMeasures'] == null
            ? null
            : json['foodMeasures'] as List<dynamic>,
        foodAttributes: json['foodAttributes'] == null
            ? null
            : json['foodAttributes'] as List<dynamic>,
        foodAttributeTypes: json['foodAttributeTypes'] == null
            ? null
            : json['foodAttributeTypes'] as List<dynamic>,
        foodVersionIds: json['foodVersionIds'] == null
            ? null
            : json['foodVersionIds'] as List<dynamic>);
  }

  @override
  String toString() {
    return '''Foods(
                fdcId:$fdcId,
description:$description,
commonNames:$commonNames,
additionalDescriptions:$additionalDescriptions,
dataType:$dataType,
ndbNumber:$ndbNumber,
publishedDate:$publishedDate,
foodCategory:$foodCategory,
mostRecentAcquisitionDate:$mostRecentAcquisitionDate,
allHighlightFields:$allHighlightFields,
score:$score,
microbes:$microbes,
foodNutrients:${foodNutrients.toString()},
finalFoodInputFoods:$finalFoodInputFoods,
foodMeasures:$foodMeasures,
foodAttributes:$foodAttributes,
foodAttributeTypes:$foodAttributeTypes,
foodVersionIds:$foodVersionIds
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Foods &&
        other.runtimeType == runtimeType &&
        other.fdcId == fdcId &&
        other.description == description &&
        other.commonNames == commonNames &&
        other.additionalDescriptions == additionalDescriptions &&
        other.dataType == dataType &&
        other.ndbNumber == ndbNumber &&
        other.publishedDate == publishedDate &&
        other.foodCategory == foodCategory &&
        other.mostRecentAcquisitionDate == mostRecentAcquisitionDate &&
        other.allHighlightFields == allHighlightFields &&
        other.score == score &&
        other.microbes == microbes &&
        other.foodNutrients == foodNutrients &&
        other.finalFoodInputFoods == finalFoodInputFoods &&
        other.foodMeasures == foodMeasures &&
        other.foodAttributes == foodAttributes &&
        other.foodAttributeTypes == foodAttributeTypes &&
        other.foodVersionIds == foodVersionIds;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        fdcId,
        description,
        commonNames,
        additionalDescriptions,
        dataType,
        ndbNumber,
        publishedDate,
        foodCategory,
        mostRecentAcquisitionDate,
        allHighlightFields,
        score,
        microbes,
        foodNutrients,
        finalFoodInputFoods,
        foodMeasures,
        foodAttributes,
        foodAttributeTypes,
        foodVersionIds);
  }
}

class FoodNutrients {
  final int? nutrientId;
  final String? nutrientName;
  final String? nutrientNumber;
  final String? unitName;
  final String? derivationCode;
  final String? derivationDescription;
  final int? derivationId;
  final num? value;
  final int? foodNutrientSourceId;
  final String? foodNutrientSourceCode;
  final String? foodNutrientSourceDescription;
  final int? rank;
  final int? indentLevel;
  final int? foodNutrientId;
  final int? dataPoints;
  final num? min;
  final num? max;
  final num? median;
  const FoodNutrients(
      {this.nutrientId,
      this.nutrientName,
      this.nutrientNumber,
      this.unitName,
      this.derivationCode,
      this.derivationDescription,
      this.derivationId,
      this.value,
      this.foodNutrientSourceId,
      this.foodNutrientSourceCode,
      this.foodNutrientSourceDescription,
      this.rank,
      this.indentLevel,
      this.foodNutrientId,
      this.dataPoints,
      this.min,
      this.max,
      this.median});
  FoodNutrients copyWith(
      {int? nutrientId,
      String? nutrientName,
      String? nutrientNumber,
      String? unitName,
      String? derivationCode,
      String? derivationDescription,
      int? derivationId,
      num? value,
      int? foodNutrientSourceId,
      String? foodNutrientSourceCode,
      String? foodNutrientSourceDescription,
      int? rank,
      int? indentLevel,
      int? foodNutrientId,
      int? dataPoints,
      num? min,
      num? max,
      num? median}) {
    return FoodNutrients(
        nutrientId: nutrientId ?? this.nutrientId,
        nutrientName: nutrientName ?? this.nutrientName,
        nutrientNumber: nutrientNumber ?? this.nutrientNumber,
        unitName: unitName ?? this.unitName,
        derivationCode: derivationCode ?? this.derivationCode,
        derivationDescription:
            derivationDescription ?? this.derivationDescription,
        derivationId: derivationId ?? this.derivationId,
        value: value ?? this.value,
        foodNutrientSourceId: foodNutrientSourceId ?? this.foodNutrientSourceId,
        foodNutrientSourceCode:
            foodNutrientSourceCode ?? this.foodNutrientSourceCode,
        foodNutrientSourceDescription:
            foodNutrientSourceDescription ?? this.foodNutrientSourceDescription,
        rank: rank ?? this.rank,
        indentLevel: indentLevel ?? this.indentLevel,
        foodNutrientId: foodNutrientId ?? this.foodNutrientId,
        dataPoints: dataPoints ?? this.dataPoints,
        min: min ?? this.min,
        max: max ?? this.max,
        median: median ?? this.median);
  }

  Map<String, Object?> toJson() {
    return {
      'nutrientId': nutrientId,
      'nutrientName': nutrientName,
      'nutrientNumber': nutrientNumber,
      'unitName': unitName,
      'derivationCode': derivationCode,
      'derivationDescription': derivationDescription,
      'derivationId': derivationId,
      'value': value,
      'foodNutrientSourceId': foodNutrientSourceId,
      'foodNutrientSourceCode': foodNutrientSourceCode,
      'foodNutrientSourceDescription': foodNutrientSourceDescription,
      'rank': rank,
      'indentLevel': indentLevel,
      'foodNutrientId': foodNutrientId,
      'dataPoints': dataPoints,
      'min': min,
      'max': max,
      'median': median
    };
  }

  static FoodNutrients fromJson(Map<String, Object?> json) {
    return FoodNutrients(
        nutrientId:
            json['nutrientId'] == null ? null : json['nutrientId'] as int,
        nutrientName: json['nutrientName'] == null
            ? null
            : json['nutrientName'] as String,
        nutrientNumber: json['nutrientNumber'] == null
            ? null
            : json['nutrientNumber'] as String,
        unitName: json['unitName'] == null ? null : json['unitName'] as String,
        derivationCode: json['derivationCode'] == null
            ? null
            : json['derivationCode'] as String,
        derivationDescription: json['derivationDescription'] == null
            ? null
            : json['derivationDescription'] as String,
        derivationId:
            json['derivationId'] == null ? null : json['derivationId'] as int,
        value: json['value'] == null ? null : json['value'] as num,
        foodNutrientSourceId: json['foodNutrientSourceId'] == null
            ? null
            : json['foodNutrientSourceId'] as int,
        foodNutrientSourceCode: json['foodNutrientSourceCode'] == null
            ? null
            : json['foodNutrientSourceCode'] as String,
        foodNutrientSourceDescription:
            json['foodNutrientSourceDescription'] == null
                ? null
                : json['foodNutrientSourceDescription'] as String,
        rank: json['rank'] == null ? null : json['rank'] as int,
        indentLevel:
            json['indentLevel'] == null ? null : json['indentLevel'] as int,
        foodNutrientId: json['foodNutrientId'] == null
            ? null
            : json['foodNutrientId'] as int,
        dataPoints:
            json['dataPoints'] == null ? null : json['dataPoints'] as int,
        min: json['min'] == null ? null : json['min'] as num,
        max: json['max'] == null ? null : json['max'] as num,
        median: json['median'] == null ? null : json['median'] as num);
  }

  @override
  String toString() {
    return '''FoodNutrients(
                nutrientId:$nutrientId,
nutrientName:$nutrientName,
nutrientNumber:$nutrientNumber,
unitName:$unitName,
derivationCode:$derivationCode,
derivationDescription:$derivationDescription,
derivationId:$derivationId,
value:$value,
foodNutrientSourceId:$foodNutrientSourceId,
foodNutrientSourceCode:$foodNutrientSourceCode,
foodNutrientSourceDescription:$foodNutrientSourceDescription,
rank:$rank,
indentLevel:$indentLevel,
foodNutrientId:$foodNutrientId,
dataPoints:$dataPoints,
min:$min,
max:$max,
median:$median
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is FoodNutrients &&
        other.runtimeType == runtimeType &&
        other.nutrientId == nutrientId &&
        other.nutrientName == nutrientName &&
        other.nutrientNumber == nutrientNumber &&
        other.unitName == unitName &&
        other.derivationCode == derivationCode &&
        other.derivationDescription == derivationDescription &&
        other.derivationId == derivationId &&
        other.value == value &&
        other.foodNutrientSourceId == foodNutrientSourceId &&
        other.foodNutrientSourceCode == foodNutrientSourceCode &&
        other.foodNutrientSourceDescription == foodNutrientSourceDescription &&
        other.rank == rank &&
        other.indentLevel == indentLevel &&
        other.foodNutrientId == foodNutrientId &&
        other.dataPoints == dataPoints &&
        other.min == min &&
        other.max == max &&
        other.median == median;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        nutrientId,
        nutrientName,
        nutrientNumber,
        unitName,
        derivationCode,
        derivationDescription,
        derivationId,
        value,
        foodNutrientSourceId,
        foodNutrientSourceCode,
        foodNutrientSourceDescription,
        rank,
        indentLevel,
        foodNutrientId,
        dataPoints,
        min,
        max,
        median);
  }
}
