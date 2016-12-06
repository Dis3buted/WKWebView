Simple WKWebView app.
Uses loadHTMLString to load initial web page, page has few svg element's that can be dragged, 
blue, gray, move as single and  orange move all as a group. Ctrl click bring's context menu with menu item Inspect Element.
That load's Web Inspector, Reload just renders view white don't use it. For some reason debugger gives Window warning when loading Web Inspector when window is resized to max size 800x600, so don't resize to max before loading Web Inspector.
When window is small Web Inspector open's in own window and when window is at max it's added as subview and the error happens.

Xcode Version 8.2 beta (8C30a).
