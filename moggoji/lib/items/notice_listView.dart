import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../models/notice.dart';
import '../service/globals.dart';

class NoticeListView extends StatefulWidget {
  final String documentName;

  const NoticeListView({Key? key, required this.documentName})
      : super(key: key);

  @override
  State<NoticeListView> createState() => _NoticeListViewState();
}

class _NoticeListViewState extends State<NoticeListView> {
  List<Notice> notices = [];

  @override
  void initState() {
    super.initState();
    fetchNotices();
  }

  Future<void> fetchNotices() async {
    String resultNoticeURL = '$findNoticeByCategoryURL/${widget.documentName}'; // documentName 사용
    print(resultNoticeURL);

    final response = await http.get(Uri.parse(resultNoticeURL));

    if (response.statusCode == 200) {
      final String responseBody = utf8.decode(response.bodyBytes);
      final List<dynamic> data = jsonDecode(responseBody);
      print(response.body);
      setState(() {
        notices = data.map((json) => Notice.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to load notices');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        physics: BouncingScrollPhysics(
            decelerationRate: ScrollDecelerationRate.normal),
        shrinkWrap: true,
        itemCount: notices.length,
        itemBuilder: (BuildContext context, int index) {
          final notice = notices[index];

          return Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 7,
                    color: Colors.blueAccent.shade100,
                    offset: Offset(3, 5),
                  )
                ],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://avatars.githubusercontent.com/u/39268032?s=200&v=4',
                        width: double.infinity,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            notice.title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 30),
                          Text(notice.writer)
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            notice.content,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
