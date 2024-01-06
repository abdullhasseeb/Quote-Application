import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quoteapp/providers/theme_provider.dart';

import '../model/themes_model.dart';

class ThemeSelectScreen extends StatefulWidget {
  const ThemeSelectScreen({super.key});

  @override
  State<ThemeSelectScreen> createState() => _ThemeSelectScreenState();
}

class _ThemeSelectScreenState extends State<ThemeSelectScreen> {

  @override
  Widget build(BuildContext context) {
    print('build Theme class');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade600,
        title: Text('Themes'),
        elevation: 0,
        forceMaterialTransparency: true,
      ),
      backgroundColor: Colors.grey.shade600,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
        ),
        child: GridView.builder(
          itemCount: ThemeModel.getData().length,
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 0.2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            mainAxisExtent: 300
          ),
          itemBuilder: (context, index) {
            final theme = ThemeModel.getData().elementAt(index);
            return Column(
              children: [
                //colors container
                Expanded(
                  flex: 22,
                  child: Consumer<ThemeProvider>(
                    builder: (context, value, child) {
                      return InkWell(
                        borderRadius: BorderRadius.circular(15),
                        onTap: (){
                          value.changeCurrentTheme(index);
                          value.changeCheck();
                          value.changeThemeColors();
                        },
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  //border: Border.all(color: Colors.grey.shade800,width: 3),
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(
                                    colors: theme.gradientColors,
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  )
                              ),
                            ),
                            Center(
                                child: value.currentTheme == index ? Icon(
                                  Icons.check_circle,
                                  color: Colors.black,
                                  size: 30,
                                ) :
                                null
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                //text widget
                Expanded(
                  flex: 5,
                  child: Text(
                    theme.name.toString() + 'Theme',
                    textAlign: TextAlign.center,
                    style: TextStyle(

                    ),
                  ),
                )
              ],
            );
          },
        )
      )
    );
  }
}
