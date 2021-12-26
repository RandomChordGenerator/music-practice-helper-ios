import Foundation

class ChordSetConfig: ObservableObject {
    @Published var notePool = NotePoolType.sounds
    
    @Published var majorTriads = true
    @Published var minorTriads = true

    @Published var dominateSeventh = false
    @Published var majorSeventh = false
    @Published var minorSeventh = false
}
