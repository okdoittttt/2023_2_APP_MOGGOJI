import 'package:flutter/material.dart';
import 'package:moggoji/items/notice_listView.dart';
import 'package:moggoji/pages/notice_page.dart';

class DetailNoticePage extends StatefulWidget {
  final String title;
  final String category;
  final String content;
  final String date;
  final String writer;


  const DetailNoticePage({
    Key? key,
    required this.title,
    required this.category,
    required this.content,
    required this.date,
    required this.writer,
}) : super(key: key);

  @override
  State<DetailNoticePage> createState() => _DetailNoticePageState();
}

class _DetailNoticePageState extends State<DetailNoticePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Center(child: Text(widget.title)),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),

      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      'https://avatars.githubusercontent.com/u/39268032?s=200&v=4',
                      width: MediaQuery.of(context).size.width,
                      height: 230,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 16, 0, 0),
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 25,
                        )
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 8, 0, 0),
                      child: Text(
                        widget.writer,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 4),
                      child: Text(
                        widget.content,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Divider(
                      height: 24,
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                      color: Colors.black,
                    ),
                    SizedBox(height: 50,),
                    Center(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 12),
                        child: ElevatedButton(
                          onPressed: () {
                            String documentName = "주요공지";
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NoticePage()));
                          }, child: Text("목록으로"),
                        )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
