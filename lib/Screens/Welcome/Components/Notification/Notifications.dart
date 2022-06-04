import 'package:doanchuyennganh/Screens/Welcome/Components/Tab.dart';
import 'package:doanchuyennganh/bloc/notification_bloc/notification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../widgets/NotificationDetail.dart';
class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Notifications",),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) {
              return TabPage();
            }));
          },
          icon: Icon(Icons.arrow_back,
            color: Colors.white,),
        ),
      ),
      body: BlocBuilder<NotificationBloc,NotificationState>(
        builder: (context,state){
          if(state is NotificationLoading){
            return Center(child: CircularProgressIndicator());
          }
          if(state is NotificationLoaded){
            return ListView.builder(
              itemCount: state.notifications.length,
              itemBuilder: (BuildContext context,int index){
                return NotificationDetail(
                  index: index,
                  list: state.notifications);
            });
          }
          else{
            return Text("Something went wrong");
          }
        },
      )
    );
  }
}
