// GENERATED CODE - DO NOT MODIFY BY HAND
// 2015-03-22T11:15:28.831Z

part of uix_todomvc.src.ui.component.entry_list;

// **************************************************************************
// Generator: UixGenerator
// Target: class EntryList
// **************************************************************************

EntryList createEntryList([dynamic data, Component parent]) {
  final r = new EntryList()
    ..parent = parent
    ..data = data;
  r.init();
  return r;
}
VNode vEntryList({dynamic data, Object key, String type,
    Map<String, String> attrs, Map<String, String> style, List<String> classes,
    List<VNode> children}) => new VNode.component(createEntryList,
    flags: VNode.componentFlag | VNode.dirtyCheckFlag,
    key: key,
    data: data,
    type: type,
    attrs: attrs,
    style: style,
    classes: classes,
    children: children);
