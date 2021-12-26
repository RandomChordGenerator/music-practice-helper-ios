import Foundation

// For reference: https://playingchordcharts.com/chords#notation
class ChordSetGenerator {
    private let notesBySymbols = ["A", "A♭", "A♯",
                               "B", "B♭", "B♯",
                               "C", "C♭", "C♯",
                               "D", "D♭", "D♯",
                               "E", "E♭", "E♯",
                               "F", "F♭", "F♯",
                               "G", "G♭", "G♯"]
    
    private let notesByKeys = ["A♭", "A",
                            "B♭", "B",
                            "C♭", "C", "C♯",
                            "D♭", "D",
                            "E♭", "E",
                            "F", "F♯",
                            "G♭", "G"]
    
    private let notesBySounds = ["A♭", "A",
                              "B♭", "B",
                              "C",
                              "D♭", "D",
                              "E♭", "E",
                              "F",
                              "G♭", "G"]
    
    func getChordSet(config: ChordSetConfig) -> [ChordValue] {
        var chordSet: [ChordValue] = []
        
        chordSet += config.majorTriads ? getDecoratedChords(config: config, decorator: nil) : []
        chordSet += config.minorTriads ? getDecoratedChords(config: config, decorator: "m") : []
        
        chordSet += config.dominateSeventh ? getDecoratedChords(config: config, decorator: "7") : []
        chordSet += config.majorSeventh ? getDecoratedChords(config: config, decorator: "Δ7") : []
        chordSet += config.minorSeventh ? getDecoratedChords(config: config, decorator: "-7") : []

        return chordSet
    }
    
    private func getDecoratedChords(config: ChordSetConfig, decorator: String?) -> Array<ChordValue> {
        var result: [ChordValue] = []
        
        var notes: [String];
        
        switch config.notePool {
        case .sounds:
            notes = notesBySounds
        case .keys:
            notes = notesByKeys
        case.symbols:
            notes = notesBySymbols
        }
        
        for note in notes {
            result.append(ChordValue(value: note + (decorator ?? "")))
        }
        return result
    }
}
