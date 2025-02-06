import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:testfun_project/Config.dart';

/// CameraApp is the Main Application.
class CameraApp extends StatefulWidget {
  /// Default Constructor
  const CameraApp({super.key});

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController controller;

  late List<CameraDescription> _cameras;

  late XFile _image;

  double zoomlv = 1.0;

  bool isFlash = false;

  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    cameraSet();
  }

  cameraSet() async {
    _cameras = await availableCameras();
    print('cnt: ${_cameras.length}');
    controller = CameraController(_cameras[0], ResolutionPreset.high);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
    controller.debugCheckIsDisposed();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return Container(
      child: Column(
        children: [
          CameraPreview(controller),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () async {
                    print('push push bolt btn');
                    if (isFlash) {
                      controller.setFlashMode(FlashMode.off);
                      isFlash = false;
                    } else {
                      controller.setFlashMode(FlashMode.torch);
                      isFlash = true;
                    }
                  },
                  icon: const Icon(
                    Icons.bolt,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    print('push push camera btn');
                    controller.takePicture().then((value) {
                      setState(() {
                        _image = value;
                        print(
                            '==================== image file =========================: ${_image.path} / ${_image.mimeType} / ${_image.name}');
                        Navigator.of(context).pop();
                      });
                    });
                  },
                  icon: const Icon(
                    Icons.camera_outlined,
                    size: 70,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    print('push push gallery btn');
                    XFile? file =
                        await picker.pickImage(source: ImageSource.gallery);
                  },
                  icon: const Icon(
                    Icons.photo_library_rounded,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
