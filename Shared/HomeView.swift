import SwiftUI

struct HomeView: View {    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    Section(header: ChordRandomizerHeader()) {
                        NavigationLink(destination: TimeIntervalChordRandomizerView()) {
                            Text("Timer Based")
                        }

                        NavigationLink(destination: StaticSequenceChordRandomizerView()) {
                            Text("Static Sequence")
                        }
                    }
                }
                .navigationTitle("Music Practice Helper")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct ChordRandomizerHeader: View {
    var body: some View {
        HStack {
            Text("Chord Randomizers")
                .font(.body)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
