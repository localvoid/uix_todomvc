// GENERATED CODE - DO NOT MODIFY BY HAND
// 2015-03-17T11:04:48.037Z

part of app.components.entry_list;

// **************************************************************************
// Generator: UixGenerator
// Target: class EntryList
// **************************************************************************

EntryList createEntryList([List data]) {
  final r = new EntryList()..data = data;
  return r;
}
VNode vEntryList({List data, Object key, String type, Map<String, String> attrs,
    Map<String, String> style, List<String> classes,
    List<VNode> children}) => new VNode.component(createEntryList,
    flags: VNode.componentFlag,
    key: key,
    data: data,
    type: type,
    attrs: attrs,
    style: style,
    classes: classes,
    children: children);
