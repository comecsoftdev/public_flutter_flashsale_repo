import 'package:flutter/material.dart';
import 'package:flutter_simple_treeview/flutter_simple_treeview.dart';

class SelectionTreeWidget extends StatelessWidget {
  final void Function(dynamic node) onTap;
  /*dynamic type of node has id(int), name(string) and children.
  * id & name is mandatory, children is optional*/
  final List<dynamic> nodes;
  final TreeController _treeController = TreeController(allNodesExpanded: false);

  SelectionTreeWidget({
    Key? key,
    required this.onTap,
    required this.nodes,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    //Convert List<dynamic> to List<TreeNode>
    List<TreeNode> treeNodes = nodes.map((item) => toTreeNode(item)).toList();

    return Scrollbar(
      child: SingleChildScrollView(
        child: Container(
          child: TreeView(
            nodes: treeNodes,
            treeController: _treeController,
            iconSize: 25,
            indent: 0,
          ),
        ),
      ),
    );
  }

  TreeNode toTreeNode(dynamic node){
    assert(node.id != null);
    assert(node.name != null);
    TreeNode treeNode = TreeNode(
      content: createNodeContent(node),
      key: Key(node.id!.toString()),
      children: (node.children != null) ? node.children.map<TreeNode>((item) => toTreeNode(item)).toList() : null,
    );

    return treeNode;
  }

  Widget createNodeContent(node){
    return InkWell(
      onTap: (){
        // only leaf node call onTap callback
        if (node.children == null)
          onTap.call(node);
      },
      child: Text(
        node.name,
        style: TextStyle(
          fontSize: 25,
        ),
      ),
    );
  }
}