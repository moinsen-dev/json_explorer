import 'package:flutter/material.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:json_explorer/src/json_tree_view.dart';

class JsonExplorer extends StatefulWidget {
  const JsonExplorer(
    this.json, {
    Key? key,
    this.name = 'JSON-Root',
    this.filter,
    this.show,
  }) : super(key: key);

  final Map<String, dynamic> json;
  final String name;
  final List<String>? filter;
  final List<String>? show;

  @override
  State<JsonExplorer> createState() => _JsonExplorerState();
}

class _JsonExplorerState extends State<JsonExplorer> {
  late List<Node> _nodes;

  Node? transformJson(
    dynamic json, {
    String path = '',
    required String label,
    bool isParent = false,
  }) {
    if (!isParent) {
      if (widget.show != null && widget.show!.isNotEmpty) {
        for (var _show in widget.show!) {
          if (!path.contains(_show)) {
            return null;
          }
        }
      }

      if (widget.filter != null && widget.filter!.isNotEmpty) {
        for (var _filter in widget.filter!) {
          if (path.contains(_filter)) {
            return null;
          }
        }
      }
    }

    if (json is Map) {
      var _map = json as Map<String, dynamic>;
      var _children = <Node>[];

      _map.forEach(
        (key, value) {
          var _node = transformJson(
            value,
            path: '$path/$key',
            label: key,
          );

          if (_node != null) {
            _children.add(_node);
          }
        },
      );

      return Node(
        key: label,
        label: label,
        icon: Icons.device_hub,
        parent: isParent,
        expanded: true,
        children: _children,
      );
    } else if (json is List) {
      var _list = json;
      var _children = <Node>[];

      int _counter = 1;
      for (var _element in _list) {
        var _label = '$label-${_counter++}';
        var _node = transformJson(
          _element,
          label: _label,
          path: '$path/$_label',
        );

        if (_node != null) {
          _children.add(_node);
        }
      }

      return Node(
        key: label,
        label: label,
        icon: Icons.list,
        parent: isParent,
        expanded: true,
        children: _children,
      );
    }

    late IconData icon;

    if (json is String) {
      icon = Icons.description;
    } else if (json is bool) {
      icon = Icons.check_box_outlined;
    } else if (json is int) {
      icon = Icons.tag;
    } else if (json is double) {
      icon = Icons.animation_outlined;
    } else {
      icon = Icons.text_fields;
    }

    return Node(
      key: json.toString(),
      label: '$label: ${json.toString()}',
      parent: isParent,
      icon: icon,
    );
  }

  @override
  void initState() {
    _nodes = [
      transformJson(
        widget.json,
        label: widget.name,
        isParent: true,
      )!,
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return JsonTreeViewer(_nodes);
  }
}
