// import '/flutter_flow/flutter_flow_icon_button.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
//
// import 'list13_property_listview_model.dart';
// export 'list13_property_listview_model.dart';
//
// class List13PropertyListviewWidget extends StatefulWidget {
//   const List13PropertyListviewWidget({Key? key}) : super(key: key);
//
//   @override
//   _List13PropertyListviewWidgetState createState() =>
//       _List13PropertyListviewWidgetState();
// }
//
// class _List13PropertyListviewWidgetState
//     extends State<List13PropertyListviewWidget> with TickerProviderStateMixin {
//   late List13PropertyListviewModel _model;
//
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => List13PropertyListviewModel());
//
//     _model.textController ??= TextEditingController();
//     _model.tabBarController = TabController(
//       vsync: this,
//       length: 3,
//       initialIndex: 0,
//     )..addListener(() => setState(() {}));
//   }
//
//   @override
//   void dispose() {
//     _model.dispose();
//
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => _model.unfocusNode.canRequestFocus
//           ? FocusScope.of(context).requestFocus(_model.unfocusNode)
//           : FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         key: scaffoldKey,
//         backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
//         body: SafeArea(
//           top: true,
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
//                 child: Container(
//                   width: double.infinity,
//                   height: 60,
//                   decoration: BoxDecoration(
//                     color: FlutterFlowTheme.of(context).secondaryBackground,
//                     boxShadow: [
//                       BoxShadow(
//                         blurRadius: 3,
//                         color: Color(0x33000000),
//                         offset: Offset(0, 1),
//                       )
//                     ],
//                     borderRadius: BorderRadius.circular(40),
//                     border: Border.all(
//                       color: FlutterFlowTheme.of(context).alternate,
//                     ),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(16, 0, 12, 0),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         Icon(
//                           Icons.search_rounded,
//                           color: FlutterFlowTheme.of(context).secondaryText,
//                           size: 24,
//                         ),
//                         Expanded(
//                           child: Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
//                             child: Container(
//                               width: 200,
//                               child: TextFormField(
//                                 controller: _model.textController,
//                                 obscureText: false,
//                                 decoration: InputDecoration(
//                                   labelText: 'Search listings...',
//                                   labelStyle:
//                                   FlutterFlowTheme.of(context).labelMedium,
//                                   hintStyle:
//                                   FlutterFlowTheme.of(context).labelMedium,
//                                   enabledBorder: InputBorder.none,
//                                   focusedBorder: InputBorder.none,
//                                   errorBorder: InputBorder.none,
//                                   focusedErrorBorder: InputBorder.none,
//                                   filled: true,
//                                   fillColor: FlutterFlowTheme.of(context)
//                                       .secondaryBackground,
//                                 ),
//                                 style: FlutterFlowTheme.of(context).bodyMedium,
//                                 cursorColor:
//                                 FlutterFlowTheme.of(context).primary,
//                                 validator: _model.textControllerValidator
//                                     .asValidator(context),
//                               ),
//                             ),
//                           ),
//                         ),
//                         FlutterFlowIconButton(
//                           borderColor: FlutterFlowTheme.of(context).alternate,
//                           borderRadius: 20,
//                           borderWidth: 1,
//                           buttonSize: 40,
//                           fillColor:
//                           FlutterFlowTheme.of(context).secondaryBackground,
//                           icon: Icon(
//                             Icons.tune_rounded,
//                             color: FlutterFlowTheme.of(context).primaryText,
//                             size: 24,
//                           ),
//                           onPressed: () {
//                             print('IconButton pressed ...');
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Column(
//                   children: [
//                     Align(
//                       alignment: Alignment(0, 0),
//                       child: TabBar(
//                         labelColor: FlutterFlowTheme.of(context).primaryText,
//                         unselectedLabelColor:
//                         FlutterFlowTheme.of(context).secondaryText,
//                         labelStyle: FlutterFlowTheme.of(context).labelSmall,
//                         unselectedLabelStyle: TextStyle(),
//                         indicatorColor: FlutterFlowTheme.of(context).primary,
//                         padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
//                         tabs: [
//                           Tab(
//                             text: 'Homes',
//                             icon: Icon(
//                               Icons.home_filled,
//                             ),
//                           ),
//                           Tab(
//                             text: 'Beachfront',
//                             icon: Icon(
//                               Icons.beach_access_rounded,
//                             ),
//                           ),
//                           Tab(
//                             text: 'Nature',
//                             icon: Icon(
//                               Icons.nature_people,
//                             ),
//                           ),
//                         ],
//                         controller: _model.tabBarController,
//                       ),
//                     ),
//                     Expanded(
//                       child: TabBarView(
//                         controller: _model.tabBarController,
//                         children: [
//                           SingleChildScrollView(
//                             child: Column(
//                               mainAxisSize: MainAxisSize.max,
//                               children: [
//                                 ListView(
//                                   padding: EdgeInsets.zero,
//                                   shrinkWrap: true,
//                                   scrollDirection: Axis.vertical,
//                                   children: [
//                                     Container(
//                                       width: double.infinity,
//                                       decoration: BoxDecoration(
//                                         color: FlutterFlowTheme.of(context)
//                                             .secondaryBackground,
//                                       ),
//                                       child: Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             0, 0, 0, 12),
//                                         child: Column(
//                                           mainAxisSize: MainAxisSize.max,
//                                           crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                           children: [
//                                             Padding(
//                                               padding: EdgeInsetsDirectional
//                                                   .fromSTEB(16, 8, 16, 12),
//                                               child: ClipRRect(
//                                                 borderRadius:
//                                                 BorderRadius.circular(16),
//                                                 child: Image.network(
//                                                   'https://source.unsplash.com/random/1280x720?beach&9',
//                                                   width: double.infinity,
//                                                   height: 230,
//                                                   fit: BoxFit.cover,
//                                                 ),
//                                               ),
//                                             ),
//                                             Padding(
//                                               padding: EdgeInsetsDirectional
//                                                   .fromSTEB(16, 0, 16, 4),
//                                               child: Row(
//                                                 mainAxisSize: MainAxisSize.max,
//                                                 mainAxisAlignment:
//                                                 MainAxisAlignment
//                                                     .spaceBetween,
//                                                 children: [
//                                                   Text(
//                                                     'Maidstone, San Antonio, Tx.',
//                                                     style: FlutterFlowTheme.of(
//                                                         context)
//                                                         .bodyLarge,
//                                                   ),
//                                                   Padding(
//                                                     padding:
//                                                     EdgeInsetsDirectional
//                                                         .fromSTEB(
//                                                         16, 0, 0, 0),
//                                                     child: Text(
//                                                       '\$210/night',
//                                                       style:
//                                                       FlutterFlowTheme.of(
//                                                           context)
//                                                           .titleLarge,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                             Padding(
//                                               padding: EdgeInsetsDirectional
//                                                   .fromSTEB(16, 0, 16, 4),
//                                               child: Row(
//                                                 mainAxisSize: MainAxisSize.max,
//                                                 mainAxisAlignment:
//                                                 MainAxisAlignment
//                                                     .spaceBetween,
//                                                 children: [
//                                                   Expanded(
//                                                     child: Text(
//                                                       '32 miles away',
//                                                       style:
//                                                       FlutterFlowTheme.of(
//                                                           context)
//                                                           .labelMedium,
//                                                     ),
//                                                   ),
//                                                   Padding(
//                                                     padding:
//                                                     EdgeInsetsDirectional
//                                                         .fromSTEB(
//                                                         16, 4, 4, 0),
//                                                     child: Text(
//                                                       '4.25',
//                                                       style:
//                                                       FlutterFlowTheme.of(
//                                                           context)
//                                                           .labelMedium,
//                                                     ),
//                                                   ),
//                                                   Icon(
//                                                     Icons.star_rounded,
//                                                     color: FlutterFlowTheme.of(
//                                                         context)
//                                                         .secondaryText,
//                                                     size: 24,
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                     Container(
//                                       width: double.infinity,
//                                       decoration: BoxDecoration(
//                                         color: FlutterFlowTheme.of(context)
//                                             .secondaryBackground,
//                                       ),
//                                       child: Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             0, 0, 0, 12),
//                                         child: Column(
//                                           mainAxisSize: MainAxisSize.max,
//                                           crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                           children: [
//                                             Padding(
//                                               padding: EdgeInsetsDirectional
//                                                   .fromSTEB(16, 8, 16, 12),
//                                               child: ClipRRect(
//                                                 borderRadius:
//                                                 BorderRadius.circular(16),
//                                                 child: Image.network(
//                                                   'https://source.unsplash.com/random/1280x720?beach&5',
//                                                   width: double.infinity,
//                                                   height: 230,
//                                                   fit: BoxFit.cover,
//                                                 ),
//                                               ),
//                                             ),
//                                             Padding(
//                                               padding: EdgeInsetsDirectional
//                                                   .fromSTEB(16, 0, 16, 4),
//                                               child: Row(
//                                                 mainAxisSize: MainAxisSize.max,
//                                                 mainAxisAlignment:
//                                                 MainAxisAlignment
//                                                     .spaceBetween,
//                                                 children: [
//                                                   Text(
//                                                     'Maidstone, San Antonio, Tx.',
//                                                     style: FlutterFlowTheme.of(
//                                                         context)
//                                                         .bodyLarge,
//                                                   ),
//                                                   Padding(
//                                                     padding:
//                                                     EdgeInsetsDirectional
//                                                         .fromSTEB(
//                                                         16, 0, 0, 0),
//                                                     child: Text(
//                                                       '\$210/night',
//                                                       style:
//                                                       FlutterFlowTheme.of(
//                                                           context)
//                                                           .titleLarge,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                             Padding(
//                                               padding: EdgeInsetsDirectional
//                                                   .fromSTEB(16, 0, 16, 4),
//                                               child: Row(
//                                                 mainAxisSize: MainAxisSize.max,
//                                                 mainAxisAlignment:
//                                                 MainAxisAlignment
//                                                     .spaceBetween,
//                                                 children: [
//                                                   Expanded(
//                                                     child: Text(
//                                                       '32 miles away',
//                                                       style:
//                                                       FlutterFlowTheme.of(
//                                                           context)
//                                                           .labelMedium,
//                                                     ),
//                                                   ),
//                                                   Padding(
//                                                     padding:
//                                                     EdgeInsetsDirectional
//                                                         .fromSTEB(
//                                                         16, 4, 4, 0),
//                                                     child: Text(
//                                                       '4.25',
//                                                       style:
//                                                       FlutterFlowTheme.of(
//                                                           context)
//                                                           .labelMedium,
//                                                     ),
//                                                   ),
//                                                   Icon(
//                                                     Icons.star_rounded,
//                                                     color: FlutterFlowTheme.of(
//                                                         context)
//                                                         .secondaryText,
//                                                     size: 24,
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SingleChildScrollView(
//                             child: Column(
//                               mainAxisSize: MainAxisSize.max,
//                               children: [
//                                 ListView(
//                                   padding: EdgeInsets.zero,
//                                   shrinkWrap: true,
//                                   scrollDirection: Axis.vertical,
//                                   children: [
//                                     Container(
//                                       width: double.infinity,
//                                       decoration: BoxDecoration(
//                                         color: FlutterFlowTheme.of(context)
//                                             .secondaryBackground,
//                                       ),
//                                       child: Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             0, 0, 0, 12),
//                                         child: Column(
//                                           mainAxisSize: MainAxisSize.max,
//                                           crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                           children: [
//                                             Padding(
//                                               padding: EdgeInsetsDirectional
//                                                   .fromSTEB(16, 8, 16, 12),
//                                               child: ClipRRect(
//                                                 borderRadius:
//                                                 BorderRadius.circular(16),
//                                                 child: Image.network(
//                                                   'https://source.unsplash.com/random/1280x720?beach&4',
//                                                   width: double.infinity,
//                                                   height: 230,
//                                                   fit: BoxFit.cover,
//                                                 ),
//                                               ),
//                                             ),
//                                             Padding(
//                                               padding: EdgeInsetsDirectional
//                                                   .fromSTEB(16, 0, 16, 4),
//                                               child: Row(
//                                                 mainAxisSize: MainAxisSize.max,
//                                                 mainAxisAlignment:
//                                                 MainAxisAlignment
//                                                     .spaceBetween,
//                                                 children: [
//                                                   Text(
//                                                     'Maidstone, San Antonio, Tx.',
//                                                     style: FlutterFlowTheme.of(
//                                                         context)
//                                                         .bodyLarge,
//                                                   ),
//                                                   Padding(
//                                                     padding:
//                                                     EdgeInsetsDirectional
//                                                         .fromSTEB(
//                                                         16, 0, 0, 0),
//                                                     child: Text(
//                                                       '\$210/night',
//                                                       style:
//                                                       FlutterFlowTheme.of(
//                                                           context)
//                                                           .titleLarge,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                             Padding(
//                                               padding: EdgeInsetsDirectional
//                                                   .fromSTEB(16, 0, 16, 4),
//                                               child: Row(
//                                                 mainAxisSize: MainAxisSize.max,
//                                                 mainAxisAlignment:
//                                                 MainAxisAlignment
//                                                     .spaceBetween,
//                                                 children: [
//                                                   Expanded(
//                                                     child: Text(
//                                                       '32 miles away',
//                                                       style:
//                                                       FlutterFlowTheme.of(
//                                                           context)
//                                                           .labelMedium,
//                                                     ),
//                                                   ),
//                                                   Padding(
//                                                     padding:
//                                                     EdgeInsetsDirectional
//                                                         .fromSTEB(
//                                                         16, 4, 4, 0),
//                                                     child: Text(
//                                                       '4.25',
//                                                       style:
//                                                       FlutterFlowTheme.of(
//                                                           context)
//                                                           .labelMedium,
//                                                     ),
//                                                   ),
//                                                   Icon(
//                                                     Icons.star_rounded,
//                                                     color: FlutterFlowTheme.of(
//                                                         context)
//                                                         .secondaryText,
//                                                     size: 24,
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                     Container(
//                                       width: double.infinity,
//                                       decoration: BoxDecoration(
//                                         color: FlutterFlowTheme.of(context)
//                                             .secondaryBackground,
//                                       ),
//                                       child: Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             0, 0, 0, 12),
//                                         child: Column(
//                                           mainAxisSize: MainAxisSize.max,
//                                           crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                           children: [
//                                             Padding(
//                                               padding: EdgeInsetsDirectional
//                                                   .fromSTEB(16, 8, 16, 12),
//                                               child: ClipRRect(
//                                                 borderRadius:
//                                                 BorderRadius.circular(16),
//                                                 child: Image.network(
//                                                   'https://source.unsplash.com/random/1280x720?beach',
//                                                   width: double.infinity,
//                                                   height: 230,
//                                                   fit: BoxFit.cover,
//                                                 ),
//                                               ),
//                                             ),
//                                             Padding(
//                                               padding: EdgeInsetsDirectional
//                                                   .fromSTEB(16, 0, 16, 4),
//                                               child: Row(
//                                                 mainAxisSize: MainAxisSize.max,
//                                                 mainAxisAlignment:
//                                                 MainAxisAlignment
//                                                     .spaceBetween,
//                                                 children: [
//                                                   Text(
//                                                     'Maidstone, San Antonio, Tx.',
//                                                     style: FlutterFlowTheme.of(
//                                                         context)
//                                                         .bodyLarge,
//                                                   ),
//                                                   Padding(
//                                                     padding:
//                                                     EdgeInsetsDirectional
//                                                         .fromSTEB(
//                                                         16, 0, 0, 0),
//                                                     child: Text(
//                                                       '\$210/night',
//                                                       style:
//                                                       FlutterFlowTheme.of(
//                                                           context)
//                                                           .titleLarge,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                             Padding(
//                                               padding: EdgeInsetsDirectional
//                                                   .fromSTEB(16, 0, 16, 4),
//                                               child: Row(
//                                                 mainAxisSize: MainAxisSize.max,
//                                                 mainAxisAlignment:
//                                                 MainAxisAlignment
//                                                     .spaceBetween,
//                                                 children: [
//                                                   Expanded(
//                                                     child: Text(
//                                                       '32 miles away',
//                                                       style:
//                                                       FlutterFlowTheme.of(
//                                                           context)
//                                                           .labelMedium,
//                                                     ),
//                                                   ),
//                                                   Padding(
//                                                     padding:
//                                                     EdgeInsetsDirectional
//                                                         .fromSTEB(
//                                                         16, 4, 4, 0),
//                                                     child: Text(
//                                                       '4.25',
//                                                       style:
//                                                       FlutterFlowTheme.of(
//                                                           context)
//                                                           .labelMedium,
//                                                     ),
//                                                   ),
//                                                   Icon(
//                                                     Icons.star_rounded,
//                                                     color: FlutterFlowTheme.of(
//                                                         context)
//                                                         .secondaryText,
//                                                     size: 24,
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SingleChildScrollView(
//                             child: Column(
//                               mainAxisSize: MainAxisSize.max,
//                               children: [
//                                 ListView(
//                                   padding: EdgeInsets.zero,
//                                   shrinkWrap: true,
//                                   scrollDirection: Axis.vertical,
//                                   children: [
//                                     Container(
//                                       width: double.infinity,
//                                       decoration: BoxDecoration(
//                                         color: FlutterFlowTheme.of(context)
//                                             .secondaryBackground,
//                                       ),
//                                       child: Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             0, 0, 0, 12),
//                                         child: Column(
//                                           mainAxisSize: MainAxisSize.max,
//                                           crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                           children: [
//                                             Padding(
//                                               padding: EdgeInsetsDirectional
//                                                   .fromSTEB(16, 8, 16, 12),
//                                               child: ClipRRect(
//                                                 borderRadius:
//                                                 BorderRadius.circular(16),
//                                                 child: Image.network(
//                                                   'https://source.unsplash.com/random/1280x720?beach&7',
//                                                   width: double.infinity,
//                                                   height: 230,
//                                                   fit: BoxFit.cover,
//                                                 ),
//                                               ),
//                                             ),
//                                             Padding(
//                                               padding: EdgeInsetsDirectional
//                                                   .fromSTEB(16, 0, 16, 4),
//                                               child: Row(
//                                                 mainAxisSize: MainAxisSize.max,
//                                                 mainAxisAlignment:
//                                                 MainAxisAlignment
//                                                     .spaceBetween,
//                                                 children: [
//                                                   Text(
//                                                     'Maidstone, San Antonio, Tx.',
//                                                     style: FlutterFlowTheme.of(
//                                                         context)
//                                                         .bodyLarge,
//                                                   ),
//                                                   Padding(
//                                                     padding:
//                                                     EdgeInsetsDirectional
//                                                         .fromSTEB(
//                                                         16, 0, 0, 0),
//                                                     child: Text(
//                                                       '\$210/night',
//                                                       style:
//                                                       FlutterFlowTheme.of(
//                                                           context)
//                                                           .titleLarge,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                             Padding(
//                                               padding: EdgeInsetsDirectional
//                                                   .fromSTEB(16, 0, 16, 4),
//                                               child: Row(
//                                                 mainAxisSize: MainAxisSize.max,
//                                                 mainAxisAlignment:
//                                                 MainAxisAlignment
//                                                     .spaceBetween,
//                                                 children: [
//                                                   Expanded(
//                                                     child: Text(
//                                                       '32 miles away',
//                                                       style:
//                                                       FlutterFlowTheme.of(
//                                                           context)
//                                                           .labelMedium,
//                                                     ),
//                                                   ),
//                                                   Padding(
//                                                     padding:
//                                                     EdgeInsetsDirectional
//                                                         .fromSTEB(
//                                                         16, 4, 4, 0),
//                                                     child: Text(
//                                                       '4.25',
//                                                       style:
//                                                       FlutterFlowTheme.of(
//                                                           context)
//                                                           .labelMedium,
//                                                     ),
//                                                   ),
//                                                   Icon(
//                                                     Icons.star_rounded,
//                                                     color: FlutterFlowTheme.of(
//                                                         context)
//                                                         .secondaryText,
//                                                     size: 24,
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                     Container(
//                                       width: double.infinity,
//                                       decoration: BoxDecoration(
//                                         color: FlutterFlowTheme.of(context)
//                                             .secondaryBackground,
//                                       ),
//                                       child: Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             0, 0, 0, 12),
//                                         child: Column(
//                                           mainAxisSize: MainAxisSize.max,
//                                           crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                           children: [
//                                             Padding(
//                                               padding: EdgeInsetsDirectional
//                                                   .fromSTEB(16, 8, 16, 12),
//                                               child: ClipRRect(
//                                                 borderRadius:
//                                                 BorderRadius.circular(16),
//                                                 child: Image.network(
//                                                   'https://source.unsplash.com/random/1280x720?beach&9',
//                                                   width: double.infinity,
//                                                   height: 230,
//                                                   fit: BoxFit.cover,
//                                                 ),
//                                               ),
//                                             ),
//                                             Padding(
//                                               padding: EdgeInsetsDirectional
//                                                   .fromSTEB(16, 0, 16, 4),
//                                               child: Row(
//                                                 mainAxisSize: MainAxisSize.max,
//                                                 mainAxisAlignment:
//                                                 MainAxisAlignment
//                                                     .spaceBetween,
//                                                 children: [
//                                                   Text(
//                                                     'Maidstone, San Antonio, Tx.',
//                                                     style: FlutterFlowTheme.of(
//                                                         context)
//                                                         .bodyLarge,
//                                                   ),
//                                                   Padding(
//                                                     padding:
//                                                     EdgeInsetsDirectional
//                                                         .fromSTEB(
//                                                         16, 0, 0, 0),
//                                                     child: Text(
//                                                       '\$210/night',
//                                                       style:
//                                                       FlutterFlowTheme.of(
//                                                           context)
//                                                           .titleLarge,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                             Padding(
//                                               padding: EdgeInsetsDirectional
//                                                   .fromSTEB(16, 0, 16, 4),
//                                               child: Row(
//                                                 mainAxisSize: MainAxisSize.max,
//                                                 mainAxisAlignment:
//                                                 MainAxisAlignment
//                                                     .spaceBetween,
//                                                 children: [
//                                                   Expanded(
//                                                     child: Text(
//                                                       '32 miles away',
//                                                       style:
//                                                       FlutterFlowTheme.of(
//                                                           context)
//                                                           .labelMedium,
//                                                     ),
//                                                   ),
//                                                   Padding(
//                                                     padding:
//                                                     EdgeInsetsDirectional
//                                                         .fromSTEB(
//                                                         16, 4, 4, 0),
//                                                     child: Text(
//                                                       '4.25',
//                                                       style:
//                                                       FlutterFlowTheme.of(
//                                                           context)
//                                                           .labelMedium,
//                                                     ),
//                                                   ),
//                                                   Icon(
//                                                     Icons.star_rounded,
//                                                     color: FlutterFlowTheme.of(
//                                                         context)
//                                                         .secondaryText,
//                                                     size: 24,
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
