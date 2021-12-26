import Foundation

class TimeIntervalChordRandomizer: ObservableObject {
    @Published var currentChord: ChordValue?
    @Published var intervalProgressInSeconds: Int
    @Published var intervalProgress: Float
    
    @Published var chordSetConfig: ChordSetConfig
    @Published var timeIntervalConfig: TimeIntervalConfig
    
    private var timer: Timer?
    private var startDate: Date?
    private var frequency: TimeInterval { 1.0 }
    
    init() {
        // Default values
        intervalProgressInSeconds = 0
        intervalProgress = 0.0
        
        // TODO: Should these be provided by the caller to the init function?
        chordSetConfig = ChordSetConfig()
        timeIntervalConfig = TimeIntervalConfig(range: 1...9, stepSize: 1)
        
        currentChord = self.getRandomChord()
    }
    
    func start() {
        startDate = Date()
        timer = Timer.scheduledTimer(withTimeInterval: frequency, repeats: true) { [weak self] timer in
            if let self = self, let startDate = self.startDate {
                let secondsElapsed = Date().timeIntervalSince1970 - startDate.timeIntervalSince1970
                self.update(secondsElapsed: Int(secondsElapsed))
            }
        }
    }
    
    func update(secondsElapsed: Int) {
        intervalProgressInSeconds = secondsElapsed % timeIntervalConfig.intervalDuration
        intervalProgress = Float(intervalProgressInSeconds) / Float(timeIntervalConfig.intervalDuration - 1)
        if (intervalProgressInSeconds == 0) {
            currentChord = getRandomChord()
        }
    }
    
    func getRandomChord() -> ChordValue? {
        let chordSet = ChordSetGenerator().getChordSet(config: chordSetConfig)
        
        return !chordSet.isEmpty ? chordSet.randomElement()! : nil
    }
}
