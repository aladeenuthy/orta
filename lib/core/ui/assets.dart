import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AssetManager {
  static const _package = "whering";

  const AssetManager();
  static Future<void> preCacheAssets() async {
    await Future.wait(AssetSvgs.values.map(_cacheSVG));
  }

  static Future<void> cacheSvgAsset(
    String assetSVG, {
    String? packageNem,
  }) async {
    final SvgAssetLoader loader = SvgAssetLoader(assetSVG);
    await svg.cache.putIfAbsent(
      loader.cacheKey(null),
      () => loader.loadBytes(null),
    );
  }

  static Future<void> _cacheSVG(AssetSvgs assetSVG) async {
    final SvgAssetLoader loader = SvgAssetLoader(
      assetSVG.path,
      packageName: _package,
    );
    await svg.cache.putIfAbsent(
      loader.cacheKey(null),
      () => loader.loadBytes(null),
    );
  }

  static AppSvgWidget getAssetSvg(
    AssetSvgs asset, {
    Color? color,
    double? height,
    double? width,
    Key? key,
    String package = _package,
  }) {
    return AppSvgWidget(
      asset.path,
      key: key,
      height: height,
      width: width,
      color: color,
    );
  }
}

enum AssetSvgs {
  logo('assets/svgs/logo.svg'),
  logoFull('assets/svgs/logo_full.svg'),
  grid('assets/svgs/grid.svg'),
  bookmark('assets/svgs/bookmark.svg'),
  stats('assets/svgs/stats.svg'),
  favIcon('assets/svgs/fav_icon.svg'),
  share('assets/svgs/share.svg'),
  edit('assets/svgs/edit.svg');

  final String path;
  const AssetSvgs(this.path);
}

enum AssetPngs {
  profileBg('assets/pngs/profile_bg.png'),
  userAvatar('assets/pngs/user.png'),
  tops('assets/pngs/tops.png'),
  bottoms('assets/pngs/bottoms.png'),
  footwear('assets/pngs/footwear.png'),
  outerwear('assets/pngs/outerwear.png'),
  all('assets/pngs/all.png');

  final String path;
  const AssetPngs(this.path);
}

class AppSvgWidget extends StatelessWidget {
  final String assetPath;
  final Color? color;
  final double? height;
  final double? width;
  const AppSvgWidget(
    this.assetPath, {
    super.key,
    this.color,
    this.height,
    this.width,
  });

  /// Returns a new instance with updated properties.
  AppSvgWidget copyWith({
    String? assetPath,
    Color? color,
    double? height,
    double? width,
  }) {
    return AppSvgWidget(
      assetPath ?? this.assetPath,
      color: color ?? this.color,
      height: height ?? this.height,
      width: width ?? this.width,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: SvgPicture.asset(
        assetPath,
        colorFilter: color != null
            ? ColorFilter.mode(color!, BlendMode.srcIn)
            : null,
        height: height,
        width: width,
      ),
    );
  }
}
