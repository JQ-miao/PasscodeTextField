//
//  PasscodeTextField.h
//
//  Created by vndjqmia on 2016/11/28.
//  Copyright © 2016年 com.himjq. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 PasscodeTextField styles
 */
typedef NS_ENUM(NSInteger, PCTFStyle) {
    iphone = 0,//  -,● default
    flower,    //  -,✿
    snowflake, //  -,❆
    circle,    //  ○,●
    pentagram, //  ☆,★
    square,    //  □,■
    diamond,   //  ◇,◆
};

@interface PasscodeTextField : UIView

/**
 The complexity of the passcode, default is 4.
 */
@property(nonatomic,assign) NSUInteger complexity;

/**
 The color of elements in the view, default is black.
 */
@property(nonatomic,assign) UIColor *color;

/**
 The size of elements in the view, default is 20.
 */
@property(nonatomic,assign) CGFloat size;

/**
 The style of elements in the view, default is likes iphone view.
 */
@property(nonatomic,assign) PCTFStyle style;

/**
 A block can get the passcode.
 */
@property(nonatomic,copy) void(^getPasscode)(NSString *passcode,PasscodeTextField *pcTW);


/**
 Showing keyboard.
 */
- (void)showKeyboard;

/**
 Hide keyboard.
 */
- (void)hideKeyboard;

/**
 clear passcode
 */
- (void)clearPasscode;

@end
