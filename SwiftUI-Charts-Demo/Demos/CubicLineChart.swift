//
//  CubicLineChart.swift
//  SwiftUI-Charts-Demo
//
//  Created by TAISHIN MIYAMOTO on 2022/05/25.
//

import SwiftUI
import Charts

struct CubicLineChart: UIViewRepresentable {
    func makeUIView(context: Context) -> LineChartView {
        let chartView = LineChartView()

        chartView.setViewPortOffsets(left: 0, top: 20, right: 0, bottom: 0)
        chartView.backgroundColor = UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)

        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.pinchZoomEnabled = false
        chartView.maxHighlightDistance = 300

        chartView.xAxis.enabled = false

        let yAxis = chartView.leftAxis
        yAxis.labelFont = UIFont(name: "HelveticaNeue-Light", size:12)!
        yAxis.setLabelCount(6, force: false)
        yAxis.labelTextColor = .white
        yAxis.labelPosition = .insideChart
        yAxis.axisLineColor = .white

        chartView.rightAxis.enabled = false
        chartView.legend.enabled = false

        chartView.data = setDataCount(10, range: 50)

        chartView.animate(xAxisDuration: 2, yAxisDuration: 2)

        return chartView
    }

    func updateUIView(_ uiView: LineChartView, context: Context) {
    }

    func setDataCount(_ count: Int, range: Double) -> ChartData {
        let yVals1 = (0..<count).map { (i) -> ChartDataEntry in
            let mult = range + 1
            let val = Double(arc4random_uniform(UInt32(mult)) + 20)
            return ChartDataEntry(x: Double(i), y: val)
        }

        let set1 = LineChartDataSet(entries: yVals1, label: "DataSet 1")
        set1.mode = .cubicBezier
        set1.drawCirclesEnabled = false
        set1.lineWidth = 1.8
        set1.circleRadius = 4
        set1.setCircleColor(.white)
        set1.highlightColor = UIColor(red: 244/255, green: 117/255, blue: 117/255, alpha: 1)
        set1.fillColor = .white
        set1.fillAlpha = 1
        set1.drawHorizontalHighlightIndicatorEnabled = false

        let data = LineChartData(dataSet: set1)
        data.setValueFont(UIFont(name: "HelveticaNeue-Light", size: 9)!)
        data.setDrawValues(false)

        return data
    }
}
