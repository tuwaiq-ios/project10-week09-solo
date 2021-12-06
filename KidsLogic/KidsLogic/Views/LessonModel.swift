//
//  LessonModel.swift
//  KidsLogic
//
//  Created by sara saud on 23/04/1443 AH.
//

import Foundation
import SwiftUI

struct Logic {
    var image   : String
    var caption = "KID Logic"
    var title   : String
    var desc    : String
    var author  : String
    var authorName : String

}

class LogicPosts {
    static let posts = [
        Logic(image: "1", caption: "🐼", title:(NSLocalizedString("ALGORITHM", comment: "")), desc: (NSLocalizedString("1: Think of it this way: many introductory lessons introduce algorithms as mathematical “recipes”; and like a recipe, algorithms contain clear steps working towards an established result. ", comment: "")), author: "🐼", authorName: "1"),
        
        Logic(image: "2", caption: "🐼", title:(NSLocalizedString("BOOLEAN", comment: "")), desc: (NSLocalizedString("2: Booleans are “truth values” — they’re a data type that can represent one of two outcomes: true or false. (In some languages, true and false can be represented as 1 or 0, but the takeaway message is the same.)", comment: "")),author: "🐼", authorName: "2"),

        Logic(image: "3", caption: "🤖",title:(NSLocalizedString("BORDER RADIUS", comment: "")), desc: (NSLocalizedString( "3: A box's backgrounds, but not its border-image, are clipped to the appropriate curve (as determined by ‘background-clip’). Other effects that clip to the border or padding edge (such as ‘overflow’ other than ‘visible’) also must clip to the curve. The content of replaced elements is always trimmed to the content edge curve. Also, the area outside the curve of the border edge does not accept mouse events on behalf of the element.", comment: "")),author: "🐼", authorName: "3"),

        Logic(image: "4", caption: "🦊🐼",title:(NSLocalizedString("BUG", comment: "")), desc: (NSLocalizedString( "4: In IT, a bug refers to an error, fault or flaw in any computer program or a hardware system. A bug produces unexpected results or causes a system to behave unexpectedly. In short it is any behavior or result that.", comment: "")),author: "🐼", authorName: "4"),

        Logic(image: "5", caption: "🐸", title:(NSLocalizedString("CSS", comment: "")), desc: (NSLocalizedString( "5: CSS, which stands for Cascading Style Sheets, is a language used alongside HTML to separate a webpage's content (the HTML part) from the design and formatting (the CSS part). It defines fonts, colors, margins, lines, height, width, backgrounds, images, positions and other visual aspects of a webpage, something which HTML was not originally designed to do. Simply put, CSS decides how your HTML is displayed.", comment: "")),author: "🐼", authorName: "5"),


        Logic(image: "6", caption: "🐸",title:(NSLocalizedString( "DEBUG", comment: "")), desc: (NSLocalizedString("6: In computer programming and software development, debugging is the process of finding and resolving bugs (defects or problems that prevent correct operation) within computer programs, software, or systems.Debugging tactics can involve interactive debugging, control flow analysis, unit testing, integration testing, log file analysis, monitoring at the application or system level, memory dumps, and profiling. Many programming languages and software development tools also offer programs to aid in debugging, known as debuggers.", comment: "")),author: "🐼", authorName: "6"),

        Logic(image: "7", caption: "🦉", title: (NSLocalizedString("DEFAULT", comment: "")), desc: (NSLocalizedString("7:Default values are standards values that are universal to all instances of the device or model and intended to make the device as accessible as possible (out of the box) without necessitating a lengthy configuration process prior to use. The user only has to modify the default settings according to their personal preferences. In many devices, the user has the option to restore these default settings for one or all options. Such an assignment makes the choice of that setting or value more likely, this is called the default effect.", comment: "")),author: "🐼", authorName: "7"),

        Logic(image: "8", caption: "🐼", title: (NSLocalizedString("HTML5", comment: "")), desc: (NSLocalizedString("8: HTML5 is a markup language used for structuring and presenting content on the World Wide Web. It is the fifth and last[3] major HTML version that is a World Wide Web Consortium (W3C) recommendation. The current specification is known as the HTML Living Standard. It is maintained by the Web Hypertext Application Technology Working Group (WHATWG), a consortium of the major browser vendors (Apple, Google, Mozilla, and Microsoft). ", comment: "")),author: "🐼", authorName: "8"),

        Logic(image: "9", caption: "🐼", title: (NSLocalizedString("HTML" ,comment: "")), desc: (NSLocalizedString("9: The HyperText Markup Language, or HTML is the standard markup language for documents designed to be displayed in a web browser. It can be assisted by technologies such as Cascading Style Sheets (CSS) and scripting languages such as JavaScript.Web browsers receive HTML documents from a web server or from local storage and render the documents into multimedia web pages. HTML describes the structure of a web page semantically and originally included cues for the appearance of the document." , comment: "")),author: "🐼", authorName: "9"
             ),

        Logic(image: "10", caption: "🐸", title: (NSLocalizedString("HOVER",comment: "")), desc: (NSLocalizedString("10:                                              He hover effect is the alteration of the appearance of a component of the graphical interface once the mouse is hovering over it, even if it has not been selected. For example, if you hover your mouse over this word you will see that it changes color, giving you to understand that it will refer you to another link if you click on it, but you still cannot visualize what is hidden behind this word. All the user will need to visualize your effect is a mouse. It is very original when we place this effect in the caption. The e fecto hover t It is also known as hovering.",comment: "")),author: "🐼", authorName: "10"),


        Logic(image: "11", caption: "🐸", title: (NSLocalizedString("HEX COLOR",comment: "")), desc: (NSLocalizedString("11:Hex colors are a way of representing colors from various color models through hexadecimal values. A hexadecimal color follows the format #RRGGBB, where RR is red, GG is green, and BB is blue. These hexadecimal integers can be in a range of 00 to FF to specify the intensity of the color.",comment: "")) , author: "🐼", authorName: "11"),

        Logic(image: "12", caption: "🦨", title: (NSLocalizedString("HEIGHT",comment: "")), desc:(NSLocalizedString("12: A box's backgrounds, but not its border-image, are clipped to the appropriate curve (as determined by ‘background-clip’). Other effects that clip to the border or padding edge (such as ‘overflow’ other than ‘visible’) also must clip to the curve. The content of replaced elements is always trimmed to the content edge curve. Also, the area outside the curve of the border edge does not accept mouse events on behalf of the element.",comment: "")), author: "🐼", authorName: "12"),

        Logic(image: "13", caption: "🐼", title: (NSLocalizedString("FUNCTION",comment: "")), desc: (NSLocalizedString("13:Functions are self contained modules of code that accomplish a specific task. Functions usually take in data, process it, and return a result. Once a function is written, it can be used over and over and over again. Functions can be called from the inside of other functions.",comment: "")), author: "🐼", authorName: "13"),
//
//        Logic(image: "14", caption: "🐼", title: (NSLocalizedString("OPACITY",comment: "")), desc: (NSLocalizedString("14: CSS, which stands for Cascading Style Sheets, is a language used alongside HTML to separate a webpage's content (the HTML part) from the design and formatting (the CSS part). It defines fonts, colors, margins, lines, height, width, backgrounds, images, positions and other visual aspects of a webpage, something which HTML was not originally designed to do. Simply put, CSS decides how your HTML is displayed.",comment: "")),author: "🐼", authorName: "14"),
//
//        Logic(image: "15", caption: "🐼", title: (NSLocalizedString("NULL",comment: "")), desc: (NSLocalizedString("15: Think of it this way: many introductory lessons introduce algorithms as mathematical “recipes”; and like a recipe, algorithms contain clear steps working towards an established result. ",comment: "")),author: "🐼", authorName: "15"),
//
//        Logic(image: "16", caption: "👽", title: (NSLocalizedString("LOOP",comment: "")), desc: (NSLocalizedString("16: Booleans are “truth values” — they’re a data type that can represent one of two outcomes: true or false. (In some languages, true and false can be represented as 1 or 0, but the takeaway message is the same.)",comment: "")),author: "🐼", authorName: "16"),
//
//        Logic(image: "17", caption: "👽", title: (NSLocalizedString("JAVA SCRIPT",comment: "")), desc: (NSLocalizedString("17: A box's backgrounds, but not its border-image, are clipped to the appropriate curve (as determined by ‘background-clip’). Other effects that clip to the border or padding edge (such as ‘overflow’ other than ‘visible’) also must clip to the curve. The content of replaced elements is always trimmed to the content edge curve. Also, the area outside the curve of the border edge does not accept mouse events on behalf of the element.",comment: "")),author: "🐼", authorName: "17"),
//
//        Logic(image: "18", caption: "🦝", title: (NSLocalizedString("IF STATEMENT",comment: "")), desc: (NSLocalizedString("18: In IT, a bug refers to an error, fault or flaw in any computer program or a hardware system. A bug produces unexpected results or causes a system to behave unexpectedly. In short it is any behavior or result that.",comment: "")),author: "🐼", authorName: "18"),
//
//        Logic(image: "19", caption: "🦊", title: (NSLocalizedString("SCALE",comment: "")), desc: (NSLocalizedString("19: CSS, which stands for Cascading Style Sheets, is a language used alongside HTML to separate a webpage's content (the HTML part) from the design and formatting (the CSS part). It defines fonts, colors, margins, lines, height, width, backgrounds, images, positions and other visual aspects of a webpage, something which HTML was not originally designed to do. Simply put, CSS decides how your HTML is displayed.",comment: "")),author: "🐼", authorName: "19"),
//
//
//        Logic(image: "20", caption: "🤖",title: (NSLocalizedString("RUNTIME",comment: "")), desc: (NSLocalizedString("20: Think of it this way: many introductory lessons introduce algorithms as mathematical “recipes”; and like a recipe, algorithms contain clear steps working towards an established result. ",comment: "")),author: "🐼", authorName: "20"),
//
//        Logic(image: "30", caption: "🦉", title: (NSLocalizedString("RGB COLOR",comment: "")), desc: (NSLocalizedString("21: Booleans are “truth values” — they’re a data type that can represent one of two outcomes: true or false. (In some languages, true and false can be represented as 1 or 0, but the takeaway message is the same.)",comment: "")),author: "🐼", authorName: "21"),
//
//        Logic(image: "40", caption: "🐸", title: (NSLocalizedString("REFRESH",comment: "")), desc: (NSLocalizedString("22: A box's backgrounds, but not its border-image, are clipped to the appropriate curve (as determined by ‘background-clip’). Other effects that clip to the border or padding edge (such as ‘overflow’ other than ‘visible’) also must clip to the curve. The content of replaced elements is always trimmed to the content edge curve. Also, the area outside the curve of the border edge does not accept mouse events on behalf of the element.",comment: "")),author: "🐼", authorName: "22"),
//
//        Logic(image: "50", caption: "🐸", title: (NSLocalizedString("PIXELS",comment: "")), desc: (NSLocalizedString("23: In IT, a bug refers to an error, fault or flaw in any computer program or a hardware system. A bug produces unexpected results or causes a system to behave unexpectedly. In short it is any behavior or result that.",comment: "")),author: "🐼", authorName: "panda"),
//
//        Logic(image: "60", caption: "🦉", title: (NSLocalizedString("PATH",comment: "")), desc: (NSLocalizedString("24: CSS, which stands for Cascading Style Sheets, is a language used alongside HTML to separate a webpage's content (the HTML part) from the design and formatting (the CSS part). It defines fonts, colors, margins, lines, height, width, backgrounds, images, positions and other visual aspects of a webpage, something which HTML was not originally designed to do. Simply put, CSS decides how your HTML is displayed.",comment: "")),author: "🐼", authorName: "23"),
//
//
//        Logic(image: "70", caption: "🦝", title: (NSLocalizedString("WIDTH",comment: "")), desc: (NSLocalizedString("25: Booleans are “truth values” — they’re a data type that can represent one of two outcomes: true or false. (In some languages, true and false can be represented as 1 or 0, but the takeaway message is the same.)",comment: "")),author: "🐼", authorName: "24"),
//
//        Logic(image: "80", caption: "🦉", title: (NSLocalizedString("SYNTAX",comment: "")), desc: (NSLocalizedString("26: A box's backgrounds, but not its border-image, are clipped to the appropriate curve (as determined by ‘background-clip’). Other effects that clip to the border or padding edge (such as ‘overflow’ other than ‘visible’) also must clip to the curve. The content of replaced elements is always trimmed to the content edge curve. Also, the area outside the curve of the border edge does not accept mouse events on behalf of the element.",comment: "")),author: "🐼", authorName: "25"),
//
//        Logic(image: "90", caption: "🤖", title: (NSLocalizedString("STRING",comment: "")), desc: (NSLocalizedString("27: In IT, a bug refers to an error, fault or flaw in any computer program or a hardware system. A bug produces unexpected results or causes a system to behave unexpectedly. In short it is any behavior or result that.",comment: "")),author: "🐼", authorName: "26"),

        Logic(image: "🐼", caption: "⏳", title: "SOON", desc: ".",author: "🐼", authorName: " Good job ✅")

    ]
    
}
