import 'package:doanchuyennganh/Models/Notification.dart';
import 'package:doanchuyennganh/Screens/Welcome/Components/Notification/NotificationView.dart';
import 'package:doanchuyennganh/constants.dart';
import 'package:flutter/material.dart';
class NotificationDetail extends StatefulWidget {
  NotificationDetail({
    required this.index,
    required this.isEdit,
    required this.list,
    required this.function,
    required this.function1,
    required this.function2,
    Key? key}) : super(key: key);
    int index;
  List<NotificationModel> list;
  VoidCallback function;
  VoidCallback function1;
  VoidCallback function2;
  bool isEdit;
  @override
  State<NotificationDetail> createState() => _NotificationDetailState();
}

class _NotificationDetailState extends State<NotificationDetail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          Row(children: [
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
                      widget.list[widget.index].confirm = !widget.list[widget.index].confirm;
                    });
                    
                  },
                  child: widget.list[widget.index].confirm ? Image.asset("assets/icons/work_list_tick.png") : Image.asset("assets/icons/work_list_none.png"),
                ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => NotificationView(index: widget.index,notifications: widget.list)
                ),
                    (Route<dynamic> route) => false
            );
                  },
                  child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              widget.list[widget.index].title,
                              style: TextStyle(
                                fontSize: 16,
                                decoration: widget.list[widget.index].confirm
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 4),
                            Container(
                              width: size.width-120,
                              child: Text(
                                widget.list[widget.index].description,
                                overflow: TextOverflow.clip,
                                maxLines: 2,
                                softWrap: false,
                                style: TextStyle(
                                  fontSize: 16,
                                  decoration: widget.list[widget.index].confirm
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
                        color: widget.list[widget.index].confirm
                            ? Colors.blueAccent
                            : Colors.amber,
                      )
              ]),
            ),
            ),
            Container(
              height: 70,
              width: 58,
              child: GestureDetector(
                onTap: widget.function,
                child: Image.asset(
                    "assets/icons/work_list_edit.png",
                    width: 16,
                    height: 16,
                  ),
              ),
            ),
          ]),
          if(widget.isEdit == true)
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue
                  ),
                  width: size.width/2-40,
                  child: Center(
                    child: GestureDetector(
                      onTap: widget.function1,
                      child: Text("Yes",style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(0.6)),textAlign: TextAlign.center,),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey
                  ),
                  width: size.width/2-40,
                  child: Center(
                    child: GestureDetector(
                      onTap: widget.function2,
                      child: Text("No",style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(0.6)
                      ),textAlign: TextAlign.center,),
                    ),
                  ),
                ),
                SizedBox(width: 50),
              ],
            ),
          )
        ],
      ),
    );
  }
}



