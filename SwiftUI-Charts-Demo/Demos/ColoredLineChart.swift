//
//  ColoredLineChart.swift
//  SwiftUI-Charts-Demo
//
//  Created by TAISHIN MIYAMOTO on 2022/05/25.
//

import SwiftUI
import Charts

struct ColoredLineChart: UIViewRepresentable {
    var color: UIColor
    func makeUIView(context: Context) -> LineChartView {
        let chartViews = LineChartView()

        chartViews.backgroundColor = color

        chartViews.chartDescription?.enabled = false

        chartViews.dragEnabled = true
        chartViews.setScaleEnabled(true)
        chartViews.pinchZoomEnabled = false
        chartViews.setViewPortOffsets(left: 10, top: 0, right: 10, bottom: 0)

        chartViews.legend.enabled = false

        chartViews.leftAxis.enabled = false
        chartViews.leftAxis.spaceTop = 0.4
        chartViews.leftAxis.spaceBottom = 0.4
        chartViews.rightAxis.enabled = false
        chartViews.xAxis.enabled = false

        let data = setDataCount(36, range: 100)
        data.setValueFont(UIFont(name: "HelveticaNeue", size: 7)!)

        chartViews.data = data

        chartViews.animate(xAxisDuration: 2.5)

        return chartViews
    }

    func updateUIView(_ uiView: LineChartView, context: Context) {
    }

    func setDataCount(_ count: Int, range: UInt32) -> LineChartData {
        let yVals = (0..<count).map { i -> ChartDataEntry in
            let val = Double(arc4random_uniform(range)) + 3
            return ChartDataEntry(x: Double(i), y: val)
        }

        let set1 = LineChartDataSet(entries: yVals, label: "DataSet 1")

        set1.lineWidth = 1.75
        set1.circleRadius = 5.0
        set1.circleHoleRadius = 2.5
        set1.setColor(.white)
        set1.setCircleColor(.white)
        set1.highlightColor = .white
        set1.drawValuesEnabled = false

        return LineChartData(dataSet: set1)
    }
}
