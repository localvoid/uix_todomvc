// GENERATED CODE - DO NOT MODIFY BY HAND
// 2015-03-22T09:21:30.608Z

part of uix_todomvc.src.ui.component.entry;

// **************************************************************************
// Generator: UixGenerator
// Target: class Entry
// **************************************************************************

Entry createEntry([int data]) {
  final r = new Entry()..data = data;
  r.init();
  return r;
}
VNode vEntry({int data, Object key, String type, Map<String, String> attrs,
    Map<String, String> style, List<String> classes,
    List<VNode> children}) => new VNode.component(createEntry,
    flags: VNode.componentFlag | VNode.dirtyCheckFlag,
    key: key,
    data: data,
    type: type,
    attrs: attrs,
    style: style,
    classes: classes,
    children: children);
