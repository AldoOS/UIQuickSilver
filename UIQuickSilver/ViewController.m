//
//  ViewController.m
//  UIQuickSilver
//
//  Created by harald bregu on 14/10/15.
//  Copyright © 2015 Harald. All rights reserved.
//

#import "ViewController.h"
#import "UIQuickSilver.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIQuickSilver *quickSilver;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.quickSilver.animate = YES;
    self.quickSilver.current = 20;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
