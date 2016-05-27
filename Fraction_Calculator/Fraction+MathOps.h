//
//  Fraction+MathOps.h
//  ObjC
//
//  Created by MF839-008 on 2016. 5. 26..
//  Copyright © 2016년 JRChae. All rights reserved.
//

#import "Fraction.h"

@interface Fraction (MathOps)
- (Fraction *) add:(Fraction *)f;
- (Fraction *) mul:(Fraction *)f;
- (Fraction *) sub:(Fraction *)f;
- (Fraction *) div:(Fraction *)f;
@end
