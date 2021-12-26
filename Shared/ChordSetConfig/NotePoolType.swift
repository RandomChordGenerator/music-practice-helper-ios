import Foundation

enum NotePoolType: String, CaseIterable, Identifiable {
    // There are 21 symbols. For example, Cb is B, and B# is C.
    case symbols
    // There are 15 keys. 6 of the keys have overlapping values, meaning 3 are effectively dupes.
    case keys
    // There are 12 sounds in equal temperment
    case sounds

    var id: String { self.rawValue }
}
