import SwiftUI

struct StaticSequenceChordRandomizerView: View {
    @StateObject private var chordSetConfig = ChordSetConfig()
    @State private var randomizedChordSequence: [IdentifiableChordValue] = []
    
    private var columns: [GridItem] = [
        GridItem(),
        GridItem(),
        GridItem(),
        GridItem()
    ]
    
    func refreshChordSequence() {
        var updatedChordSequence: [IdentifiableChordValue] = []

        let chordSet = ChordSetGenerator().getChordSet(config: chordSetConfig)
        
        if (!chordSet.isEmpty) {
            for _ in 1...12 {
                let chordValue = chordSet.randomElement()!
                updatedChordSequence.append(IdentifiableChordValue(chordValue: chordValue))
            }
        }
        self.randomizedChordSequence = updatedChordSequence
    }
    
    var body: some View {
        VStack {
            if (!randomizedChordSequence.isEmpty) {
                LazyVGrid(columns: columns) {
                    Section() {
                        ForEach(randomizedChordSequence) { identifiableChordValue in
                            Text(identifiableChordValue.chordValue.value)
                                .font(.system(size: 30.0))
                                .padding(.bottom, 50)
                                .multilineTextAlignment(.center)
                        }
                    }
                }
            } else {
                Text("No Chords Selected")
            }
            
            ChordSetConfigView(config: chordSetConfig)
            
            Button(action: refreshChordSequence) {
                HStack {
                    Text("Refresh Chords")
                }
                    .padding(10)
                    .frame(minWidth: 350)
            }
                .font(.system(size: 25.0))
                .background(Color.blue)
                .cornerRadius(10)
                .foregroundColor(.white)
                .padding(.bottom, 8)
                .padding(.horizontal, 5)
            
            Spacer()
        }
        .navigationTitle("Static Sequence Chord Randomizer")
        .navigationBarTitleDisplayMode(.automatic)
        .padding(.top, 100)
        .frame(minWidth: 0, minHeight: 500, alignment: .top)
        .onAppear {
            // Disable the idle timer to prevent sleeping while practicing
            UIApplication.shared.isIdleTimerDisabled = true
            
            // Initializing the chord sequence
            refreshChordSequence()
        }
        .onDisappear {
            // Re-enable the idle timer
            UIApplication.shared.isIdleTimerDisabled = false
        }
    }
}

struct StaticSequenceChordRandomizerView_Previews: PreviewProvider {
    static var previews: some View {
        StaticSequenceChordRandomizerView()
.previewInterfaceOrientation(.portraitUpsideDown)
    }
}
