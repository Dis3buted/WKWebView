//
//  ViewController.swift
//  MyWKWebViewProto
//
//  Created by Distributed on 06/12/2016.
//  Copyright © 2016 Seven Years Later. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController/*, WKUIDelegate */{
    var webView: WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: self.view.bounds, configuration: webConfiguration)
        
        // Allows for Web Inspector in WKWebView with ctrl click
        self.webView?.configuration.preferences.setValue(true, forKey: "developerExtrasEnabled")
        
        view = webView!
        _ = webView?.loadHTMLString(mySVGString(), baseURL: nil)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func mySVGString() -> String {
        let str = "<!DOCTYPE html>\n" +
        "<html>\n" +
        "\t<head>\n" +
        "\t\t<title>\n" +
        "\t\t</title>\n" +
        "<script>\n" +
        "//<![CDATA[ \n\n" +
        "function startMove(event, moveType){\n" +
        "\tx1 = event.clientX;\n" +
        "\ty1 = event.clientY;\n" +
        "\tdocument.documentElement.setAttribute(\"onmousemove\",\"moveIt(event)\");\n" +
        "\t\tif (moveType == \'single\'){\n" +
        "\t\t\tC = event.target;\n" +
        "} " +
        "else {\n" +
        "\t\tC = event.target.parentNode;\n" +
        "\t}\n" +
        "}\n\n" +
        "function moveIt(event){\n" +
        "\ttranslation = C.getAttributeNS(null, \"transform\").slice(10,-1).split(\' \');\n" +
        "\tsx = parseInt(translation[0]);\n" +
        "\tsy = parseInt(translation[1]);\n" +
        "\tC.setAttributeNS(null, \"transform\", \"translate(\" + (sx + event.clientX - x1) + \" \" + (sy + event.clientY - y1) + \")\");\n" +
        "\tx1 = event.clientX;\n" +
        "\ty1 = event.clientY;\n" +
        "}\n\n" +
        "function endMove(){\n" +
        "\tdocument.documentElement.setAttributeNS(null, \"onmousemove\",null);\n" +
        "}\n\n" +
        "//]]>\n\n</script>\n" +
        "</head>\n\n" +
        "<body style=\"margin:0px; padding:0px;\" >\n" +
        "\t<svg width=\"800\" height=\"600\">\n" +
        "\t\t<rect width=\"800\" height=\"600\" fill=\"#fcfaef\">\n" + "\t\t</rect>\n" +
        "\t\t\t<g transform=\"translate(0 0)\">\n" +
        "\t\t\t\t<circle id=\"circle1\"" +
            "onmousedown=\"startMove(evt, \'single\')\" onmouseup=\"endMove()\"" +
            "transform=\"translate(60 200)\" cx=\"0\" cy=\"0\" r=\"22\"" +
            "fill=\"blue\" stroke=\"black\" stroke-width=\"8\"></circle>\n" +
        "\t\t\t\t<circle id=\"circle2\"" + "onmousedown=\"startMove(evt, \'single\')\" onmouseup=\"endMove()\"" + "transform=\"translate(200 200)\" cx=\"0\" cy=\"0\" r=\"22\"" +
            "fill=\"grey\" stroke=\"black\" stroke-width=\"8\"></circle>\n" +
        "\t\t\t\t<circle id=\"circle3\"" + "onmousedown=\"startMove(evt, \'group\')\" onmouseup=\"endMove()\"" +
            "transform=\"translate(50 50)\" cx=\"0\" cy=\"0\" r=\"22\"" +
            "fill=\"orange\" stroke=\"black\" stroke-width=\"8\"></circle>\n" +
        "\t\t\t</g>\n" +
        "\t</svg>\n" +
        "</body>\n" +
        "</html>\n"
        
        return str
    }
}

