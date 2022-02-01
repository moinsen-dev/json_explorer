import 'package:flutter/material.dart';
import 'package:flutter_treeview/flutter_treeview.dart';

class JsonTreeViewer extends StatefulWidget {
  const JsonTreeViewer(
    this.nodes, {
    Key? key,
  }) : super(key: key);

  final List<Node<dynamic>> nodes;

  @override
  State<JsonTreeViewer> createState() => _JsonTreeViewerState();
}

class _JsonTreeViewerState extends State<JsonTreeViewer> {
  late TreeViewController _treeViewController;
  String? _selectedNode;

  @override
  void initState() {
    _treeViewController = TreeViewController(
      children: widget.nodes,
      selectedKey: _selectedNode,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TreeViewTheme _treeViewTheme = TreeViewTheme(
      expanderTheme: const ExpanderThemeData(
        type: ExpanderType.caret,
        modifier: ExpanderModifier.none,
        position: ExpanderPosition.start,
        // color: Colors.grey.shade800,
        size: 20,
        color: Colors.blue,
      ),
      labelStyle: const TextStyle(
        fontSize: 16,
        letterSpacing: 0.3,
      ),
      parentLabelStyle: TextStyle(
        fontSize: 16,
        letterSpacing: 0.1,
        fontWeight: FontWeight.w800,
        color: Colors.blue.shade700,
      ),
      iconTheme: IconThemeData(
        size: 18,
        color: Colors.grey.shade800,
      ),
      colorScheme: Theme.of(context).colorScheme,
    );

    return TreeView(
      controller: _treeViewController,
      allowParentSelect: false,
      supportParentDoubleTap: false,
      onExpansionChanged: (key, expanded) {
        debugPrint(key);
      },
      onNodeTap: (key) {
        debugPrint('Selected: $key');
      },
      theme: _treeViewTheme,
    );
  }
}
