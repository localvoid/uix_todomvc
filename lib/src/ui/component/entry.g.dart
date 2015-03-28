// GENERATED CODE - DO NOT MODIFY BY HAND
// 2015-03-28T11:31:44.766Z

part of uix_todomvc.src.ui.component.entry;

// **************************************************************************
// Generator: UixGenerator
// Target: class Entry
// **************************************************************************

Entry createEntry([int data, List<VNode> children, Component parent]) {
  return new Entry()
    ..parent = parent
    ..data = data
    ..children = children;
}
VNode vEntry({int data, Object key, String type, Map<String, String> attrs,
    Map<String, String> style, List<String> classes,
    List<VNode> children}) => new VNode.component(createEntry,
    flags: VNode.componentFlag,
    key: key,
    data: data,
    type: type,
    attrs: attrs,
    style: style,
    classes: classes,
    children: children);
