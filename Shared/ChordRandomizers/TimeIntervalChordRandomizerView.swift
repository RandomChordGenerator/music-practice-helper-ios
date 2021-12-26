import SwiftUI

struct TimeIntervalChordRandomizerView: View {
    @StateObject private var chordSetConfig = ChordSetConfig()
    @StateObject private var timeIntervalConfig = TimeIntervalConfig(range: 1...9, stepSize: 1)
    @StateObject var chordRandomizer = TimeIntervalChordRandomizer()
    
    var body: some View {
        VStack {
            Text("\(chordRandomizer.currentChord?.value ?? "No Chords Selected")")
                .font(.largeTitle)
            ProgressView(value: Float(chordRandomizer.intervalProgress))
                .padding(.horizontal, 100.0)
                .padding(.bottom, 200.0)
            TimeIntervalConfigView(settings: timeIntervalConfig)
            ChordSetConfigView(config: chordSetConfig)
            Spacer()
            
        }
        .navigationTitle("Timer Based Chord Randomizer")
        .navigationBarTitleDisplayMode(.automatic)
        .padding(.top, 100)
        .frame(minWidth: 0, minHeight: 500, alignment: .top)
        .onAppear {
            // Disable the idle timer to prevent sleeping while practicing
            UIApplication.shared.isIdleTimerDisabled = true
            
            // Start the randomizer
            chordRandomizer.chordSetConfig = chordSetConfig
            chordRandomizer.timeIntervalConfig = timeIntervalConfig
            chordRandomizer.start()
        }
        .onDisappear {
            // Re-enable the idle timer
            UIApplication.shared.isIdleTimerDisabled = false
        }
    }
}

struct TimeIntervalChordRandomizerView_Previews: PreviewProvider {
    static var previews: some View {
        TimeIntervalChordRandomizerView()
    }
}
