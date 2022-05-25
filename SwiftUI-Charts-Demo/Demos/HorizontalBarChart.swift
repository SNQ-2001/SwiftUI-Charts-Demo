//
//  HorizontalBarChart.swift
//  SwiftUI-Charts-Demo
//
//  Created by TAISHIN MIYAMOTO on 2022/05/25.
//

import SwiftUI
import Charts

struct HorizontalBarChart: UIViewRepresentable {
    func makeUIView(context: Context) -> HorizontalBarChartView {
        let chartView = HorizontalBarChartView()

        chartView.drawBarShadowEnabled = false
        chartView.drawValueAboveBarEnabled = true

        chartView.maxVisibleCount = 60

        let xAxis = chartView.xAxis
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .systemFont(ofSize: 10)
        xAxis.drawAxisLineEnabled = true
        xAxis.granularity = 10

        let leftAxis = chartView.leftAxis
        leftAxis.labelFont = .systemFont(ofSize: 10)
        leftAxis.drawAxisLineEnabled = true
        leftAxis.drawGridLinesEnabled = true
        leftAxis.axisMinimum = 0

        let rightAxis = chartView.rightAxis
        rightAxis.enabled = true
        rightAxis.labelFont = .systemFont(ofSize: 10)
        rightAxis.drawAxisLineEnabled = true
        rightAxis.axisMinimum = 0

        let l = chartView.legend
        l.horizontalAlignment = .left
        l.verticalAlignment = .bottom
        l.orientation = .horizontal
        l.drawInside = false
        l.form = .square
        l.formSize = 8
        l.font = UIFont(name: "HelveticaNeue-Light", size: 11)!
        l.xEntrySpace = 4

        chartView.fitBars = true

        chartView.data = setDataCount(12, range: 50)

        chartView.animate(yAxisDuration: 2.5)

        return chartView
    }
    func updateUIView(_ uiView: HorizontalBarChartView, context: Context) {
    }

    func setDataCount(_ count: Int, range: UInt32) -> BarChartData {
        let barWidth = 9.0
        let spaceForBar = 10.0

        let yVals = (0..<count).map { (i) -> BarChartDataEntry in
            let mult = range + 1
            let val = Double(arc4random_uniform(mult))
            return BarChartDataEntry(x: Double(i)*spaceForBar, y: val, icon: #imageLiteral(resourceName: "icon"))
        }

        let set1 = BarChartDataSet(entries: yVals, label: "DataSet")
        set1.drawIconsEnabled = false

        let data = BarChartData(dataSet: set1)
        data.setValueFont(UIFont(name:"HelveticaNeue-Light", size:10)!)
        data.barWidth = barWidth

        return data
    }
}
