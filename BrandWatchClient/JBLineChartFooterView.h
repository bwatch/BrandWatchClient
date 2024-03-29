//
//  JBLineChartFooterView.h
//  BrandWatchClient
//
//  Created by Niaz Jalal on 10/25/14.
//  Copyright (c) 2014 BrandWatch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JBLineChartFooterView : UIView

@property (nonatomic, strong) UIColor *footerSeparatorColor; // footer separator (default = white)
@property (nonatomic, assign) NSInteger sectionCount; // # of notches (default = 2 on each edge)
@property (nonatomic, readonly) UILabel *leftLabel;
@property (nonatomic, readonly) UILabel *rightLabel;

@end
