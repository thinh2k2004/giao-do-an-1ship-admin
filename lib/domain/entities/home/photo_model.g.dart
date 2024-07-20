// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../domain/entities/home/photo_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PhotoModelCWProxy {
  PhotoModel albumId(int albumId);

  PhotoModel id(int id);

  PhotoModel title(String title);

  PhotoModel url(String url);

  PhotoModel thumbnailUrl(String thumbnailUrl);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PhotoModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PhotoModel(...).copyWith(id: 12, name: "My name")
  /// ````
  PhotoModel call({
    int? albumId,
    int? id,
    String? title,
    String? url,
    String? thumbnailUrl,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPhotoModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPhotoModel.copyWith.fieldName(...)`
class _$PhotoModelCWProxyImpl implements _$PhotoModelCWProxy {
  const _$PhotoModelCWProxyImpl(this._value);

  final PhotoModel _value;

  @override
  PhotoModel albumId(int albumId) => this(albumId: albumId);

  @override
  PhotoModel id(int id) => this(id: id);

  @override
  PhotoModel title(String title) => this(title: title);

  @override
  PhotoModel url(String url) => this(url: url);

  @override
  PhotoModel thumbnailUrl(String thumbnailUrl) =>
      this(thumbnailUrl: thumbnailUrl);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PhotoModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PhotoModel(...).copyWith(id: 12, name: "My name")
  /// ````
  PhotoModel call({
    Object? albumId = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? url = const $CopyWithPlaceholder(),
    Object? thumbnailUrl = const $CopyWithPlaceholder(),
  }) {
    return PhotoModel(
      albumId: albumId == const $CopyWithPlaceholder() || albumId == null
          ? _value.albumId
          // ignore: cast_nullable_to_non_nullable
          : albumId as int,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
      title: title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      url: url == const $CopyWithPlaceholder() || url == null
          ? _value.url
          // ignore: cast_nullable_to_non_nullable
          : url as String,
      thumbnailUrl:
          thumbnailUrl == const $CopyWithPlaceholder() || thumbnailUrl == null
              ? _value.thumbnailUrl
              // ignore: cast_nullable_to_non_nullable
              : thumbnailUrl as String,
    );
  }
}

extension $PhotoModelCopyWith on PhotoModel {
  /// Returns a callable class that can be used as follows: `instanceOfPhotoModel.copyWith(...)` or like so:`instanceOfPhotoModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PhotoModelCWProxy get copyWith => _$PhotoModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoModel _$PhotoModelFromJson(Map<String, dynamic> json) => PhotoModel(
      albumId: json['albumId'] as int? ?? -1,
      id: json['id'] as int? ?? -1,
      title: json['title'] as String? ?? '',
      url: json['url'] as String? ?? '',
      thumbnailUrl: json['thumbnailUrl'] as String? ?? '',
    );

Map<String, dynamic> _$PhotoModelToJson(PhotoModel instance) =>
    <String, dynamic>{
      'albumId': instance.albumId,
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
    };
