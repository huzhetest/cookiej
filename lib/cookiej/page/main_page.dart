import 'package:cookiej/cookiej/action/app_state.dart';
import 'package:cookiej/cookiej/page/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:cookiej/cookiej/page/personal_center/personal_center.dart';

class MainPage extends StatefulWidget {
  static final String routePath = "main";  
  @override
  _MainPageState createState() => _MainPageState();
}

///APP显示部分的主要框架
class _MainPageState extends State<MainPage> {
  int _currentIndex=0;
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
      builder: (context,store){
        return Scaffold(
          appBar:store.state.accessState.currentAccess==null?AppBar(
            title: Text('登录获取授权'),
          ):null,
          body:store.state.accessState.currentAccess==null?
            Container(
              child: Center(
                child:RaisedButton.icon(
                  icon: Icon(IconData(0xf18a,fontFamily: 'fontawesome'),size: 24,),
                  label: Text('去登录',style: TextStyle(fontSize:18),),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                  },
                )
              ),
            )
            :IndexedStack(
            children: <Widget>[
              Container(
                // child: Center(child:Text(store.state.accessState.currentAccess.uid.toString())),
              ),
              Container(),
              Container(),
              PersonalCenter()
            ],
            index: _currentIndex,
          ),
          bottomNavigationBar: SizedBox(
            height:46,
            child:BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Container()
                ),
                BottomNavigationBarItem(
                  icon: Icon(IconData(0xf14e,fontFamily: 'fontawesome')),
                  title: Container()
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.local_post_office),
                  title: Container()
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  title: Container()
                ),
              ],
              currentIndex: _currentIndex,
              type: BottomNavigationBarType.fixed,
              iconSize: 30,
              onTap: (int index){
                setState(() {
                  _currentIndex=index;
                });
              },
            ),
          )
        );
        
      },
    );
  }

}