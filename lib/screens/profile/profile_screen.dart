import 'dart:io';

import 'package:app_plant/screens/profile/components/native_camera_page.dart';
import 'package:app_plant/screens/profile/components/storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:app_plant/constants.dart';
import 'package:app_plant/components/profile_bottom_nav_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _imageFile;

  Future<void> _requestPermissions() async {
    await Permission.camera.request();
    await Permission.storage.request();
    await Permission.manageExternalStorage.request();
  }

  Future<void> _takePicture() async {
    await _requestPermissions();
    final File? result = await Navigator.push<File?>(
      context,
      MaterialPageRoute(builder: (_) => const CameraPage()),
    );
    if (result != null) {
      final saved = await StorageHelper.saveImage(result, 'camera');
      setState(() => _imageFile = saved);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Disimpan: ${saved.path}')),
      );
    }
  }

  Future<void> _pickFromGallery() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      final saved = await StorageHelper.saveImage(File(picked.path), 'gallery');
      setState(() => _imageFile = saved);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Disimpan: ${saved.path}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: const Text("Profile"),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      bottomNavigationBar: const ProfileBottomNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Text('Silahkan Lengkapi Identitasmu'),
              SizedBox(height: 20,),
              CircleAvatar(
                radius: 60,
                backgroundImage:
                    _imageFile != null ? FileImage(_imageFile!) : null,
                backgroundColor: Colors.grey[300],
                child: _imageFile == null
                    ? const Icon(Icons.person, size: 60, color: Colors.white70)
                    : null,
              ),
              const SizedBox(height: 16),
              Text(
                'Foto Profil',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.camera_alt),
                      label: const Text('Ambil Foto'),
                      onPressed: _takePicture,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.photo_library),
                      label: const Text('Dari Galeri'),
                      onPressed: _pickFromGallery,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (_imageFile != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Path Gambar: ${_imageFile?.path ?? ''}',
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.delete),
                      label: const Text('Hapus Gambar'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                      ),
                      onPressed: () async {
                        await _imageFile?.delete();
                        setState(() => _imageFile = null);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Gambar dihapus')),
                        );
                      },
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
