import Foundation

struct IdentifiableChordValue: Identifiable {
    let id = UUID()
    let chordValue: ChordValue
}
