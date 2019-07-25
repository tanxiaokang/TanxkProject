//
//  TXKCalendarViewController.m
//  TanxkProject
//
//  Created by tanxk on 2019/7/2330.
//  Copyright © 2019 tanxk. All rights reserved.
//

#import "TXKCalendarViewController.h"

@interface TXKCalendarViewController ()

@property (weak, nonatomic) IBOutlet UITextView *tv;
@property (weak, nonatomic) IBOutlet UIStepper *monthSteper;
@property (weak, nonatomic) IBOutlet UILabel *monthLabel;

@end

@implementation TXKCalendarViewController

- (void)monthSteper:(UIStepper *)stepper {
    self.monthLabel.text = [NSString stringWithFormat:@"%0.f",stepper.value];
    self.tv.text = [NSString stringWithFormat:@"%@",[self getChangedTime:[NSDate new] month:stepper.value]];
}

- (NSDate *)getChangedTime:(NSDate *)nowDate month:(NSInteger)month {
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [cal setTimeZone: timeZone];
    
    NSDateComponents *components = [cal components:( NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond ) fromDate:nowDate];
    [components setHour:0];
    [components setMinute:0];
    [components setSecond:0];
    [components setMonth:month];
    NSDate *changedDate = [cal dateByAddingComponents:components toDate: nowDate options:0];
    
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
//
//    NSString *currentTimeString = [formatter stringFromDate:changedDate];
    
    return changedDate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.monthSteper addTarget:self action:@selector(monthSteper:) forControlEvents:UIControlEventValueChanged];
    

    self.tv.text = [NSString stringWithFormat:@"%@",[self getChangedTime:[NSDate new] month:0]];
    
    NSString *timeSp = [NSString stringWithFormat:@"%@",[self getChangedTime:[NSDate new] month:0]];
    NSString *timeSp2 = [NSString stringWithFormat:@"%@", [self getChangedTime:[NSDate new] month:10]];
    
    self.tv.text = [NSString stringWithFormat:@"%@\n timeSp:%@\n timeSp2:%@\n 差值%@\n",self.tv.text,timeSp,timeSp2,@"0"];
    NSLog(@"%@",self.tv.text);
    
}

@end
