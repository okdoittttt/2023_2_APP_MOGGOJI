import 'package:flutter/material.dart';
import 'package:moggoji/common/bottom_navi_bar.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("행사 일정"),
        centerTitle: true,
      ),
      body: ListViewPage(),
      bottomNavigationBar: BottomNaviBar(),
    );
  }
}
class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  /* JSON 데이터 */
  var eventList = [
    {
      "title":"아이디어 발표",
      "date":"2023.09.15. 18:30",
      "location":"누리관 2318호",
      "description":"아이디어 발표",
      "participationFee":"없음",
      "numberOfParticipant":"33",
      "finish":"no",
    },
    {
      "title":"노션 세미나",
      "date":"2023.09.12. 19:00",
      "location":"향파관",
      "description":"노션 사용법 강의",
      "participationFee":"의지",
      "numberOfParticipant":"35",
      "finish":"yes",
    },
    {
      "title":"깃 세미나",
      "date":"2023.09.11. 19:00",
      "location":"향파관",
      "description":"Git CLI 사용법 강의",
      "participationFee":"열정",
      "numberOfParticipant":"30",
      "finish":"yes",
    },
    {
      "title":"개강총회",
      "date":"2023.09.08. 18:30",
      "location":"창의관 303호",
      "description":"개강총회",
      "participationFee":"패기",
      "numberOfParticipant":"55",
      "finish":"yes",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.normal),
        itemCount: eventList.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurpleAccent.shade100,
                    blurRadius: 5,
                    offset: Offset(2.2,2.2)
                  )
                ]
            ),
            margin: EdgeInsets.fromLTRB(18, 10, 18, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(5.0),
                  child: SizedBox(
                    height: 60,
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("${eventList[index]['date']!.substring(5,7)}/${eventList[index]['date']!.substring(8,10)}",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 2
                                ),),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5),
                                /* JSON 날짜 데이터 - 오늘 날짜 */
                                child: Text("D-00",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.redAccent,
                                  ),),
                              ),
                            ],),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 5, 0, 0),
                            child: Text(eventList[index]['title']!,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 2
                              ),
                            ),
                          ),
                        ],
                      ),
                      trailing: ElevatedButton(
                        onPressed: eventList[index]['finish'] == "yes"? null : () {},
                        style: ButtonStyle(
                            shape: MaterialStatePropertyAll<
                                RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            )
                        ),
                        child: Text("참여"),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                        child: ListTile(
                          visualDensity: VisualDensity(
                              horizontal: 0, vertical: -4),
                          leading: Text("날짜",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                          title: Text(eventList[index]['date']!),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: ListTile(
                          visualDensity: VisualDensity(
                              horizontal: 0, vertical: -4),
                          leading: Text("장소",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                          title: Text(eventList[index]['location']!),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: ListTile(
                          visualDensity: VisualDensity(
                              horizontal: 0, vertical: -4),
                          leading: Text("내용",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                          title: Text(eventList[index]['description']!),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: ListTile(
                          visualDensity: VisualDensity(
                              horizontal: 0, vertical: -4),
                          leading: Text("금액",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                          title: Text(eventList[index]['participationFee']!),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: ListTile(
                          visualDensity: VisualDensity(
                              horizontal: 0, vertical: -4),
                          leading: Text("참여",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                          title: Text("${eventList[index]['numberOfParticipant']!} 명"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
  }
}
