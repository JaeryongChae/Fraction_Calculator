//
//  ViewController.h
//  Fraction_Calculator
//
//  Created by MF839-008 on 2016. 5. 27..
//  Copyright © 2016년 JRChae. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *display;

- (void) processDigit:(int)digit;
- (void) processOp:(char)theOp;
- (void) storeFracPart;

// Digit
- (IBAction)clickDigit:(UIButton *)sender;

// Operator
- (IBAction)clickPlus:(id)sender;
- (IBAction)clickMinus:(id)sender;
- (IBAction)clickMultiply:(id)sender;
- (IBAction)clickDivide:(id)sender;

// Others
- (IBAction)clickEquals:(id)sender;
- (IBAction)clickOver:(id)sender;
- (IBAction)clickClear:(id)sender;

@end