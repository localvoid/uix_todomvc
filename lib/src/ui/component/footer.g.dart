// GENERATED CODE - DO NOT MODIFY BY HAND
// 2015-03-22T11:15:28.815Z

part of uix_todomvc.src.ui.component.footer;

// **************************************************************************
// Generator: UixGenerator
// Target: class Footer
// **************************************************************************

Footer createFooter([dynamic data, Component parent]) {
  final r = new Footer()
    ..parent = parent
    ..data = data;
  r.init();
  return r;
}
VNode vFooter({dynamic data, Object key, String type, Map<String, String> attrs,
    Map<String, String> style, List<String> classes,
    List<VNode> children}) => new VNode.component(createFooter,
    flags: VNode.componentFlag | VNode.dirtyCheckFlag,
    key: key,
    data: data,
    type: type,
    attrs: attrs,
    style: style,
    classes: classes,
    children: children);
