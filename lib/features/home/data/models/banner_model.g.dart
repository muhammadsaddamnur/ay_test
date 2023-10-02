// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BannerModel _$$_BannerModelFromJson(Map<String, dynamic> json) =>
    _$_BannerModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BannerModelToJson(_$_BannerModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };

_$_Data _$$_DataFromJson(Map<String, dynamic> json) => _$_Data(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      selfType: json['self_type'] as String?,
      selfLink: json['self_link'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      filterTags: (json['filter_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      appLink: json['app_link'] as String?,
      cover: json['cover'] == null
          ? null
          : Cover.fromJson(json['cover'] as Map<String, dynamic>),
      gallery: (json['gallery'] as List<dynamic>?)
          ?.map((e) => Gallery.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DataToJson(_$_Data instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'self_type': instance.selfType,
      'self_link': instance.selfLink,
      'tags': instance.tags,
      'filter_tags': instance.filterTags,
      'app_link': instance.appLink,
      'cover': instance.cover,
      'gallery': instance.gallery,
    };

_$_Cover _$$_CoverFromJson(Map<String, dynamic> json) => _$_Cover(
      name: json['name'] as String?,
      hash: json['hash'] as String?,
      mime: json['mime'] as String?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$_CoverToJson(_$_Cover instance) => <String, dynamic>{
      'name': instance.name,
      'hash': instance.hash,
      'mime': instance.mime,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
    };

_$_Gallery _$$_GalleryFromJson(Map<String, dynamic> json) => _$_Gallery(
      name: json['name'] as String?,
      hash: json['hash'] as String?,
      mime: json['mime'] as String?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$_GalleryToJson(_$_Gallery instance) =>
    <String, dynamic>{
      'name': instance.name,
      'hash': instance.hash,
      'mime': instance.mime,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
    };

_$_Meta _$$_MetaFromJson(Map<String, dynamic> json) => _$_Meta(
      filterTags: (json['filter_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      prev: json['prev'],
      next: json['next'],
    );

Map<String, dynamic> _$$_MetaToJson(_$_Meta instance) => <String, dynamic>{
      'filter_tags': instance.filterTags,
      'prev': instance.prev,
      'next': instance.next,
    };
