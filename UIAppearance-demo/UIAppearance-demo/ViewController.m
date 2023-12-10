//
//  ViewController.m
//  UIAppearance-demo
//
//  Created by irobbin on 2023/12/10.
//

#import "ViewController.h"
#import "MyView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[MyView xy_appearance] setBackgroundColor:[UIColor redColor]];
    
    UIView * myview = [[MyView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [self.view addSubview:myview];}


@end
