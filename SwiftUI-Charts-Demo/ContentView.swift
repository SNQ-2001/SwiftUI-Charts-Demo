//
//  ContentView.swift
//  SwiftUI-Charts-Demo
//
//  Created by TAISHIN MIYAMOTO on 2022/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Group {
                    NavigationLink("Line Chart") {
                        LineChart1()
                    }
                    NavigationLink("Line Chart (Dual YAxis)") {
                        LineChart2()
                    }
                    NavigationLink("Bar Chart") {
                        BarChart()
                    }
                    NavigationLink("Horizontal Bar Chart") {
                        HorizontalBarChart()
                    }
                    NavigationLink("Combined Chart") {
                        CombinedChart()
                    }
                    NavigationLink("Pie Chart") {
                        PieChart()
                    }
                    NavigationLink("Pie Chart with value lines") {
                        PiePolylineChart()
                    }
                    NavigationLink("Scatter Chart") {
                        ScatterChart()
                    }
                    NavigationLink("Bubble Chart") {
                        BubbleChart()
                    }
                    NavigationLink("Stacked Bar Chart") {
                        StackedBarChart()
                    }
                }
                Group {
                    NavigationLink("Stacked Bar Chart Negative") {
                        NegativeStackedBarChart()
                    }
                    NavigationLink("Another Bar Chart") {
                        AnotherBarChart()
                    }
                    NavigationLink("Multiple Lines Chart") {
                        MultipleLinesChart()
                    }
                    NavigationLink("Multiple Bars Chart") {
                        MultipleBarChart()
                    }
                    NavigationLink("Candle Stick Chart") {
                        CandleStickChart()
                    }
                    NavigationLink("Cubic Line Chart") {
                        CubicLineChart()
                    }
                    NavigationLink("Radar Chart") {
                        RadarChart()
                    }
                    NavigationLink("Colored Line Chart") {
                        VStack(spacing: 0) {
                            ColoredLineChart(color: UIColor(red: 137/255, green: 230/255, blue: 81/255, alpha: 1))
                            ColoredLineChart(color: UIColor(red: 240/255, green: 240/255, blue: 30/255, alpha: 1))
                            ColoredLineChart(color: UIColor(red: 89/255, green: 199/255, blue: 250/255, alpha: 1))
                            ColoredLineChart(color: UIColor(red: 250/255, green: 104/255, blue: 104/255, alpha: 1))
                        }
                    }
                    NavigationLink("Sinus Bar Chart") {
                        SinusBarChart()
                    }
                }
                Group {
                    NavigationLink("BarChart positive / negative") {
                        PositiveNegativeBarChart()
                    }
                    NavigationLink("Time Line Chart") {
                        LineChartTime()
                    }
                    NavigationLink("Filled Line Chart") {
                        LineChartFilled()
                    }
                    NavigationLink("Half Pie Chart") {
                        HalfPieChart()
                    }
                }
            }
            .navigationTitle("Charts Demonstration for SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
