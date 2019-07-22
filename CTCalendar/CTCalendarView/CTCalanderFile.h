//
//  CTCalanderFile.h
//  CTCalendar
//
//  Created by GodCoder on 2019/7/18.
//  Copyright © 2019 CTCalendar. All rights reserved.
//

#ifndef CTCalanderFile_h
#define CTCalanderFile_h

#import "NSDate+Calander.h"
#import "CTDateManager.h"

#define RGB(R,G,B,H) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:H]
#define RandomColor RGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), 1)
#define ScreenWidth UIScreen.mainScreen.bounds.size.width

#endif /* CTCalanderFile_h */
