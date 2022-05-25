//
//  PiePolylineChart.swift
//  SwiftUI-Charts-Demo
//
//  Created by TAISHIN MIYAMOTO on 2022/05/25.
//

import SwiftUI
import Charts

private let parties = [
    "Party A", "Party B", "Party C", "Party D", "Party E", "Party F",
    "Party G", "Party H", "Party I", "Party J", "Party K", "Party L",
    "Party M", "Party N", "Party O", "Party P", "Party Q", "Party R",
    "Party S", "Party T", "Party U", "Party V", "Party W", "Party X",
    "Party Y", "Party Z"
]

struct PiePolylineChart: UIViewRepresentable {
    @Environment(\.colorScheme) var colorScheme
    func makeUIView(context: Context) -> PieChartView {
        let chartView = PieChartView()

        chartView.legend.enabled = false
        chartView.setExtraOffsets(left: 20, top: 0, right: 20, bottom: 0)

        chartView.entryLabelColor = .black
        chartView.entryLabelFont = .systemFont(ofSize: 12, weight: .light)

        chartView.data = setDataCount(10, range: 100)

        chartView.animate(xAxisDuration: 1.4, easingOption: .easeOutBack)

        return chartView
    }
    func updateUIView(_ uiView: PieChartView, context: Context) {
    }

    func setDataCount(_ count: Int, range: UInt32) -> PieChartData {
        let entries = (0..<count).map { (i) -> PieChartDataEntry in
            // IMPORTANT: In a PieChart, no values (Entry) should have the same xIndex (even if from different DataSets), since no values can be drawn above each other.
            return PieChartDataEntry(value: Double(arc4random_uniform(range) + range / 5),
                                     label: parties[i % parties.count])
        }

        let set = PieChartDataSet(entries: entries, label: "Election Results")
        set.sliceSpace = 2


        set.colors = ChartColorTemplates.vordiplom()
            + ChartColorTemplates.joyful()
            + ChartColorTemplates.colorful()
            + ChartColorTemplates.liberty()
            + ChartColorTemplates.pastel()
            + [UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)]

        set.valueLinePart1OffsetPercentage = 0.8
        set.valueLinePart1Length = 0.2
        set.valueLinePart2Length = 0.4
        set.yValuePosition = .outsideSlice

        let data = PieChartData(dataSet: set)

        let pFormatter = NumberFormatter()
        pFormatter.numberStyle = .percent
        pFormatter.maximumFractionDigits = 1
        pFormatter.multiplier = 1
        pFormatter.percentSymbol = " %"
        data.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))
        data.setValueFont(.systemFont(ofSize: 11, weight: .light))
        data.setValueTextColor(colorScheme == .dark ? .white : .black)

        return data
    }
}
