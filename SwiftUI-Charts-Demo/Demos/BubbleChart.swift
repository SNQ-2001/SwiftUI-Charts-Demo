//
//  BubbleChart.swift
//  SwiftUI-Charts-Demo
//
//  Created by TAISHIN MIYAMOTO on 2022/05/25.
//

import SwiftUI
import Charts

struct BubbleChart: UIViewRepresentable {
    func makeUIView(context: Context) -> BubbleChartView {
        let chartView = BubbleChartView()

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
        l.font = .systemFont(ofSize: 10, weight: .light)
        l.xOffset = 5

        chartView.data = setDataCount(10, range: 50)

        return chartView
    }
    func updateUIView(_ uiView: BubbleChartView, context: Context) {
    }

    func setDataCount(_ count: Int, range: UInt32) -> BubbleChartData {
        let yVals1 = (0..<count).map { (i) -> BubbleChartDataEntry in
            let val = Double(arc4random_uniform(range))
            let size = CGFloat(arc4random_uniform(range))
            return BubbleChartDataEntry(x: Double(i), y: val, size: size, icon: UIImage(named: "icon"))
        }
        let yVals2 = (0..<count).map { (i) -> BubbleChartDataEntry in
            let val = Double(arc4random_uniform(range))
            let size = CGFloat(arc4random_uniform(range))
            return BubbleChartDataEntry(x: Double(i), y: val, size: size, icon: UIImage(named: "icon"))
        }
        let yVals3 = (0..<count).map { (i) -> BubbleChartDataEntry in
            let val = Double(arc4random_uniform(range))
            let size = CGFloat(arc4random_uniform(range))
            return BubbleChartDataEntry(x: Double(i), y: val, size: size)
        }

        let set1 = BubbleChartDataSet(entries: yVals1, label: "DS 1")
        set1.drawIconsEnabled = false
        set1.setColor(ChartColorTemplates.colorful()[0], alpha: 0.5)
        set1.drawValuesEnabled = true

        let set2 = BubbleChartDataSet(entries: yVals2, label: "DS 2")
        set2.drawIconsEnabled = false
        set2.iconsOffset = CGPoint(x: 0, y: 15)
        set2.setColor(ChartColorTemplates.colorful()[1], alpha: 0.5)
        set2.drawValuesEnabled = true

        let set3 = BubbleChartDataSet(entries: yVals3, label: "DS 3")
        set3.setColor(ChartColorTemplates.colorful()[2], alpha: 0.5)
        set3.drawValuesEnabled = true

        let data = BubbleChartData(dataSets: [set1, set2, set3])
        data.setDrawValues(false)
        data.setValueFont(UIFont(name: "HelveticaNeue-Light", size: 7)!)
        data.setHighlightCircleWidth(1.5)
        data.setValueTextColor(.white)

        return data
    }
}
