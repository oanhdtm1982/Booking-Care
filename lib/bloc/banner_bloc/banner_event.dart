part of 'banner_bloc.dart';

abstract class BannerEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class LoadBanner extends BannerEvent{}

class AddBanner extends BannerEvent{
  final Banner_Model banner;
  AddBanner(this.banner);
  @override
  List<Object> get props => [banner];
}

class UpdateBanner extends BannerEvent{
  final Banner_Model banner;
  UpdateBanner(this.banner);
  @override
  List<Object> get props => [banner];
}

class DeleteBanner extends BannerEvent{
  final Banner_Model banner;
  DeleteBanner(this.banner);
  @override
  List<Object> get props => [banner];
}