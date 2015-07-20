//
//  ViewController.m
//  AutoLayoutDemo2
//
//  Created by LiuYihan on 15/7/4.
//  Copyright (c) 2015年 Xiaoxin. All rights reserved.
//

#import "RootViewController.h"


@interface RootViewController ()

@property (strong, nonatomic) UIButton *button1;
@property (strong, nonatomic) UIButton *button2;
@property (strong, nonatomic) UIButton *button3;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    self.button1 = [[UIButton alloc] init];
    self.button2 = [[UIButton alloc] init];
    self.button3 = [[UIButton alloc] init];
    
    self.button1.translatesAutoresizingMaskIntoConstraints = NO;
    self.button2.translatesAutoresizingMaskIntoConstraints = NO;
    self.button3.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.button1];
    [self.view addSubview:self.button2];
    [self.view addSubview:self.button3];
    
    [self.button1 setBackgroundColor:[UIColor redColor]];
    [self.button1 setTitle:@"Button1" forState:UIControlStateNormal];
    [self.button2 setBackgroundColor:[UIColor greenColor]];
    [self.button2 setTitle:@"Button2" forState:UIControlStateNormal];
    [self.button3 setBackgroundColor:[UIColor blueColor]];
    [self.button3 setTitle:@"Button3" forState:UIControlStateNormal];
//    [self configView1];
    [self configView2];
//    [self configView3];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)configView1{
    NSLayoutConstraint *constraint;
    
    
    constraint = [NSLayoutConstraint constraintWithItem:self.button1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0];
    [self.view addConstraint:constraint];
    constraint = [NSLayoutConstraint constraintWithItem:self.button1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.5 constant:0];
    [self.view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:self.button2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0];
    [self.view addConstraint:constraint];
    constraint = [NSLayoutConstraint constraintWithItem:self.button2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.5 constant:0];
    [self.view addConstraint:constraint];
    constraint = [NSLayoutConstraint constraintWithItem:self.button2 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:self.view.bounds.size.width/2];
    [self.view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:self.button3 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    [self.view addConstraint:constraint];
    constraint = [NSLayoutConstraint constraintWithItem:self.button3 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.5 constant:0];
    [self.view addConstraint:constraint];
    constraint = [NSLayoutConstraint constraintWithItem:self.button3 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:self.view.bounds.size.height/2];
    [self.view addConstraint:constraint];
    
}

- (void)configView2{

    NSDictionary *views = @{@"button1":self.button1,@"button2":self.button2,@"button3":self.button3};

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[button1]-[button3(button1)]-|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[button2(button1)]-[button3(button1)]-|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[button1(button1)]-[button2(button1)]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[button3]|" options:0 metrics:nil views:views]];
    
//    [self.button2 addTarget:self action:@selector(clickToRemove) forControlEvents:UIControlEventTouchDown];
}

- (void)configView3{
    int padding = 10;
    //view.translatesAutoresizingMaskIntoConstraints = NO; 会自动调用
    [self.button1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.greaterThanOrEqualTo(self.view.top).offset(padding);
        make.left.equalTo(self.view.left).offset(padding);
        make.right.equalTo(self.button2.left).offset(-padding);
        make.bottom.equalTo(self.button3.top).offset(-padding);
        
        make.width.equalTo(self.button2.width);
        make.height.equalTo(self.button2.height);
        make.height.equalTo(self.button3.height);
    }];
    
    [self.button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(padding);
        make.left.equalTo(self.button1.mas_right).offset(padding);
        make.right.equalTo(self.view.mas_right).offset(-padding);
        make.bottom.equalTo(self.button3.top).offset(-padding);
        
        make.width.equalTo(self.button1.width);
        make.height.equalTo(@[self.button1,self.button3]);
    }];
    
    [self.button3 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.button1.bottom).offset(padding);
        make.left.equalTo(self.view.left).offset(padding);
        make.right.equalTo(self.view.right).offset(-padding);
        make.bottom.equalTo(self.view.bottom).offset(-padding);
        
        make.height.equalTo(@[self.button1.height,self.button2.height]);
    }];
}

- (void) clickToRemove{
//    [self.button2 removeFromSuperview];
    NSDictionary *views = @{@"button1":self.button1,@"button2":self.button2,@"button3":self.button3};
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[button1]|" options:0 metrics:nil views:views]];
//    self.button2.hidden = true;
}

@end
