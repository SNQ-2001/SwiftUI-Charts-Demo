//
//  CandleStickChart.swift
//  SwiftUI-Charts-Demo
//
//  Created by TAISHIN MIYAMOTO on 2022/05/25.
//

import SwiftUI
import Charts

struct CandleStickChart: UIViewRepresentable {
    func makeUIView(context: Context) -> CandleStickChartView {
        let chartView = CandleStickChartView()

        chartView.chartDescription?.enabled = false

        chartView.dragEnabled = false
        chartView.setScaleEnabled(true)
        chartView.maxVisibleCount = 200
        chartView.pinchZoomEnabled = true

        chartView.legend.horizontalAlignment = .right
        chartView.legend.verticalAlignment = .top
        chartView.legend.orientation = .vertical
        chartView.legend.drawInside = false
        chartView.legend.font = UIFont(name: "HelveticaNeue-Light", size: 10)!

        chartView.leftAxis.labelFont = UIFont(name: "HelveticaNeue-Light", size: 10)!
        chartView.leftAxis.spaceTop = 0.3
        chartView.leftAxis.spaceBottom = 0.3
        chartView.leftAxis.axisMinimum = 0

        chartView.rightAxis.enabled = false

        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.labelFont = UIFont(name: "HelveticaNeue-Light", size: 10)!

        let l = chartView.legend
        l.horizontalAlignment = .left
        l.verticalAlignment = .bottom
        l.orientation = .horizontal
        l.drawInside = false

        chartView.data = setDataCount(10, range: 50)

        return chartView
    }
    func updateUIView(_ uiView: CandleStickChartView, context: Context) {
    }

    func setDataCount(_ count: Int, range: Double) -> CandleChartData {
        let yVals1 = (0..<count).map { (i) -> CandleChartDataEntry in
            let mult = range + 1
            let val = Double(Double(arc4random_uniform(40)) + mult)
            let high = Double(arc4random_uniform(9) + 8)
            let low = Double(arc4random_uniform(9) + 8)
            let open = Double(arc4random_uniform(6) + 1)
            let close = Double(arc4random_uniform(6) + 1)
            let even = i % 2 == 0

            return CandleChartDataEntry(x: Double(i), shadowH: val + high, shadowL: val - low, open: even ? val + open : val - open, close: even ? val - close : val + close, icon: UIImage(named: "icon")!)
        }

        let set1 = CandleChartDataSet(entries: yVals1, label: "Data Set")
        set1.axisDependency = .left
        set1.setColor(UIColor(white: 80/255, alpha: 1))
        set1.drawIconsEnabled = false
        set1.shadowColor = .darkGray
        set1.shadowWidth = 0.7
        set1.decreasingColor = .red
        set1.decreasingFilled = true
        set1.increasingColor = UIColor(red: 122/255, green: 242/255, blue: 84/255, alpha: 1)
        set1.increasingFilled = false
        set1.neutralColor = .blue

        let data = CandleChartData(dataSet: set1)

        return data
    }
}
