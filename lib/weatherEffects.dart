import 'package:just_audio/just_audio.dart';

class WeatherEffects {
  String weather;
  WeatherEffects(this.weather) {
    var player = AudioPlayer();
    String path = "audio/" + weather + ".mp3";
    player.setAsset(path);
    player.play();
  }
}
