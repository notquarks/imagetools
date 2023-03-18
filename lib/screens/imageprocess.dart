import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imagetools/providers/data_provider.dart';
import 'package:imagetools/screens/settings.dart';
import 'package:imagetools/utils.dart';
import 'package:path_provider/path_provider.dart';

class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ImageProcessor _imageProcessor = ImageProcessor(ref);
    final imageFile = ref.watch(imageFileProvider);
    final upscaledImage = ref.watch(upscaledImageProvider);
    final isProcessing = ref.watch(isProcessingProvider);
    final errorMessage = ref.watch(errorMessagesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Image Upscaler'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SettingsPage())),
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (imageFile != null) Image.file(imageFile),
              if (upscaledImage != null) Image.file(upscaledImage),
              if (errorMessage != null) Text(errorMessage),
              if (isProcessing) CircularProgressIndicator(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // final Directory tempDir = await getTemporaryDirectory();
          // tempDir.delete(recursive: true);
          final pickedFile = await _imageProcessor.pickImage();
          if (pickedFile != null) {
            ref.read(imageFileProvider.notifier).state = pickedFile;
            ref.read(upscaledImageProvider.notifier).state = null;
            ref.read(errorMessagesProvider.notifier).state = null;
            ref.read(isProcessingProvider.notifier).state = true;

            final upscaledImage =
                await _imageProcessor.upscaleImage(pickedFile);
            ref.read(upscaledImageProvider.notifier).state = upscaledImage;
            ref.read(isProcessingProvider.notifier).state = false;
            ref.read(errorMessagesProvider.notifier).state =
                upscaledImage == null ? 'Error: Image upscaling failed' : null;
          }
        },
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
