import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdfx/pdfx.dart';
import 'package:tailboard_app/protocols/blocs/algorithm_bloc.dart';
import 'package:tailboard_app/protocols/models/algorithm.dart';
import 'package:tailboard_app/protocols/widgets/algorithm_notes_list.dart';
import 'package:tailboard_app/protocols/widgets/algorithm_stepper.dart';
import 'package:tailboard_app/widgets/app_scaffold.dart';
import 'package:tailboard_app/widgets/beta_toast.dart';
import 'package:tailboard_app/widgets/unimplemented_dialog.dart';

class AlgorithmDetailScreen extends StatefulWidget {
  const AlgorithmDetailScreen({super.key, required this.algorithm});

  final Algorithm algorithm;

  @override
  State<StatefulWidget> createState() => _AlgorithmDetailScreenState();
}

class _AlgorithmDetailScreenState extends State<AlgorithmDetailScreen>
    with SingleTickerProviderStateMixin {
  AlgorithmBloc bloc = AlgorithmBloc();
  Future<PdfDocument>? _pdfDocument;
  PdfController? _pdfController;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController _tabController;
  int _selectedIndex = 0;
  bool docView = false;
  bool noteView = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    bloc.add(AlgorithmLoaded(algorithm: widget.algorithm));
    if (widget.algorithm.document != null) {
      downloadDocument(widget.algorithm.document!);
    }
    BetaToast.showBetaToast(context, 'protocol_detail_screen');
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  Future<void> downloadDocument(String filename) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    File downloadToFile = File('${appDocDir.path}/$filename');
    await downloadToFile.create(recursive: true);

    try {
      // TODO Add progress indicator for download
      await FirebaseStorage.instance.ref(filename).writeToFile(downloadToFile);
      _pdfDocument = PdfDocument.openFile(downloadToFile.path);
      setState(() {
        _pdfController = PdfController(
          document: _pdfDocument!,
        );
      });
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    }
  }

  void _onItemTapped(int index) {
    if (index == 0) {
      setState(() {
        docView = false;
        noteView = false;
        _selectedIndex = 0;
      });
    } else if (index == 1) {
      if (_pdfController != null) {
        setState(() {
          _pdfController = PdfController(
            document: _pdfDocument!,
          );
          docView = true;
          noteView = false;
          _selectedIndex = 1;
        });
      }
    } else if (index == 2) {
      if (widget.algorithm.notes.isNotEmpty) {
        setState(() {
          docView = false;
          noteView = true;
          _selectedIndex = 2;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) {
          return;
        }
        if (docView || noteView) {
          _onItemTapped(0);
          return;
        }
        Navigator.of(context).pop();
      },
      child: BlocProvider.value(
        value: bloc,
        child: AppScaffold(
          scaffoldKey: scaffoldKey,
          title: widget.algorithm.name,
          actions: <Widget>[
            IconButton(
              onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) =>
                    const UnimplementedDialog(featureName: 'History Saving'),
              ),
              icon: const Icon(Icons.save),
            ),
          ],
          floatingActionButton: !docView && !noteView && bloc.canUndo
              ? FloatingActionButton(
                  onPressed: () => bloc.undo(),
                  child: const Icon(Icons.undo),
                )
              : null,
          body: Column(
            children: [
              TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(text: 'Home'),
                  Tab(text: 'Overview'),
                  Tab(text: 'Notes'),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      const AlgorithmStepper(),
                      _pdfController != null
                          ? PdfView(controller: _pdfController!)
                          : const Center(child: CircularProgressIndicator()),
                      AlgorithmNotesList(notes: widget.algorithm.notes),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
