part of 'banner_bloc.dart';

@immutable
abstract class BannerState extends Equatable{
  const BannerState();
  @override
  List<Object> get props => [];
}

class BannerLoading extends BannerState{}

class BannerLoaded extends BannerState{
  final List<Banner_Model> banners;
  BannerLoaded(this.banners);
  @override
  List<Object> get props => [banners];
}

class UnLoadedBanner extends BannerState{
  @override
  List<Object> get props => [];
}

class BannerError extends BannerState{
  final String errors;
  BannerError(this.errors);
  @override
  List<Object> get props => [errors];
}