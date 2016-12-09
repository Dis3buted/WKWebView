Simple WKWebView app.
Uses loadHTMLString to load initial web page, page has few svg element's that can be dragged, 
blue, gray, move as single and  orange move all as a group. Ctrl click bring's context menu with menu item Inspect Element.
That load's Web Inspector. For some reason debugger gives Window warning when loading Web Inspector when window is resized to little bigger to add Inspector as sub view.
When window is small Web Inspector open's in own window and when window is at max it's added as subview and the error happens.
Web Inspector is good for reading the html string loaded, in code it's hard as it's as a string.
Xcode Version 8.2 beta (8C30a).
