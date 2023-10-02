// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

// ignore: library_prefixes
import '../../domain/entities/banner_entity.dart' as bannerEntity;

part 'banner_model.freezed.dart';
part 'banner_model.g.dart';

BannerModel bannerModelFromJson(String str) =>
    BannerModel.fromJson(json.decode(str));

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

@freezed
class BannerModel extends bannerEntity.BannerEntity with _$BannerModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BannerModel({
    required List<Data> data,
    required Meta meta,
  }) = _BannerModel;

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);
}

@freezed
class Data extends bannerEntity.Data with _$Data {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Data({
    int? id,
    String? title,
    String? description,
    String? selfType,
    String? selfLink,
    List<String>? tags,
    List<String>? filterTags,
    String? appLink,
    Cover? cover,
    List<Gallery>? gallery,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class Cover extends bannerEntity.Cover with _$Cover {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Cover({
    String? name,
    String? hash,
    String? mime,
    int? width,
    int? height,
    String? url,
  }) = _Cover;

  factory Cover.fromJson(Map<String, dynamic> json) => _$CoverFromJson(json);
}

@freezed
class Gallery extends bannerEntity.Gallery with _$Gallery {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Gallery({
    String? name,
    String? hash,
    String? mime,
    int? width,
    int? height,
    String? url,
  }) = _Gallery;

  factory Gallery.fromJson(Map<String, dynamic> json) =>
      _$GalleryFromJson(json);
}

@freezed
class Meta extends bannerEntity.Meta with _$Meta {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Meta({
    List<String>? filterTags,
    dynamic prev,
    dynamic next,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}
