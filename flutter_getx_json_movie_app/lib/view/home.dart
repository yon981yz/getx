import 'package:flutter/material.dart';
import 'package:flutter_getx_json_movie_app/vm/vm_handler.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});



  @override
  Widget build(BuildContext context) {
    final vmHandler = Get.put(VmHandler());
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON Test'),
      ),

      body: GetBuilder<VmHandler>(
        builder: (controller) {
          return FutureBuilder(
            future: controller.getJSONData(), 
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }else if(snapshot.hasError){
                return Center(
                  child: Text('Error :${snapshot.error}'),
                );
              }else{
                return Obx(
                  () {
                  return ListView.builder(
                    itemCount: vmHandler.movies.length,
                    itemBuilder: (context, index) {
                      final movie = vmHandler.movies[index];
                      return Card(
                        child: Row(
                          children: [
                            Image.network(
                              movie.image,
                              width: 100,
                            ),
                            Text(
                              "   ${movie.title}"
                            ),
                          ],
                        ),
                      );
                    },
                    );  
                  },
                );
              }
            },
          );
        },
        ),
    );
  }
}