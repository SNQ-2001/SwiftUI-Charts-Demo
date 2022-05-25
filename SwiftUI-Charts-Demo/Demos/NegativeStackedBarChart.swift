//
//  NegativeStackedBarChart.swift
//  SwiftUI-Charts-Demo
//
//  Created by TAISHIN MIYAMOTO on 2022/05/25.
//

import SwiftUI
import Charts

struct NegativeStackedBarChart: UIViewRepresentable {
    var customFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.negativePrefix = ""
        formatter.positiveSuffix = "m"
        formatter.negativeSuffix = "m"
        formatter.minimumSignificantDigits = 1
        formatter.minimumFractionDigits = 1
        return formatter
    }()

    func makeUIView(context: Context) -> HorizontalBarChartView {
        let chartView = HorizontalBarChartView()

        chartView.chartDescription?.enabled = false

        chartView.drawBarShadowEnabled = false
        chartView.drawValueAboveBarEnabled = true

        chartView.leftAxis.enabled = false
        let rightAxis = chartView.rightAxis
        rightAxis.axisMaximum = 25
        rightAxis.axisMinimum = -25
        rightAxis.drawZeroLineEnabled = true
        rightAxis.labelCount = 7
        rightAxis.valueFormatter = DefaultAxisValueFormatter(formatter: customFormatter)
        rightAxis.labelFont = .systemFont(ofSize: 9)

        let xAxis = chartView.xAxis
        xAxis.labelPosition = .bothSided
        xAxis.drawAxisLineEnabled = false
        xAxis.axisMinimum = 0
        xAxis.axisMaximum = 110
        xAxis.centerAxisLabelsEnabled = true
        xAxis.labelCount = 12
        xAxis.granularity = 10
        xAxis.labelFont = .systemFont(ofSize: 9)

        let l = chartView.legend
        l.horizontalAlignment = .right
        l.verticalAlignment = .bottom
        l.orientation = .horizontal
        l.formSize = 8
        l.formToTextSpace = 8
        l.xEntrySpace = 6

        chartView.data = setDataCount()

        chartView.animate(yAxisDuration: 3.0)

        return chartView
    }
    func updateUIView(_ uiView: HorizontalBarChartView, context: Context) {
    }

    func setDataCount() -> BarChartData {
        let yVals = [
            BarChartDataEntry(x: 5, yValues: [-10, 10]),
            BarChartDataEntry(x: 15, yValues: [-12, 13]),
            BarChartDataEntry(x: 25, yValues: [-15, 15]),
            BarChartDataEntry(x: 35, yValues: [-17, 17]),
            BarChartDataEntry(x: 45, yValues: [-19, 120]),
            BarChartDataEntry(x: 55, yValues: [-19, 19]),
            BarChartDataEntry(x: 65, yValues: [-16, 16]),
            BarChartDataEntry(x: 75, yValues: [-13, 14]),
            BarChartDataEntry(x: 85, yValues: [-10, 11]),
            BarChartDataEntry(x: 95, yValues: [-5, 6]),
            BarChartDataEntry(x: 105, yValues: [-1, 2])
        ]

        let set = BarChartDataSet(entries: yVals, label: "Age Distribution")
        set.drawIconsEnabled = false
        set.valueFormatter = DefaultValueFormatter(formatter: customFormatter)
        set.valueFont = .systemFont(ofSize: 7)
        set.axisDependency = .right
        set.colors = [UIColor(red: 67/255, green: 67/255, blue: 72/255, alpha: 1),
                      UIColor(red: 124/255, green: 181/255, blue: 236/255, alpha: 1)
        ]
        set.stackLabels = ["Men", "Women"]

        let data = BarChartData(dataSet: set)
        data.barWidth = 8.5

        return data
    }
}
