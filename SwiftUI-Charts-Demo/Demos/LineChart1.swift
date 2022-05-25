//
//  LineChart.swift
//  SwiftUI-Charts-Demo
//
//  Created by TAISHIN MIYAMOTO on 2022/05/25.
//

import SwiftUI
import Charts

struct LineChart1: UIViewRepresentable {
    @Environment(\.colorScheme) var colorScheme
    func makeUIView(context: Context) -> LineChartView {
        let chartView = LineChartView()

        chartView.chartDescription?.enabled = false
        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.pinchZoomEnabled = true

        let llXAxis = ChartLimitLine(limit: 10, label: "Index 10")
        llXAxis.lineWidth = 4
        llXAxis.lineDashLengths = [10, 10, 0]
        llXAxis.labelPosition = .bottomRight
        llXAxis.valueFont = .systemFont(ofSize: 10)

        chartView.xAxis.gridLineDashLengths = [10, 10]
        chartView.xAxis.gridLineDashPhase = 0

        let ll1 = ChartLimitLine(limit: 150, label: "Upper Limit")
        ll1.lineWidth = 4
        ll1.lineDashLengths = [5, 5]
        ll1.labelPosition = .topRight
        ll1.valueFont = .systemFont(ofSize: 10)

        let ll2 = ChartLimitLine(limit: -30, label: "Lower Limit")
        ll2.lineWidth = 4
        ll2.lineDashLengths = [5,5]
        ll2.labelPosition = .bottomRight
        ll2.valueFont = .systemFont(ofSize: 10)

        let leftAxis = chartView.leftAxis
        leftAxis.removeAllLimitLines()
        leftAxis.addLimitLine(ll1)
        leftAxis.addLimitLine(ll2)
        leftAxis.axisMaximum = 200
        leftAxis.axisMinimum = -50
        leftAxis.gridLineDashLengths = [5, 5]
        leftAxis.drawLimitLinesBehindDataEnabled = true

        chartView.rightAxis.enabled = false

        chartView.legend.form = .line

        chartView.data = setDataCount(40, range: 100)

        chartView.animate(xAxisDuration: 2.5)

        return chartView
    }
    func updateUIView(_ uiView: LineChartView, context: Context) {
    }
    func setDataCount(_ count: Int, range: UInt32) -> LineChartData {
        let values = (0..<count).map { (i) -> ChartDataEntry in
            let val = Double(arc4random_uniform(range) + 3)
            return ChartDataEntry(x: Double(i), y: val)
        }

        let set1 = LineChartDataSet(entries: values, label: "DataSet 1")
        set1.drawIconsEnabled = false

        setup(set1)

        let gradientColors = [
            ChartColorTemplates.colorFromString("#00ff0000").cgColor,
            ChartColorTemplates.colorFromString("#ffff0000").cgColor
        ]

        let gradient = CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil)!

        set1.fillAlpha = 1
        set1.fill = Fill(linearGradient: gradient, angle: 90)

        set1.drawFilledEnabled = true

        let data = LineChartData(dataSet: set1)

        return data
    }
    private func setup(_ dataSet: LineChartDataSet) {
        if dataSet.isDrawFilledEnabled {
            dataSet.lineDashLengths = nil
            dataSet.highlightLineDashLengths = nil
            dataSet.setColors(colorScheme == .dark ? .white : .black, .red, colorScheme == .dark ? .black : .white)
            dataSet.setCircleColor(colorScheme == .dark ? .white : .black)
            dataSet.lineWidth = 1
            dataSet.circleRadius = 3
            dataSet.drawCircleHoleEnabled = false
            dataSet.valueFont = .systemFont(ofSize: 9)
            dataSet.formLineDashLengths = nil
            dataSet.formLineWidth = 1
            dataSet.formSize = 15
        } else {
            dataSet.lineDashLengths = [5, 2.5]
            dataSet.highlightLineDashLengths = [5, 2.5]
            dataSet.setColor(colorScheme == .dark ? .white : .black)
            dataSet.setCircleColor(colorScheme == .dark ? .white : .black)
            dataSet.lineWidth = 1
            dataSet.circleRadius = 3
            dataSet.drawCircleHoleEnabled = false
            dataSet.valueFont = .systemFont(ofSize: 9)
            dataSet.formLineDashLengths = [5, 2.5]
            dataSet.formLineWidth = 1
            dataSet.formSize = 15
        }
    }
}
