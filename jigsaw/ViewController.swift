//
//  ViewController.swift
//  jigsaw
//
//  Created by jiangfeng on 15/10/9.
//  Copyright © 2015年 jiangfeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    // 欢迎页面
    var welcomeScrollView = UIScrollView()
    
    // 欢迎页面数
    let welcomePageNum: Int = 3
    
    // 翻页的圆点
    var welcomePageControl = UIPageControl()
    
    // 欢迎页面的进入游戏按钮
    var welcomeButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 翻页圆点的位置
        welcomePageControl.center = CGPointMake(self.view.frame.width / 2, self.view.frame.height - 30)
        
        // 圆点高亮颜色
        welcomePageControl.currentPageIndicatorTintColor = UIColor.blueColor()
        
        // 圆点的普通颜色
        welcomePageControl.pageIndicatorTintColor = UIColor.grayColor()
        
        // 圆点个数
        welcomePageControl.numberOfPages = welcomePageNum
        
        // 给翻页绑定滚动事件
        welcomePageControl.addTarget(self, action: "scrollViewDidEndDecelerating", forControlEvents: .ValueChanged)
        
        
        welcomeScrollView.frame = self.view.bounds
        
        // 欢迎页的屏幕宽度数
        welcomeScrollView.contentSize = CGSizeMake(CGFloat(welcomePageNum) * self.view.frame.width, 0)
        
        // 可以滚屏
        welcomeScrollView.pagingEnabled = true
        
        // 弹簧效果
        welcomeScrollView.bounces = false
        
        // 不显示滚动条
        welcomeScrollView.showsHorizontalScrollIndicator = false
        
        welcomeScrollView.delegate = self
        
        self.view.addSubview(welcomeScrollView)
        
        // 依次放入图片
        for(var i = 0; i < welcomePageNum; i++) {
            let image = UIImage(named: "00\(i+1).png")
            let imageView = UIImageView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height))
            imageView.image = image
            var frame = imageView.frame
            frame.origin.x = CGFloat(i) * frame.size.width
            imageView.frame = frame
            welcomeScrollView.addSubview(imageView)
        }
        
        // 放入页码
        self.view.addSubview(welcomePageControl)
        
    }
    
    // 滑动页面事件
    func scrollViewDidEndDecelerating(scrollView: UIScrollView){
        
        // 根据横坐标计算当前页码
        let index = Int(scrollView.contentOffset.x / self.view.frame.size.width)
        
        welcomePageControl.currentPage = index
        
        let lastPageNum = welcomePageNum - 1
        
        // 当滚动到了最后一页
        if index == lastPageNum {
            self.welcomeButton.frame = CGRectMake(self.view.frame.width * CGFloat(lastPageNum), self.view.frame.height, self.view.frame.width, 50)
            self.welcomeButton.setTitle("点击开始", forState: .Normal)
            self.welcomeButton.titleLabel?.font = UIFont.systemFontOfSize(20)
            self.welcomeButton.setTitleColor(UIColor.grayColor(), forState: .Highlighted)
            self.welcomeButton.backgroundColor = UIColor.orangeColor()
            self.welcomeButton.alpha = 0
            
            self.welcomeButton.addTarget(self, action: "buttonClick:", forControlEvents: .TouchUpInside)
            
            // 按钮显示动画
            UIView.animateWithDuration(1.5, delay: 0.5, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                self.welcomeButton.frame = CGRectMake(self.view.frame.width * CGFloat(lastPageNum), self.view.frame.height - 100, self.view.frame.width, 50)
                self.welcomeButton.alpha = 1
                self.welcomeScrollView.addSubview(self.welcomeButton)
                }, completion: nil)
        }
        
    
    }
    
    
    func buttonClick(button: UIButton) {
        
        let listView = ListViewController()
        
//        self.parentViewController(listView, animated: true, completion: nil)
        
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        let second = sb.instantiateViewControllerWithIdentifier("second")
        self.presentViewController(listView, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

