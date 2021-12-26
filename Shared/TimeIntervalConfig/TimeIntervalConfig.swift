import Foundation

/**
Contains the settings used to configure the TimeIntervalConfigView contents.
 */
class TimeIntervalConfig: ObservableObject {
    @Published var intervalDuration = 4
    
    let range: ClosedRange<Int>
    let stepSize: Int
    
    init(range: ClosedRange<Int>, stepSize: Int) {
        self.range = range
        self.stepSize = stepSize
    }
}
