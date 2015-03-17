// GENERATED CODE - DO NOT MODIFY BY HAND
// 2015-03-17T14:29:38.698Z

part of app.components.entry;

// **************************************************************************
// Generator: UixGenerator
// Target: class Entry
// **************************************************************************

Entry createEntry([store.Entry data]) {
  final r = new Entry()..data = data;
  return r;
}
VNode vEntry({store.Entry data, Object key, String type,
    Map<String, String> attrs, Map<String, String> style, List<String> classes,
    List<VNode> children}) => new VNode.component(createEntry,
    flags: VNode.componentFlag,
    key: key,
    data: data,
    type: type,
    attrs: attrs,
    style: style,
    classes: classes,
    children: children);
