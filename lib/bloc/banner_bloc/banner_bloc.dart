import 'package:bloc/bloc.dart';
import 'package:doanchuyennganh/Models/Banner.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../repository/banner_repository/bannerRepository.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent,BannerState>{
  final BannerRepository _bannerRepository;
  BannerBloc({required  bannerRepository})
      : _bannerRepository = bannerRepository,
        super(BannerLoading()){
    on<LoadBanner>((event,emit) async{
      emit(BannerLoading());
      try{
        List<Banner_Model> listBanners = await _bannerRepository.getAllBanner();
        emit(BannerLoaded(listBanners));
      }catch(e){
        UnLoadedBanner();
        BannerError(e.toString());
      }
    });
  }
}

