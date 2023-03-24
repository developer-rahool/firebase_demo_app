import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/authentication/auth_fire.dart';
import 'package:firebase_demo/veiw/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/state_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LoginController isSearching = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: SafeArea(
          child: Drawer(
            backgroundColor: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  <Widget>[
                const SizedBox(height: 10,),
                Row(
                  children: [
                    IconButton(onPressed: () async{
                      await Auth().signOut();
                      //Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> LoginPage()), (route) => false);
                    }, icon: const Icon(Icons.logout)),
                     const Text("Sign Out"),
                  ],
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: const Color(0xffE43228),
          title: Obx(
                () => !isSearching.searching.value
                ? const Text("Lorem Ipsum")
                : const TextField(
              decoration: InputDecoration(
                hintText: "Search here",
                border: OutlineInputBorder(borderSide: BorderSide.none),
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
          actions: [
            Obx(
                  () => IconButton(
                onPressed: () {
                  isSearching.searching.value = !isSearching.searching.value;
                },
                icon: isSearching.searching.value
                    ? const Icon(Icons.cancel)
                    : const Icon(Icons.search),
              ),
            ),
          ],
          bottom: const TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 2,
              tabs: [
                Tab(text: "ALL POSTS"),
                Tab(text: "PROFILE"),
              ]),
        ),
        body: TabBarView(
          children: [
            // Center(
            //   child: FutureBuilder(
            //     builder: (context, AsyncSnapshot<PostList> snapshot) {
            //       // ignore: non_constant_identifier_names
            //       List<Post> Posts;
            //       if (snapshot.hasData) {
            //         Posts = snapshot.data!.posts;
            //         return createView(Posts, context);
            //       } else {
            //         return const CircularProgressIndicator();
            //       }
            //     },
            //   ),
            // ),
            Column(
              children: const [
                SizedBox(
                  height: 40,
                ),
                Text("profile"),
              ],
            ),
          ],
        ),
      ),
    );
  }

// Widget createView(data, BuildContext context) {
//   return SizedBox(
//     width: double.maxFinite,
//     child: ListView.builder(
//         shrinkWrap: true,
//         itemCount: data.length,
//         itemBuilder: (context, index) {
//           return Column(
//             children: [
//               Padding(
//                 padding:
//                 const EdgeInsets.symmetric(horizontal: 3, vertical: 0.001),
//                 child: Card(
//                   color: Colors.white,
//                   shadowColor: Colors.black87,
//                   child: ListTile(
//                     onTap: () {},
//                     title: Text(
//                       data[index].title,
//                       style: const TextStyle(
//                           color: Color(0xffE43228),
//                           fontWeight: FontWeight.bold),
//                     ),
//                     subtitle: Text(data[index].body),
//                   ),
//                 ),
//               )
//             ],
//           );
//         }),
//   );
 }
