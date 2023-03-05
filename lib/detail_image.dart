import 'package:flutter/material.dart';
import 'package:flutter_week5_dialog_bottom_sheet/gallery.dart';

class DetailImagePage extends StatelessWidget {
  final String urlImage;
  final String size;

  const DetailImagePage({Key? key, required this.urlImage, required this.size})
      : super(key: key);
//   void _showBottomSheet(BuildContext context) {
//   showModalBottomSheet<void>(
//     context: context,
//     builder: (BuildContext context) {
//       return const Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Text('Apakah Anda Menyukai Gambar Ini.'),
//       );
//     },
//   );
// }   
void _showBottomSheet(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Apakah Anda Menyukai Gambar Ini.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const Home()));
                    },
                    child: const Text(
                      'Tidak',
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                        Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Ya',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(urlImage, fit: BoxFit.cover, width: 320, height: 280),
            Text(size)
          ],
        ),
        

        /// Contoh Full Screen Size
        // Image.network(urlImage,
        //   fit: BoxFit.cover,
        //   width: MediaQuery.of(context).size.width,
        //   height: MediaQuery.of(context).size.height),
      ),
       floatingActionButton: FloatingActionButton(
      onPressed: () => _showBottomSheet(context),
      child: const Icon(Icons.info),
    ),
    );
  }
}