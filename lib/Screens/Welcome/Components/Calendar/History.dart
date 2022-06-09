import 'package:doanchuyennganh/bloc/bookRegister/book_reg_bloc.dart';
import 'package:doanchuyennganh/widgets/history_detail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class History extends StatelessWidget {
  History({
    required this.dayselected,
    Key? key}) : super(key: key);
  DateTime dayselected;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final auth = FirebaseAuth.instance.currentUser!;
    return BlocBuilder<BookRegBloc,BookRegState>(
      builder: (context,state){
        if(state is BookRegLoading){
          return Center(child: CircularProgressIndicator());
        }
        if(state is BookRegLoaded){       
             return Column(
              children: [
                ListView.builder(
                   shrinkWrap: true,
                   itemCount: state.bookRegs.length,
                   itemBuilder: (BuildContext context,int index){
                     if(auth.email == state.bookRegs[index].email && state.bookRegs[index].date == dayselected.toLocal().toString().split(' ')[0]){
                    return HistoryDetail(
                      index: index,
                      list: state.bookRegs);
                     }
                     return Container();
                  })
                ],
              );
        }
        else{
          return Text("Something went wrong");
        }
      },
    );
  }
}