
import 'package:doanchuyennganh/services/BannerService/BannerSevice.dart';
import '../../Models/Banner.dart';
import 'base_banner_repository.dart';

class BannerRepository extends BaseBannerRepository{
  BannerService service = BannerService();
  @override
  Future<List<Banner_Model>> getAllBanner() async{
    return await service.retrieveBannerData();
  }
}