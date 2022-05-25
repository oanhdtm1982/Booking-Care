import 'package:doanchuyennganh/Models/Banner.dart';

abstract class BaseBannerRepository{
  Future<List<Banner_Model>> getAllBanner();
}