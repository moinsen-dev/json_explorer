import 'package:flutter/material.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:json_explorer/src/json_tree_view.dart';

class JsonExplorer extends StatelessWidget {
  const JsonExplorer(this.json, {Key? key}) : super(key: key);

  final Map<String, dynamic> json;

  @override
  Widget build(BuildContext context) {
    return const JsonTreeViewer(
      [
        Node(
          label: 'documents',
          key: 'docs',
          expanded: true,
          icon: Icons.folder_open,
          children: [
            Node(
              label: 'personal',
              key: 'd3',
              icon: Icons.input,
              iconColor: Colors.red,
              children: [
                Node(
                  label: 'Poems.docx',
                  key: 'pd1',
                  icon: Icons.insert_drive_file,
                ),
                Node(
                  label: 'Job Hunt',
                  key: 'jh1',
                  icon: Icons.input,
                  children: [
                    Node(
                      label: 'Resume.docx',
                      key: 'jh1a',
                      icon: Icons.insert_drive_file,
                    ),
                    Node(
                      label: 'Cover Letter.docx',
                      key: 'jh1b',
                      icon: Icons.insert_drive_file,
                    ),
                  ],
                ),
              ],
            ),
            Node(
              label: 'Inspection.docx',
              key: 'd1',
//          icon: Icons.insert_drive_file),
            ),
            Node(
                label: 'Invoice.docx',
                key: 'd2',
                icon: Icons.insert_drive_file),
          ],
        ),
        Node(
            label: 'MeetingReport.xls',
            key: 'mrxls',
            icon: Icons.insert_drive_file),
        Node(
            label: 'MeetingReport.pdf',
            key: 'mrpdf',
            iconColor: Colors.green,
            selectedIconColor: Colors.white,
            icon: Icons.insert_drive_file),
        Node(label: 'Demo.zip', key: 'demo', icon: Icons.archive),
        Node(
          label: 'empty folder',
          key: 'empty',
          parent: true,
        ),
      ],
    );
  }
}
