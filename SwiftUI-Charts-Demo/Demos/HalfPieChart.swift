//
//  HalfPieChart.swift
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

struct HalfPieChart: UIViewRepresentable {
    func makeUIView(context: Context) -> PieChartView {
        let chartView = PieChartView()

        chartView.holeColor = .white
        chartView.transparentCircleColor = NSUIColor.white.withAlphaComponent(0.43)
        chartView.holeRadiusPercent = 0.58
        chartView.rotationEnabled = false
        chartView.highlightPerTapEnabled = true

        chartView.maxAngle = 180 // Half chart
        chartView.rotationAngle = 180 // Rotate to make the half on the upper side
        chartView.centerTextOffset = CGPoint(x: 0, y: -20)

        let l = chartView.legend
        l.horizontalAlignment = .center
        l.verticalAlignment = .top
        l.orientation = .horizontal
        l.drawInside = false
        l.xEntrySpace = 7
        l.yEntrySpace = 0
        l.yOffset = 0

        chartView.holeColor = .clear
        chartView.entryLabelColor = .white
        chartView.entryLabelFont = UIFont(name:"HelveticaNeue-Light", size:12)!

        chartView.data = setDataCount(4, range: 100)

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
        set.sliceSpace = 3
        set.selectionShift = 5
        set.colors = ChartColorTemplates.material()

        let data = PieChartData(dataSet: set)

        let pFormatter = NumberFormatter()
        pFormatter.numberStyle = .percent
        pFormatter.maximumFractionDigits = 1
        pFormatter.multiplier = 1
        pFormatter.percentSymbol = " %"
        data.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))

        data.setValueFont(UIFont(name: "HelveticaNeue-Light", size: 11)!)
        data.setValueTextColor(.white)

        return data
    }
}
