import 'package:doanchuyennganh/bloc/bookRegister/book_reg_bloc.dart';
import 'package:doanchuyennganh/widgets/history_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
class History extends StatelessWidget {
  History({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  return  HistoryDetail(
                index: index,
                list: state.bookRegs);
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