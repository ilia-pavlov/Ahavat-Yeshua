//
//  Ahavat_Yeshua_WidgetLiveActivity.swift
//  Ahavat Yeshua Widget
//
//  Created by Ilia Pavlov on 4/17/25.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct Ahavat_Yeshua_WidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct Ahavat_Yeshua_WidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: Ahavat_Yeshua_WidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension Ahavat_Yeshua_WidgetAttributes {
    fileprivate static var preview: Ahavat_Yeshua_WidgetAttributes {
        Ahavat_Yeshua_WidgetAttributes(name: "World")
    }
}

extension Ahavat_Yeshua_WidgetAttributes.ContentState {
    fileprivate static var smiley: Ahavat_Yeshua_WidgetAttributes.ContentState {
        Ahavat_Yeshua_WidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: Ahavat_Yeshua_WidgetAttributes.ContentState {
         Ahavat_Yeshua_WidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: Ahavat_Yeshua_WidgetAttributes.preview) {
   Ahavat_Yeshua_WidgetLiveActivity()
} contentStates: {
    Ahavat_Yeshua_WidgetAttributes.ContentState.smiley
    Ahavat_Yeshua_WidgetAttributes.ContentState.starEyes
}
