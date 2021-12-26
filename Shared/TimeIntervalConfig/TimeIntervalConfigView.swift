import SwiftUI

struct TimeIntervalConfigView: View {
    @ObservedObject var settings: TimeIntervalConfig

    var body: some View {
        Stepper(value: $settings.intervalDuration,
                in: settings.range,
                step: settings.stepSize) {
            Text("Time Interval: \(settings.intervalDuration)")
        }
            .padding(.horizontal, 80)
    }
}

struct TimeIntervalConfigView_Previews: PreviewProvider {
    static var previews: some View {
        TimeIntervalConfigView(settings: TimeIntervalConfig(range: 1...9, stepSize: 1))
    }
}
