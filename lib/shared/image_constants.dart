class ImagePaths {
  static ImagePaths? _instance;

  static ImagePaths get instance {
    return _instance ??= ImagePaths._init();
  }

  ImagePaths._init();

  final bush_radio = "bush_radio".toImage;
  final butlins_holiday_camp = "butlins_holiday_camp".toImage;
  final cary_grant = "cary_grant".toImage;
  final christmas = "christmas".toImage;
  final cloth_line = "cloth_line".toImage;
  final coffee_maker = "coffee_maker".toImage;
  final cook_book = "cook_book".toImage;
  final corset = "corset".toImage;
  final elizabeth_taior = "elizabeth_taior".toImage;
  final elvis_preseley = "elvis_preseley".toImage;
  final family_life = "family_life".toImage;
  final frist_birth = "frist_birth".toImage;
  final gas_cooker = "gas_cooker".toImage;
  final hats = "hats".toImage;
  final marilyn_monroe = "marilyn_monroe".toImage;
  final moris_manor = "moris_manor".toImage;
  final men_fashion = "cauliflower".toImage;
  final queen_coronation = "queen_coronation".toImage;
  final richard_wattis_comedian = "richard_wattis_comedian".toImage;
  final shool_days = "shool_days".toImage;
  final singer_sewing_machine = "singer_sewing_machine".toImage;
  final sun_night = "sun_night".toImage;
  final swinging_60s = "swinging_60s".toImage;
  final telephone = "telephone".toImage;
  final the_beatles = "the_beatles".toImage;
  final the_blue_lampmovie = "the_blue_lampmovie".toImage;
  final the_way_cook_book = "the_way_cook_book".toImage;
  final tv = "tv".toImage;
  final wedding_attire = "wedding_attire".toImage;
  final what_my_line_tv_show = "what_my_line_tv_show".toImage;

}

extension ImagePathExtension on String {
  String get toImage => "assets/memories/$this.jpg";
}

extension ImagePathPinsExtension on String {
  String get toPinsImage => "assets/pins/$this.jpg";
}
