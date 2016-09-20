//
//  ViewController.m
//  AGMovieIJKPlayer
//
//  Created by 吴书敏 on 16/9/19.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "ViewController.h"
#import <IJKMediaFramework/IJKMediaFramework.h>
#import "AGMovieViewController.h"

@interface ViewController ()

@property (nonatomic, strong) AGMovieViewController *agMVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.agMVC = [[AGMovieViewController alloc] init];
    _agMVC.aid = @"1025020";
    [self.view addSubview:_agMVC.view];
    [self addChildViewController:_agMVC];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
