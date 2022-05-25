//
//  MultipleBarChart.swift
//  SwiftUI-Charts-Demo
//
//  Created by TAISHIN MIYAMOTO on 2022/05/25.
//

import SwiftUI
import Charts

struct MultipleBarChart: UIViewRepresentable {
    func makeUIView(context: Context) -> BarChartView {
        let chartView = BarChartView()

        chartView.chartDescription?.enabled =  false

        chartView.pinchZoomEnabled = false
        chartView.drawBarShadowEnabled = false

        let l = chartView.legend
        l.horizontalAlignment = .right
        l.verticalAlignment = .top
        l.orientation = .vertical
        l.drawInside = true
        l.font = .systemFont(ofSize: 8, weight: .light)
        l.yOffset = 10
        l.xOffset = 10
        l.yEntrySpace = 0

        let xAxis = chartView.xAxis
        xAxis.labelFont = .systemFont(ofSize: 10, weight: .light)
        xAxis.granularity = 1
        xAxis.centerAxisLabelsEnabled = true

        let leftAxisFormatter = NumberFormatter()
        leftAxisFormatter.maximumFractionDigits = 1

        let leftAxis = chartView.leftAxis
        leftAxis.labelFont = .systemFont(ofSize: 10, weight: .light)
        leftAxis.spaceTop = 0.35
        leftAxis.axisMinimum = 0

        chartView.rightAxis.enabled = false

        chartView.data = setDataCount(7, range: 100)

        chartView.animate(yAxisDuration: 2.5)

        return chartView
    }
    func updateUIView(_ uiView: BarChartView, context: Context) {
    }

    func setDataCount(_ count: Int, range: Double) -> BarChartData {
        let groupSpace = 0.08
        let barSpace = 0.03
        let barWidth = 0.2
        // (0.2 + 0.03) * 4 + 0.08 = 1.00 -> interval per "group"

        let randomMultiplier = range * 100000
        let groupCount = count + 1
        let startYear = 1980
        let endYear = startYear + groupCount

        let block: (Int) -> BarChartDataEntry = { (i) -> BarChartDataEntry in
            return BarChartDataEntry(
                x: Double(i), y: Double(arc4random_uniform(UInt32(randomMultiplier)))
            )
        }
        let yVals1 = (startYear ..< endYear).map(block)
        let yVals2 = (startYear ..< endYear).map(block)
        let yVals3 = (startYear ..< endYear).map(block)
        let yVals4 = (startYear ..< endYear).map(block)

        let set1 = BarChartDataSet(entries: yVals1, label: "Company A")
        set1.setColor(UIColor(red: 104/255, green: 241/255, blue: 175/255, alpha: 1))

        let set2 = BarChartDataSet(entries: yVals2, label: "Company B")
        set2.setColor(UIColor(red: 164/255, green: 228/255, blue: 251/255, alpha: 1))

        let set3 = BarChartDataSet(entries: yVals3, label: "Company C")
        set3.setColor(UIColor(red: 242/255, green: 247/255, blue: 158/255, alpha: 1))

        let set4 = BarChartDataSet(entries: yVals4, label: "Company D")
        set4.setColor(UIColor(red: 255/255, green: 102/255, blue: 0/255, alpha: 1))

        let data: BarChartData = BarChartData(dataSets: [set1, set2, set3, set4])
        data.setValueFont(.systemFont(ofSize: 10, weight: .light))

        // specify the width each bar should have
        data.barWidth = barWidth

        data.groupBars(fromX: Double(startYear), groupSpace: groupSpace, barSpace: barSpace)

        return data
    }
}
