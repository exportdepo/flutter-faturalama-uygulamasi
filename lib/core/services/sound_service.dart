import 'package:audioplayers/audioplayers.dart';

/// Barkod tarama ses efektini çalar (assets/sound/scan.mp3).
///
/// Upstream projesindeki (Dinesh-Sowndar/flutter_billing_app) ile
/// aynı API'yi korur: [playScanSound] tarama algılandığında çağrılır.
class SoundService {
  SoundService._();

  static final SoundService instance = SoundService._();

  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> playScanSound() async {
    await _audioPlayer.play(
      AssetSource('sound/scan.mp3'),
    );
  }

  Future<void> dispose() async {
    await _audioPlayer.dispose();
  }
}