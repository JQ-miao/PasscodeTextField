//
//  ViewController.m
//  PCTFDemo
//
//  Created by vndjqmia on 2016/11/28.
//  Copyright © 2016年 com.himjq. All rights reserved.
//

#import "ViewController.h"
#import "PasscodeTextField.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedBtn;
@property(nonatomic,copy) PasscodeTextField *pcTF;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel *la= [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-100, 150, 200, 50)];
    la.text=@"Enter a passcode";
    la.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:la];
    
    _pcTF = [[PasscodeTextField alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-100, 200, 200, 100)];
    [self.view addSubview:_pcTF];
    
//    _pcTF.complexity = 5;  //default is 4.
//    _pcTF.size = 25 ;      //default is 20.
    [_pcTF showKeyboard];
    
    __weak id safeSelf = self;
    _pcTF.getPasscode = ^(NSString *passcode,PasscodeTextField *pcTF){
        la.text = [NSString stringWithFormat:@"Passcode is：%@",passcode];
        if (passcode.length == pcTF.complexity) {
//            [pcTF hideKeyboard];
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"himjq.com" message:la.text preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil]];
            [safeSelf presentViewController:alert animated:YES completion:nil];
        }
    };
}

- (IBAction)SegmentedClick:(UISegmentedControl *)sender {
    [_pcTF clearPasscode];
    [_pcTF showKeyboard];
    switch (sender.selectedSegmentIndex) {
        case 0:
            _pcTF.style = iphone; //default
            break;
        case 1:
            _pcTF.style = flower;
            break;
        case 2:
            _pcTF.style = snowflake;
            break;
        case 3:
            _pcTF.style = circle;
            break;
        case 4:
            _pcTF.style = pentagram;
            break;
        case 5:
            _pcTF.style = square;
            break;
        case 6:
            _pcTF.style = diamond;
            break;
            
        default:
            break;
    }
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.segmentedBtn.isHidden? (self.segmentedBtn.hidden = NO):(self.segmentedBtn.hidden = YES);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
