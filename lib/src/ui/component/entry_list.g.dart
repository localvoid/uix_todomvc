// GENERATED CODE - DO NOT MODIFY BY HAND
// 2015-03-22T09:21:30.642Z

part of uix_todomvc.src.ui.component.entry_list;

// **************************************************************************
// Generator: UixGenerator
// Target: class EntryList
// **************************************************************************

EntryList createEntryList([dynamic data]) {
  final r = new EntryList()..data = data;
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
