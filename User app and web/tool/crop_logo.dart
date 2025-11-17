import 'dart:io';
import 'package:image/image.dart';

void main(List<String> args) {
  if (args.length < 2) {
    print('Usage: dart run tool/crop_logo.dart <input> <output>');
    exit(1);
  }
  final input = args[0];
  final output = args[1];
  final bytes = File(input).readAsBytesSync();
  final image = decodeImage(bytes);
  if (image == null) {
    print('Could not decode $input');
    exit(1);
  }

  int top = image.height;
  int bottom = 0;
  int left = image.width;
  int right = 0;

  bool isBackground(Pixel pixel) {
    final a = pixel.a;
    if (a == 0) return true;
    final r = pixel.r;
    final g = pixel.g;
    final b = pixel.b;
    return r > 240 && g > 240 && b > 240;
  }

  for (int y = 0; y < image.height; y++) {
    for (int x = 0; x < image.width; x++) {
      final pixel = image.getPixel(x, y);
      if (!isBackground(pixel)) {
        if (y < top) top = y;
        if (y > bottom) bottom = y;
        if (x < left) left = x;
        if (x > right) right = x;
      }
    }
  }

  if (top > bottom || left > right) {
    print('Image appears empty');
    exit(1);
  }

  final cropped = copyCrop(image,
      x: left,
      y: top,
      width: right - left + 1,
      height: bottom - top + 1);

  File(output).writeAsBytesSync(encodePng(cropped));
  print('Saved cropped logo to $output');
}
