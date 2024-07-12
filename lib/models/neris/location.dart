// https://github.com/ulfsri/neris-framework/blob/main/modules/yml/shared/mod_civic_location.yml

import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';
part 'location.g.dart';

@freezed
class Location with _$Location {
  const Location._();

  const factory Location({
    required String id,
    String? anPrefix,
    int? anNumber,
    String? anSuffix,
    String? anComplete,
    String? distanceMarker,
    String? snPreModifier,
    String? snPreDirectional,
    String? snPreType,
    String? snPreTypeSeparator,
    String? snStreetName,
    String? snPostType,
    String? snPostDirectional,
    String? snPostModifier,
    String? snDirectionOfTravel,
    String? wing,
    String? floor,
    String? unitPreType,
    String? unitValue,
    String? room,
    String? section,
    String? row,
    String? seat,
    String? additional,
    String? marker,
    String? postalCommunity,
    String? neighborhoodCommunity,
    String? unincorporatedCommunity,
    String? incorporatedMunicipality,
    String? county,
    String? state,
    String? postalCode,
    String? postalCodeExtension,
    String? country,
  }) = _Location;

  factory Location.fromJson(Map<String, Object?> json) => _$LocationFromJson(json);

  String renderAddressNumber() {
    String an = "$anNumber";
    if (anPrefix?.isNotEmpty ?? false) {
      an = anPrefix! + an;
    }
    if (anSuffix?.isNotEmpty ?? false) {
      an = "$an $anSuffix";
    }
    return an;
  }

  String renderStreetName() {
    List<String?> components = [snPreType, snStreetName, snPostType];
    return components.whereNotNull().join(' ');
  }

  String renderMunicipality() {
    String municipality = "";

    return municipality;
  }

  String locationSummary() {
    return "${renderAddressNumber()} ${renderStreetName()}";
  }

  String? locationDetail() {
    String detail = "";

    if (detail.isNotEmpty) {
      return detail;
    }
    return null;
  }

  String locationMunicipality() {
    return "$incorporatedMunicipality, $state";
  }
}