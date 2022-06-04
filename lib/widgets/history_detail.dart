import 'package:doanchuyennganh/Models/BookingRegister.dart';
import 'package:doanchuyennganh/Models/Notification.dart';
import 'package:doanchuyennganh/Screens/Welcome/Components/Notification/NotificationView.dart';
import 'package:flutter/material.dart';
class HistoryDetail extends StatefulWidget {
  HistoryDetail({
    required this.index,
    required this.list,
    Key? key}) : super(key: key);
    int index;
  List<BookingRegister> list;
  @override
  State<HistoryDetail> createState() => _HistoryDetailState();
}

class _HistoryDetailState extends State<HistoryDetail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        Padding(padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8
        ),
        child: Container(
          width: size.width - 32,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(5,5),
                color: Color(0xFFE0E0E0).withOpacity(0.5),
              ),
              BoxShadow(
                    offset: Offset(9, 0),
                    blurRadius: 5,
                    color: Color(0xFFE0E0E0).withOpacity(0.5),
                  ),
            ]
          ),
          child: Row(children: [
            Padding(padding: const EdgeInsets.symmetric(
              vertical: 27,horizontal: 25
            ),
            child: InkWell(
              onTap: (){
                setState(() {
                  widget.list[widget.index].isConfirm = !widget.list[widget.index].isConfirm;
                });
                
              },
              child: widget.list[widget.index].isConfirm ? Image.asset("assets/icons/work_list_tick.png") : Image.asset("assets/icons/work_list_none.png"),
            ),
            ),
            GestureDetector(
              onTap: (){
                
              },
              child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          widget.list[widget.index].spec,
                          style: TextStyle(
                            fontSize: 16,
                            decoration: widget.list[widget.index].isConfirm
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 4),
                        Container(
                          width: size.width-120,
                          child: Text(
                            widget.list[widget.index].docName,
                            overflow: TextOverflow.clip,
                            maxLines: 2,
                            softWrap: false,
                            style: TextStyle(
                              fontSize: 16,
                              decoration: widget.list[widget.index].isConfirm
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF9B9B9B),
                            ),
                          ),
                        ),
                      ],
              ),
            ),
            Spacer(),
                  Container(
                    width: 4,
                    height: 21,
                    color: widget.list[widget.index].isConfirm
                        ? Colors.blueAccent
                        : Colors.amber,
                  )
          ]),
        ),
        ),
        Container(
            height: 70,
            width: 58,
            child: Image.asset(
              "assets/icons/work_list_edit.png",
              width: 16,
              height: 16,
            ),
          ),
          Container(
            height: 70,
            width: 1,
            color: Color(0xFF000000).withOpacity(.1),
          ),
          Padding(padding: const EdgeInsets.only(right: 16),
            child: Container(
              height: 70,
              width: 58,
              child: GestureDetector(
                onTap: (){},
                child: Image.asset("assets/icons/work_list_delete.png"),
              )
              
            ),
          )
      ]),
    );
  }
}



