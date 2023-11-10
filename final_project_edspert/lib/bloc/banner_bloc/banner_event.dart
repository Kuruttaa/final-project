part of 'banner_bloc.dart';

@immutable
sealed class BannerEvent {}

class GetBannerListView extends BannerEvent {}

class DeleteBannerEvent extends BannerEvent {}
