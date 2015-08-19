//
//  ViewController.m
//  MKCustomSlider
//
//  Created by moyekong on 15/8/13.
//  Copyright (c) 2015年 wiwide. All rights reserved.
//

#import "ViewController.h"
#import "MKFlightPeriodTime.h" // view

@interface ViewController ()

@property (nonatomic, strong) MKFlightPeriodTime *flightPeriodTimeView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupPeriodTime];
}

- (void)setupPeriodTime {
    if (_flightPeriodTimeView) {
        return;
    }
    CGFloat flightPeriodViewH = 128.0;
    CGFloat flightTopViewSpace = self.view.bounds.size.height - flightPeriodViewH;
    _flightPeriodTimeView = [[MKFlightPeriodTime alloc] initWithFrame:CGRectMake(0, flightTopViewSpace, self.view.bounds.size.width, flightPeriodViewH)];
    [self.view addSubview:_flightPeriodTimeView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
