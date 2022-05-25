//
//  PositiveNegativeBarChart.swift
//  SwiftUI-Charts-Demo
//
//  Created by TAISHIN MIYAMOTO on 2022/05/25.
//

import SwiftUI
import Charts

struct PositiveNegativeBarChart: UIViewRepresentable {
    func makeUIView(context: Context) -> BarChartView {
        let chartView = BarChartView()

        chartView.setExtraOffsets(left: 70, top: -30, right: 70, bottom: 10)

        chartView.drawBarShadowEnabled = false
        chartView.drawValueAboveBarEnabled = true

        chartView.chartDescription?.enabled = false

        chartView.rightAxis.enabled = false

        let xAxis = chartView.xAxis
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .systemFont(ofSize: 13)
        xAxis.drawAxisLineEnabled = false
        xAxis.labelTextColor = .lightGray
        xAxis.labelCount = 5
        xAxis.centerAxisLabelsEnabled = true
        xAxis.granularity = 1

        let leftAxis = chartView.leftAxis
        leftAxis.drawLabelsEnabled = false
        leftAxis.spaceTop = 0.25
        leftAxis.spaceBottom = 0.25
        leftAxis.drawAxisLineEnabled = false
        leftAxis.drawZeroLineEnabled = true
        leftAxis.zeroLineColor = .gray
        leftAxis.zeroLineWidth = 0.7

        chartView.data = setDataCount()

        chartView.animate(yAxisDuration: 2.5)

        return chartView
    }

    func updateUIView(_ uiView: BarChartView, context: Context) {
    }

    func setDataCount() -> BarChartData {
        let yVals = [
            BarChartDataEntry(x: 0, y: -224.1),
            BarChartDataEntry(x: 1, y: 238.5),
            BarChartDataEntry(x: 2, y: 1280.1),
            BarChartDataEntry(x: 3, y: -442.3),
            BarChartDataEntry(x: 4, y: -2280.1)
        ]

        let red = UIColor(red: 211/255, green: 74/255, blue: 88/255, alpha: 1)
        let green = UIColor(red: 110/255, green: 190/255, blue: 102/255, alpha: 1)
        let colors = yVals.map { (entry) -> NSUIColor in
            return entry.y > 0 ? red : green
        }

        let set = BarChartDataSet(entries: yVals, label: "Values")
        set.colors = colors
        set.valueColors = colors

        let data = BarChartData(dataSet: set)
        data.setValueFont(.systemFont(ofSize: 13))

        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 1
        data.setValueFormatter(DefaultValueFormatter(formatter: formatter))
        data.barWidth = 0.8

        return data
    }
}
