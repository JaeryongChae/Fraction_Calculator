//
//  ViewController.m
//  Fraction_Calculator
//
//  Created by MF839-008 on 2016. 5. 27..
//  Copyright © 2016년 JRChae. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"

@interface ViewController ()

@end

@implementation ViewController {
    char op;
    int currentNumber;
    BOOL firstOperand, isNumerator;
    Calculator *myCalculator;
    NSMutableString *displayString;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    firstOperand = YES;
    isNumerator = YES; // 분수 입력인가? (Over key)
    displayString = [NSMutableString stringWithCapacity:40];
    myCalculator = [[Calculator alloc] init];
    
    _display.text = @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// display process
- (void) processDigit:(int)digit {
    currentNumber = currentNumber * 10 + digit;
    
    [displayString appendString:
     [NSString stringWithFormat:@"%i", digit]];
    
    _display.text = displayString;
}

- (void) processOp:(char)theOp {
    NSString *opStr;
    
    op = theOp;
    
    switch(theOp){
        case '+':
            opStr = @" + ";
            break;
        case '-':
            opStr = @" - ";
            break;
        case '*':
            opStr = @" * ";
            break;
        case '/':
            opStr = @" / ";
            break;
    }
    
    [self storeFracPart];
    firstOperand = NO;
    isNumerator = YES;
    
    [displayString appendString:opStr];
    _display.text = displayString;
}

- (void) storeFracPart {
    if(firstOperand){
        if(isNumerator){
            myCalculator.operand1.numerator = currentNumber;
            myCalculator.operand1.denominator = 1;
        }
        else
            myCalculator.operand1.denominator = currentNumber;
    }
    else if(isNumerator) {
        myCalculator.operand2.numerator = currentNumber;
        myCalculator.operand2.denominator = 1;
    }
    else {
        myCalculator.operand2.denominator = currentNumber;
        firstOperand = YES;
    }
    
    currentNumber = 0;
}

// Digit Input
- (IBAction)clickDigit:(UIButton *)sender {
    int digit = (int)[sender tag];
    
    [self processDigit:digit];
}

// Operator Input
- (IBAction)clickPlus:(id)sender {
    [self processOp: '+'];
}

- (IBAction)clickMinus:(id)sender {
    [self processOp: '-'];
}

- (IBAction)clickMultiply:(id)sender {
    [self processOp: '*'];
}

- (IBAction)clickDivide:(id)sender {
    [self processOp: '/'];
}

// Other Input
- (IBAction)clickEquals:(id)sender {
    if(firstOperand == NO) {
        [self storeFracPart];
        [myCalculator performOperation:op];
        
        [displayString appendString:@" = "];
        [displayString appendString:[myCalculator.accumulator convertToString]];
        _display.text = displayString;
        
        currentNumber = 0;
        firstOperand = YES;
        isNumerator = YES;
        [displayString setString:@""];
    }
}

- (IBAction)clickOver:(id)sender {
    [self storeFracPart];
    isNumerator = NO;
    [displayString appendString:@" / "];
    _display.text = displayString;
}

- (IBAction)clickClear:(id)sender {
    isNumerator = YES;
    firstOperand = YES;
    currentNumber = 0;
    [myCalculator clear];
    
    [displayString setString:@""];
    _display.text = displayString;
    
    // Add
    UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    
    myView.backgroundColor = [UIColor redColor];
    [self.view addSubview:myView]; // myView를 Subview로 보이도록 하라.
}

- (IBAction) unwind:(UIStoryboardSegue *)seque {
    
}
@end
