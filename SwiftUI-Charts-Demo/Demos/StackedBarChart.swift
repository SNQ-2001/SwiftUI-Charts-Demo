//
//  StackedBarChart.swift
//  SwiftUI-Charts-Demo
//
//  Created by TAISHIN MIYAMOTO on 2022/05/25.
//

import SwiftUI
import Charts

struct StackedBarChart: UIViewRepresentable {
    var formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 1
        formatter.negativeSuffix = " $"
        formatter.positiveSuffix = " $"

        return formatter
    }()

    func makeUIView(context: Context) -> BarChartView {
        let chartView = BarChartView()

        chartView.chartDescription?.enabled = false

        chartView.maxVisibleCount = 40
        chartView.drawBarShadowEnabled = false
        chartView.drawValueAboveBarEnabled = false
        chartView.highlightFullBarEnabled = false

        let leftAxis = chartView.leftAxis
        leftAxis.valueFormatter = DefaultAxisValueFormatter(formatter: self.formatter)
        leftAxis.axisMinimum = 0

        chartView.rightAxis.enabled = false

        let xAxis = chartView.xAxis
        xAxis.labelPosition = .top

        let l = chartView.legend
        l.horizontalAlignment = .right
        l.verticalAlignment = .bottom
        l.orientation = .horizontal
        l.drawInside = false
        l.form = .square
        l.formToTextSpace = 4
        l.xEntrySpace = 6

        chartView.fitBars = true

        chartView.data = setDataCount(12, range: 100)

        chartView.animate(yAxisDuration: 3.0)

        return chartView
    }
    func updateUIView(_ uiView: BarChartView, context: Context) {
    }

    func setDataCount(_ count: Int, range: UInt32) -> BarChartData {
        let yVals = (0..<count).map { (i) -> BarChartDataEntry in
            let mult = range + 1
            let val1 = Double(arc4random_uniform(mult) + mult / 3)
            let val2 = Double(arc4random_uniform(mult) + mult / 3)
            let val3 = Double(arc4random_uniform(mult) + mult / 3)

            return BarChartDataEntry(x: Double(i), yValues: [val1, val2, val3], icon: #imageLiteral(resourceName: "icon"))
        }

        let set = BarChartDataSet(entries: yVals, label: "Statistics Vienna 2014")
        set.drawIconsEnabled = false
        set.colors = [ChartColorTemplates.material()[0], ChartColorTemplates.material()[1], ChartColorTemplates.material()[2]]
        set.stackLabels = ["Births", "Divorces", "Marriages"]

        let data = BarChartData(dataSet: set)
        data.setValueFont(.systemFont(ofSize: 7, weight: .light))
        data.setValueFormatter(DefaultValueFormatter(formatter: formatter))
        data.setValueTextColor(.white)

        return data
    }
}
