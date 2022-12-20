import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:groceryapp/Provider/dark_theme_provider.dart';
import 'package:groceryapp/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController addresscontroller =
      TextEditingController(text: "");

  @override
  void dispose() {
    addresscontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvide>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                  text: TextSpan(
                      text: "Hi, ",
                      style: const TextStyle(
                          color: Colors.cyan,
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                    TextSpan(
                        text: "My Name",
                        style: TextStyle(
                            color: color,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()..onTap = () {}),
                  ])),
              const SizedBox(
                height: 5,
              ),
              TextWidget(
                  text: "Email@email.com",
                  color: color,
                  textSize: 18,
                  istitle: true,
                  maxlines: 10),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 5,
              ),
              const SizedBox(
                height: 20,
              ),
              _listiles(
                  color: color,
                  title: "Address",
                  subtitile: "My Addresses",
                  leadingicon: IconlyLight.home,
                  trailingicon: IconlyLight.arrowRight2,
                  onPressed: () {
                    _showAddressDialog();
                  }),
              _listiles(
                  color: color,
                  title: "Orders",
                  leadingicon: IconlyLight.bag,
                  trailingicon: IconlyLight.arrowRight2,
                  onPressed: () {}),
              _listiles(
                  color: color,
                  title: "Wishlist",
                  leadingicon: IconlyLight.heart,
                  trailingicon: IconlyLight.arrowRight2,
                  onPressed: () {}),
              _listiles(
                  color: color,
                  title: "Viewed",
                  leadingicon: IconlyLight.show,
                  trailingicon: IconlyLight.arrowRight2,
                  onPressed: () {}),
              _listiles(
                  color: color,
                  title: "Forget Password",
                  leadingicon: IconlyLight.unlock,
                  trailingicon: IconlyLight.arrowRight2,
                  onPressed: () {}),
              SwitchListTile(
                title: TextWidget(
                    text: themeState.getDarkTheme ? "Dark mode" : "Light mode",
                    color: color,
                    textSize: 20,
                    istitle: true,
                    maxlines: 10),
                secondary: Icon(themeState.getDarkTheme
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined),
                value: themeState.getDarkTheme,
                onChanged: (bool value) {
                  setState(() {
                    themeState.setDarkTheme = value;
                  });
                },
              ),
              _listiles(
                  color: color,
                  title: "Logout",
                  // subtitile: "Are you sure you want to logout ?",
                  leadingicon: IconlyLight.logout,
                  trailingicon: IconlyLight.arrowRight2,
                  onPressed: () {
                    _showLogoutDialog();
                  }),
              // _listiles(
              //     title: "title",
              //     subtitile: subtitile,
              //     Leadingicon: Leadingicon,
              //     trailingicon: trailingicon,
              //     onPressed: (){})
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showLogoutDialog() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Image.asset(
                  'assets/logout.png',
                  height: 20,
                  width: 20,
                ),
                const SizedBox(
                  width: 15,
                ),
                const Text("Sign Out"),
              ],
            ),
            content: const Text('Are you sure you want to logout ?'),
            actions: [
              TextButton(
                  onPressed: () {

                    Navigator.pop(context);
                  },
                  child: TextWidget(
                      text: "Cancel",
                      color: Colors.cyan,
                      textSize: 18,
                      istitle: false,
                      maxlines: 5)),
                      TextButton(onPressed: (){}, child: TextWidget(text: "Yes", color: Colors.red, textSize: 18, istitle: false, maxlines: 1))
            ],
          );
        });
  }

  Future<void> _showAddressDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("update"),
            content: TextField(
              controller: addresscontroller,
              maxLines: 5,
              decoration: const InputDecoration(hintText: "Your Address"),
            ),
            actions: [
              TextButton(onPressed: () {}, child: const Text("Update"))
            ],
          );
        });
  }

  Widget _listiles(
      {required String title,
      String? subtitile,
      required IconData leadingicon,
      required IconData trailingicon,
      required Function onPressed,
      required Color color}) {
    return ListTile(
      title: TextWidget(
          text: title, color: color, textSize: 20, istitle: true, maxlines: 10),
      subtitle: TextWidget(
          text: subtitile ?? "",
          color: color,
          textSize: 17,
          istitle: false,
          maxlines: 10),
      leading: Icon(leadingicon),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: () {
        onPressed();
      },
    );
  }
}
