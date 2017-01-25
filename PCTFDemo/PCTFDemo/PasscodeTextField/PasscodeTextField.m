//
//  PasscodeTextField.m
//
//  Created by JQ-miao on 2016/11/25.
//  Copyright © 2016年 himjq.com.  All rights reserved.
//

#import "PasscodeTextField.h"

@interface PasscodeTextField ()
{
    NSString *vacantStyle;
    NSString *filledStyle;
}
@property(nonatomic,weak) UITextField *textField;
@property (nonatomic, strong) NSMutableArray<UILabel *> *dataSource;
@end

@implementation PasscodeTextField

#pragma mark - dataSource
- (NSMutableArray *)dataSource {
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

#pragma mark - initialization
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UITextField *textField = [[UITextField alloc] initWithFrame:self.bounds];
        textField.hidden = YES;
        textField.keyboardType = UIKeyboardTypeNumberPad;
        [textField addTarget:self action:@selector(passcodeChanged:) forControlEvents:UIControlEventEditingChanged];
        [self addSubview:textField];
        _textField = textField;
        
        //set default value
        [self setStyle:iphone];
        [self setComplexity:4];
        [self setSize:20];
        
    }
    return self;
}

- (void)setComplexity:(NSUInteger)complexity {
    _complexity = complexity;
    
    [self.dataSource enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [NSObject cancelPreviousPerformRequestsWithTarget:obj selector:@selector(removeFromSuperview) object:nil];
    }];
    [self.dataSource makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.dataSource removeAllObjects];
    for (int i = 0; i < self.complexity; i++)
    {
        UILabel *la = [[UILabel alloc] init];
        la.text = vacantStyle;
        la.textAlignment = NSTextAlignmentCenter;
        [self insertSubview:la belowSubview:self.textField];
        [self.dataSource addObject:la];
    }
}

- (void)setColor:(UIColor *)color{
    _color = color;
    [self.dataSource enumerateObjectsUsingBlock:^(UILabel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.textColor = _color;
    }];
}

- (void)setSize:(CGFloat)size{
    _size = size;
    [self.dataSource enumerateObjectsUsingBlock:^(UILabel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.font = [UIFont systemFontOfSize:size];
    }];
}

-(void) setStyle:(PCTFStyle)style{
    _style = style;
    switch (style) {
        case iphone:
            vacantStyle = @"－";
            filledStyle = @"●";
            break;
        case flower:
            vacantStyle = @"－";
            filledStyle = @"✿";
            break;
        case snowflake:
            vacantStyle = @"－";
            filledStyle = @"❆";
            break;
        case circle:
            vacantStyle = @"○";
            filledStyle = @"●";
            break;
        case pentagram:
            vacantStyle = @"☆";
            filledStyle = @"★";
            break;
        case square:
            vacantStyle = @"□";
            filledStyle = @"■";
            break;
        case diamond:
            vacantStyle = @"◇";
            filledStyle = @"◆";
            break;
        default:
            break;
    }
    
    [self.dataSource enumerateObjectsUsingBlock:^(UILabel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.text = vacantStyle;
    }];
}

#pragma mark - password changed
- (void)passcodeChanged:(UITextField *)textField {
    NSString *password = textField.text;
    if (password.length > self.complexity) {
        return;
    }
    
    for (int i = 0; i < self.complexity; i++)
    {
        UILabel *la = [self.dataSource objectAtIndex:i];
        if (i < password.length) {
            la.text = filledStyle;
        } else {
            la.text = vacantStyle;
        }
    }
    
    !self.getPasscode ? : self.getPasscode(textField.text,self);
}

- (void)clearPasscode {
    self.textField.text = nil;
    [self passcodeChanged:self.textField];
}

- (void)showKeyboard {
    [self.textField becomeFirstResponder];
}

- (void)hideKeyboard {
    [self.textField resignFirstResponder];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    CGFloat l = w/self.complexity;
    for (NSUInteger i = 0; i < self.dataSource.count; i++) {
        UILabel *la = [self.dataSource objectAtIndex:i];
        la.frame = CGRectMake(i*l, (h-l)/2, l, l);
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.textField becomeFirstResponder];;
}

@end
