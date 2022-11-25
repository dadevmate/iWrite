//
//  YouWrite_journal_entries.swift
//  YouWrite journal entries
//
//  Created by Nethan on 8/9/22.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct YouWrite_journal_entriesEntryView : View {
    var entry: Provider.Entry
   
    @State private var animateGradient = false
    var body: some View {
        VStack {
         
            ZStack {
         
                    LinearGradient(colors: [Color(red: 0.3, green: 0.2, blue: 0.8), .black], startPoint: animateGradient ? .topLeading : .bottomLeading, endPoint: animateGradient ? .bottomTrailing : .topTrailing)
                        .ignoresSafeArea()
                        .onAppear {
                            withAnimation(.linear(duration: 5.0).repeatForever(autoreverses: true)) {
                                animateGradient.toggle()
                            }
                        }
                VStack {
                    Spacer()
                    Spacer()
                    Spacer()
                    Text("YouWrite")
                        .font(.system(size: 25))
                        .fontWeight(.heavy)
                        .foregroundColor(Color(red: 0.5, green: 0.4, blue: 0.8))
                    Spacer()
                    
                    HStack {
                        
                        Button {
                         
                        } label: {
                            Image(systemName: "pencil.circle.fill")
                                .font(.system(size: 38))
                                .foregroundColor(.white)
                        }

                    
                        Button {
                            
                        } label: {
                            Image(systemName: "person.circle.fill")
                                .font(.system(size: 38))
                                .foregroundColor(.white)
                        }
                    
                    }
                    Button {
                       
                    } label: {
                        Image(systemName: "cart.circle.fill")
                            .font(.system(size: 38))
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Spacer()
                }
            }
        }
    }
}

@main
struct YouWrite_journal_entries: Widget {
    let kind: String = "YouWrite_journal_entries"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            YouWrite_journal_entriesEntryView(entry: entry)
        }
        .configurationDisplayName("The essentials")
        .description("Access essential YouWrite pages quickly")
    }
}

struct YouWrite_journal_entries_Previews: PreviewProvider {
    static var previews: some View {
        YouWrite_journal_entriesEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
