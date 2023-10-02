class BannerEntity {
  final List<Data> data;
  final Meta meta;

  BannerEntity({
    required this.data,
    required this.meta,
  });
}

class Data {
  final int? id;
  final String? title;
  final String? description;
  final String? selfType;
  final String? selfLink;
  final List<String>? tags;
  final List<String>? filterTags;
  final String? appLink;
  final Cover? cover;
  final List<Gallery>? gallery;

  Data({
    this.id,
    this.title,
    this.description,
    this.selfType,
    this.selfLink,
    this.tags,
    this.filterTags,
    this.appLink,
    this.cover,
    this.gallery,
  });
}

class Cover {
  final String? name;
  final String? hash;
  final String? mime;
  final int? width;
  final int? height;
  final String? url;

  Cover({
    this.name,
    this.hash,
    this.mime,
    this.width,
    this.height,
    this.url,
  });
}

class Gallery {
  final String? name;
  final String? hash;
  final String? mime;
  final int? width;
  final int? height;
  final String? url;

  Gallery({
    this.name,
    this.hash,
    this.mime,
    this.width,
    this.height,
    this.url,
  });
}

class Meta {
  final List<String>? filterTags;
  final dynamic prev;
  final dynamic next;

  Meta({
    this.filterTags,
    this.prev,
    this.next,
  });
}
