//
//  MultipleLinesChart.swift
//  SwiftUI-Charts-Demo
//
//  Created by TAISHIN MIYAMOTO on 2022/05/25.
//

import SwiftUI
import Charts

struct MultipleLinesChart: UIViewRepresentable {
    func makeUIView(context: Context) -> LineChartView {
        let chartView = LineChartView()

        chartView.chartDescription?.enabled = false

        chartView.leftAxis.enabled = false
        chartView.rightAxis.drawAxisLineEnabled = false
        chartView.xAxis.drawAxisLineEnabled = false

        chartView.drawBordersEnabled = false
        chartView.setScaleEnabled(true)

        let l = chartView.legend
        l.horizontalAlignment = .left
        l.verticalAlignment = .bottom
        l.orientation = .horizontal
        l.drawInside = false

        chartView.data = setDataCount(7, range: 100)

        chartView.animate(xAxisDuration: 2.5)

        return chartView
    }
    func updateUIView(_ uiView: LineChartView, context: Context) {
    }

    func setDataCount(_ count: Int, range: Double) -> LineChartData {
        let colors = ChartColorTemplates.vordiplom()[0...2]

        let block: (Int) -> ChartDataEntry = { (i) -> ChartDataEntry in
            let val = Double(arc4random_uniform(UInt32(range)) + 3)
            return ChartDataEntry(x: Double(i), y: val)
        }
        let dataSets = (0..<3).map { i -> LineChartDataSet in
            let yVals = (0..<count).map(block)
            let set = LineChartDataSet(entries: yVals, label: "DataSet \(i)")
            set.lineWidth = 2.5
            set.circleRadius = 4
            set.circleHoleRadius = 2
            let color = colors[i % colors.count]
            set.setColor(color)
            set.setCircleColor(color)

            return set
        }

        dataSets[0].lineDashLengths = [5, 5]
        dataSets[0].colors = ChartColorTemplates.vordiplom()
        dataSets[0].circleColors = ChartColorTemplates.vordiplom()

        let data = LineChartData(dataSets: dataSets)
        data.setValueFont(.systemFont(ofSize: 7, weight: .light))

        return data
    }
}
