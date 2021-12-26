import SwiftUI

struct ChordSetConfigView: View {
    @ObservedObject var config: ChordSetConfig

    var body: some View {
        ScrollView {
            VStack {
                Picker("Note Pool", selection: $config.notePool) {
                    Text("Sounds - 12").tag(NotePoolType.sounds)
                    Text("Keys - 15").tag(NotePoolType.keys)
                    Text("Symbols - 21").tag(NotePoolType.symbols)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal, 40)
                
                Toggle("Major Triads", isOn: $config.majorTriads)
                    .padding(.horizontal, 80)
                Toggle("Minor Triads", isOn: $config.minorTriads)
                    .padding(.horizontal, 80)
                Toggle("Dominate Seventh", isOn: $config.dominateSeventh)
                    .padding(.horizontal, 80)
                Toggle("Major Seventh", isOn: $config.majorSeventh)
                    .padding(.horizontal, 80)
                Toggle("Minor Seventh", isOn: $config.minorSeventh)
                    .padding(.horizontal, 80)
            }
        }
    }
}

struct ChordSetConfigView_Previews: PreviewProvider {
    static var previews: some View {
        ChordSetConfigView(config: ChordSetConfig())
    }
}
