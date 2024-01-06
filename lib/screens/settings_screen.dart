import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:quoteapp/providers/theme_provider.dart';
import 'package:quoteapp/widgets/options_tile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late final isDark = isDarkTheme();

  Color isDarkTheme(){
    if(Theme.of(context).brightness == Brightness.dark){
      return Colors.grey.shade600;
    }
    return Colors.grey.shade200;
  }

  @override
  Widget build(BuildContext context) {
    print('build Settings Screen');
    return Consumer<ThemeProvider>(
      builder: (context, themeValue, child) {
        return Scaffold(
            backgroundColor: themeValue.backgroundColor,
            appBar: AppBar(
              backgroundColor:themeValue.backgroundColor,
              forceMaterialTransparency: true,
              elevation: 0,
              title: Text('Settings'),
            ),
            body: ListView(
              padding: EdgeInsets.all(10),
              children: [
                SizedBox(height: 10,),
                Text('PREMIUM',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                OptionsTile(icon: LineIcons.crown, title: 'Manage Subscription', onTap: (){},topRadius: 10, bottomRadius: 10),
                SizedBox(height: 20,),
                Text('MAKE IT YOURS',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                OptionsTile(icon: Icons.select_all_outlined, title: 'Content Preferences', onTap: (){},topRadius: 10,),
                OptionsTile(image: AssetImage('assets/images/gender.png'), title: 'Gender Identity', onTap: (){},bottomRadius: 10,),
                SizedBox(height: 20,),
                Text('SUPPORT US',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                OptionsTile(icon: Icons.ios_share, title: 'Share', onTap: (){},topRadius: 10,),
                OptionsTile(icon: Icons.thumb_up_outlined, title: 'Leave us a Review', onTap: (){},bottomRadius: 10,),
                SizedBox(height: 20,),
                Text('HELP',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                OptionsTile(icon: Icons.help_center_outlined, title: 'Help', onTap: (){},topRadius: 10,bottomRadius: 10,),
                SizedBox(height: 20,),
                Text('FOLLOW US',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                OptionsTile(icon: LineIcons.instagram, title: 'Instagram', onTap: (){},topRadius: 10),
                OptionsTile(icon: LineIcons.facebook, title: 'Facebook', onTap: (){}),
                OptionsTile(icon: Icons.tiktok, title: 'TikTok', onTap: (){},),
                OptionsTile(icon: LineIcons.pinterest, title: 'Pinterest', onTap: (){},),
                OptionsTile(icon: LineIcons.twitter, title: 'X', onTap: (){},bottomRadius: 10,),
              ],
            )
        );
      },
    );
  }

}
