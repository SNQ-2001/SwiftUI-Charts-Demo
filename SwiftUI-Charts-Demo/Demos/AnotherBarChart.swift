//
//  AnotherBarChart.swift
//  SwiftUI-Charts-Demo
//
//  Created by TAISHIN MIYAMOTO on 2022/05/25.
//

import SwiftUI
import Charts

struct AnotherBarChart: UIViewRepresentable {
    func makeUIView(context: Context) -> BarChartView {
        let chartView = BarChartView()

        chartView.chartDescription?.enabled = false
        chartView.maxVisibleCount = 60
        chartView.pinchZoomEnabled = false
        chartView.drawBarShadowEnabled = false

        let xAxis = chartView.xAxis
        xAxis.labelPosition = .bottom

        chartView.legend.enabled = false

        chartView.data = setDataCount(10, range: 100)

        chartView.animate(yAxisDuration: 3.0)

        return chartView
    }
    func updateUIView(_ uiView: BarChartView, context: Context) {
    }

    func setDataCount(_ count: Int, range: Double) -> BarChartData {
        let yVals = (0..<count).map { (i) -> BarChartDataEntry in
            let mult = range + 1
            let val = Double(arc4random_uniform(UInt32(mult))) + mult/3
            return BarChartDataEntry(x: Double(i), y: val)
        }

        var set1: BarChartDataSet! = nil
        set1 = BarChartDataSet(entries: yVals, label: "Data Set")
        set1.colors = ChartColorTemplates.vordiplom()
        set1.drawValuesEnabled = false

        let data = BarChartData(dataSet: set1)

        return data
    }
}
