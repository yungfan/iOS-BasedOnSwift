//
//  ChartsViewController.swift
//  ThirdFrameworkUsage
//
//  Created by 杨帆 on 2019/12/30.
//  Copyright © 2019 杨帆. All rights reserved.
//

import Charts
import UIKit

class ChartsViewController: UIViewController {
    lazy var pieChartView: PieChartView = {
        let _pieChartView = PieChartView(frame: CGRect(x: 0, y: 88, width: self.view.bounds.size.width, height: self.view.bounds.size.height))

        _pieChartView.setExtraOffsets(left: 40, top: 10, right: 40, bottom: 30) // 设置这块饼的位置
        _pieChartView.drawHoleEnabled = true // 这个饼是空心的
        _pieChartView.holeRadiusPercent = 0.382 // 空心半径黄金比例
        _pieChartView.holeColor = UIColor.white // 空心颜色设置为白色
        _pieChartView.transparentCircleRadiusPercent = 0.5 // 半透明空心半径

        _pieChartView.drawCenterTextEnabled = true // 显示中心文本
        _pieChartView.centerText = "销售品类" // 设置中心文本,你也可以设置富文本`centerAttributedText`

        // 图例样式设置
        _pieChartView.legend.maxSizePercent = 1 // 图例的占比
        _pieChartView.legend.form = .circle // 图示：原、方、线
        _pieChartView.legend.formSize = 8 // 图示大小
        _pieChartView.legend.formToTextSpace = 4 // 文本间隔
        _pieChartView.legend.font = UIFont.systemFont(ofSize: 8)
        _pieChartView.legend.textColor = UIColor.gray
        _pieChartView.legend.horizontalAlignment = .left
        _pieChartView.legend.verticalAlignment = .top

        _pieChartView.animate(xAxisDuration: 1.0, yAxisDuration: 1.0, easingOption: .easeInBack)

        return _pieChartView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        view.addSubview(pieChartView)
        drawPieChartView()
    }

    func drawPieChartView() {
        let titles = ["图书类", "3C类", "母婴类", "箱包类", "户外类"]
        let yData = [5, 10, 25, 20, 30]
        var yVals = [PieChartDataEntry]()
        for i in 0 ..< titles.count {
            let entry = PieChartDataEntry(value: Double(yData[i]), label: titles[i])
            yVals.append(entry)
        }

        let dataSet = PieChartDataSet(entries: yVals, label: "")
        dataSet.colors = [UIColor.red, UIColor.yellow, UIColor.blue, UIColor.orange, UIColor.green]
        // 设置名称和数据的位置 都在内就没有折线了哦
        dataSet.xValuePosition = .insideSlice
        dataSet.yValuePosition = .outsideSlice
        dataSet.sliceSpace = 1 // 相邻块的距离
        dataSet.selectionShift = 8.88 // 选中放大半径
        // 指示折线样式
        dataSet.valueLinePart1OffsetPercentage = 0.8 // 折线中第一段起始位置相对于区块的偏移量, 数值越大, 折线距离区块越远
        dataSet.valueLinePart1Length = 0.8 // 折线中第一段长度占比
        dataSet.valueLinePart2Length = 0.4 // 折线中第二段长度最大占比
        dataSet.valueLineWidth = 1 // 折线的粗细
        dataSet.valueLineColor = UIColor.brown // 折线颜色

        let data = PieChartData(dataSets: [dataSet])

        data.setValueFont(UIFont.systemFont(ofSize: 10.0))
        data.setValueTextColor(UIColor.lightGray)
        pieChartView.data = data
    }
}
