//
//  ScatterChart.swift
//  SwiftUI-Charts-Demo
//
//  Created by TAISHIN MIYAMOTO on 2022/05/25.
//

import SwiftUI
import Charts

struct ScatterChart: UIViewRepresentable {
    func makeUIView(context: Context) -> ScatterChartView {
        let chartView = ScatterChartView()

        chartView.chartDescription?.enabled = false

        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.maxVisibleCount = 200
        chartView.pinchZoomEnabled = true

        let l = chartView.legend
        l.horizontalAlignment = .left
        l.verticalAlignment = .bottom
        l.orientation = .horizontal
        l.drawInside = false
        l.font = .systemFont(ofSize: 10, weight: .light)
        l.xOffset = 5

        let leftAxis = chartView.leftAxis
        leftAxis.labelFont = .systemFont(ofSize: 10, weight: .light)
        leftAxis.axisMinimum = 0

        chartView.rightAxis.enabled = false


        let xAxis = chartView.xAxis
        xAxis.labelFont = .systemFont(ofSize: 10, weight: .light)

        chartView.data = setDataCount(45, range: 100)

        return chartView
    }
    func updateUIView(_ uiView: ScatterChartView, context: Context) {
    }

    func setDataCount(_ count: Int, range: UInt32) -> ScatterChartData {
        let values1 = (0..<count).map { (i) -> ChartDataEntry in
            let val = Double(arc4random_uniform(range) + 3)
            return ChartDataEntry(x: Double(i), y: val)
        }
        let values2 = (0..<count).map { (i) -> ChartDataEntry in
            let val = Double(arc4random_uniform(range) + 3)
            return ChartDataEntry(x: Double(i) + 0.33, y: val)
        }
        let values3 = (0..<count).map { (i) -> ChartDataEntry in
            let val = Double(arc4random_uniform(range) + 3)
            return ChartDataEntry(x: Double(i) + 0.66, y: val)
        }


        let set1 = ScatterChartDataSet(entries: values1, label: "DS 1")
        set1.setScatterShape(.square)
        set1.setColor(ChartColorTemplates.colorful()[0])
        set1.scatterShapeSize = 8

        let set2 = ScatterChartDataSet(entries: values2, label: "DS 2")
        set2.setScatterShape(.circle)
        set2.scatterShapeHoleColor = ChartColorTemplates.colorful()[3]
        set2.scatterShapeHoleRadius = 3.5
        set2.setColor(ChartColorTemplates.colorful()[1])
        set2.scatterShapeSize = 8

        let set3 = ScatterChartDataSet(entries: values3, label: "DS 3")
        set3.setScatterShape(.cross)
        set3.setColor(ChartColorTemplates.colorful()[2])
        set3.scatterShapeSize = 8

        let data: ScatterChartData = ScatterChartData(dataSets: [set1, set2, set3])
        data.setValueFont(.systemFont(ofSize: 7, weight: .light))

        return data
    }
}
