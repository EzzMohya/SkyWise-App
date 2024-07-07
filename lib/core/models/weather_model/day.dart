import 'package:equatable/equatable.dart';

import 'condition.dart';

class Day extends Equatable {
  final double? maxtempC;
  final double? maxtempF;
  final double? mintempC;
  final double? mintempF;
  final double? avgtempC;
  final double? avgtempF;
  final double? maxwindMph;
  final double? maxwindKph;
  final double? totalprecipMm;
  final double? totalprecipIn;
  final double? totalsnowCm;
  final double? avgvisKm;
  final double? avgvisMiles;
  final double? avghumidity;
  final double? dailyWillItRain;
  final double? dailyChanceOfRain;
  final double? dailyWillItSnow;
  final double? dailyChanceOfSnow;
  final Condition? condition;
  final double? uv;

  const Day({
    this.maxtempC,
    this.maxtempF,
    this.mintempC,
    this.mintempF,
    this.avgtempC,
    this.avgtempF,
    this.maxwindMph,
    this.maxwindKph,
    this.totalprecipMm,
    this.totalprecipIn,
    this.totalsnowCm,
    this.avgvisKm,
    this.avgvisMiles,
    this.avghumidity,
    this.dailyWillItRain,
    this.dailyChanceOfRain,
    this.dailyWillItSnow,
    this.dailyChanceOfSnow,
    this.condition,
    this.uv,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        maxtempC: (json['maxtemp_c'] as num?)?.toDouble(),
        maxtempF: (json['maxtemp_f'] as num?)?.toDouble(),
        mintempC: (json['mintemp_c'] as num?)?.toDouble(),
        mintempF: (json['mintemp_f'] as num?)?.toDouble(),
        avgtempC: (json['avgtemp_c'] as num?)?.toDouble(),
        avgtempF: (json['avgtemp_f'] as num?)?.toDouble(),
        maxwindMph: (json['maxwind_mph'] as num?)?.toDouble(),
        maxwindKph: (json['maxwind_kph'] as num?)?.toDouble(),
        totalprecipMm: (json['totalprecip_mm'] as num?)?.toDouble(),
        totalprecipIn: (json['totalprecip_in'] as num?)?.toDouble(),
        totalsnowCm: (json['totalsnow_cm'] as num?)?.toDouble(),
        avgvisKm: (json['avgvis_km'] as num?)?.toDouble(),
        avgvisMiles: (json['avgvis_miles'] as num?)?.toDouble(),
        avghumidity: (json['avghumidity'] as num?)?.toDouble(),
        dailyWillItRain: (json['daily_will_it_rain'] as num?)?.toDouble(),
        dailyChanceOfRain: (json['daily_chance_of_rain'] as num?)?.toDouble(),
        dailyWillItSnow: (json['daily_will_it_snow'] as num?)?.toDouble(),
        dailyChanceOfSnow: (json['daily_chance_of_snow'] as num?)?.toDouble(),
        condition: json['condition'] == null
            ? null
            : Condition.fromJson(json['condition'] as Map<String, dynamic>),
        uv: (json['uv'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'maxtemp_c': maxtempC,
        'maxtemp_f': maxtempF,
        'mintemp_c': mintempC,
        'mintemp_f': mintempF,
        'avgtemp_c': avgtempC,
        'avgtemp_f': avgtempF,
        'maxwind_mph': maxwindMph,
        'maxwind_kph': maxwindKph,
        'totalprecip_mm': totalprecipMm,
        'totalprecip_in': totalprecipIn,
        'totalsnow_cm': totalsnowCm,
        'avgvis_km': avgvisKm,
        'avgvis_miles': avgvisMiles,
        'avghumidity': avghumidity,
        'daily_will_it_rain': dailyWillItRain,
        'daily_chance_of_rain': dailyChanceOfRain,
        'daily_will_it_snow': dailyWillItSnow,
        'daily_chance_of_snow': dailyChanceOfSnow,
        'condition': condition?.toJson(),
        'uv': uv,
      };

  @override
  List<Object?> get props {
    return [
      maxtempC,
      maxtempF,
      mintempC,
      mintempF,
      avgtempC,
      avgtempF,
      maxwindMph,
      maxwindKph,
      totalprecipMm,
      totalprecipIn,
      totalsnowCm,
      avgvisKm,
      avgvisMiles,
      avghumidity,
      dailyWillItRain,
      dailyChanceOfRain,
      dailyWillItSnow,
      dailyChanceOfSnow,
      condition,
      uv,
    ];
  }
}
