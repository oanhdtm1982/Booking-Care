import 'package:doanchuyennganh/Screens/Welcome/Components/Tab.dart';
import 'package:doanchuyennganh/bloc/notification_bloc/notification_bloc.dart';
import 'package:doanchuyennganh/bloc/register_bloc/booking_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../widgets/NotificationDetail.dart';
class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final user = FirebaseAuth.instance.currentUser!;
  bool isEdit = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BlocBuilder<BookingBloc,BookingState>(
                    builder: (context,stateBooks){
                      if(stateBooks is BookingLoading){
                        return Center(child: CircularProgressIndicator());
                      }
                      if(stateBooks is BookingLoaded){
                        return Container(
                      height: size.height/2-20,
                      child: ListView.builder(
                        itemCount: state.notifications.length,
                        itemBuilder: (BuildContext context,int index){
                          if(state.notifications[index].email == user.email){
                            for(int k = 0;k<stateBooks.doctors.length;k++){                     
                            if(state.notifications[index].confirm == false && state.notifications[index].email == stateBooks.doctors[k].email){
                              return NotificationDetail(
                                function: (){
                                  setState(() {
                                    isEdit = !isEdit;
                                  });
                                },
                                function1: (){
                                  BlocProvider.of<NotificationBloc>(context).add(UpdateNotification(state.notifications[index]));
                                    context.read<NotificationBloc>().add(LoadNotification());
                                },
                                function2: (){
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => NotificationPage()
                                      ),
                                          (Route<dynamic> route) => false
                                  );
                                },
                                isEdit: isEdit,
                                index: index,
                                list: state.notifications);
                            }
                          }
                           for(int j = 0;j<stateBooks.books.length;j++){
                            if(state.notifications[index].confirm == true && state.notifications[index].email == stateBooks.books[j].email){
                                  return NotificationDetail(
                                function: (){ 
                                  setState(() {
                                     isEdit = !isEdit;
                                  });
                                },
                                function1: (){
                                    BlocProvider.of<NotificationBloc>(context).add(UpdateNotification(state.notifications[index]));
                                    context.read<NotificationBloc>().add(LoadNotification());
                                },
                                function2: (){
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => NotificationPage()
                                      ),
                                          (Route<dynamic> route) => false
                                  );
                                },
                                isEdit: isEdit,
                                index: index,
                                list: state.notifications);       
                              }
                            }
                              return Container();
                            } 
                            else{
                              return Container();
                            }
                          }
                      
                      ),
                    );
                      }
                      else{
                        return Text("Something went wrong");
                      }
                    },
                  ),
                ],
              ),
            );
          }
          else{
            return Text("Something went wrong");
          }
        },
      )
    );
  }
}
