//
//  URBNConvenienceTestCase.m
//  URBNConvenience
//
//  Created by Demetri Miller on 12/2/14.
//  Copyright (c) 2014 jgrandelli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <URBNConvenience/NSDate+URBN.h>
#import <URBNConvenience/NSString+URBN.h>
#import <XCTest/XCTest.h>


@interface URBNConvenienceTestCase : XCTestCase

@end

@implementation URBNConvenienceTestCase

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testHumanReadableStringsPastDates {
    NSString *string;
    NSDate *currentDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSGregorianCalendar];
    
    NSDate *oneMinuteAgo = [calendar dateByAddingUnit:NSCalendarUnitMinute value:-1 toDate:currentDate options:0];
    string = [oneMinuteAgo urbn_humanReadableStringForTimeSinceCurrentDate];
    XCTAssertTrue([string isEqualToString:@"1m"], @"'minute' test failed");
    
    NSDate *fiftyNineMinuetsAgo = [calendar dateByAddingUnit:NSCalendarUnitMinute value:-59 toDate:currentDate options:0];
    string = [fiftyNineMinuetsAgo urbn_humanReadableStringForTimeSinceCurrentDate];
    XCTAssertTrue([string isEqualToString:@"59m"], @"'minute' test failed");
    
    NSDate *oneHourAgo = [calendar dateByAddingUnit:NSCalendarUnitHour value:-1 toDate:currentDate options:0];
    string = [oneHourAgo urbn_humanReadableStringForTimeSinceCurrentDate];
    XCTAssertTrue([string isEqualToString:@"1h"], @"'hour' test failed");
    
    NSDate *twentyThreeHoursAgo = [calendar dateByAddingUnit:NSCalendarUnitHour value:-23 toDate:currentDate options:0];
    string = [twentyThreeHoursAgo urbn_humanReadableStringForTimeSinceCurrentDate];
    XCTAssertTrue([string isEqualToString:@"23h"], @"'hour' test failed");
    
    NSDate *oneDayAgo = [calendar dateByAddingUnit:NSCalendarUnitDay value:-1 toDate:currentDate options:0];
    string = [oneDayAgo urbn_humanReadableStringForTimeSinceCurrentDate];
    XCTAssertTrue([string isEqualToString:@"1d"], @"'day' test failed");
    
    NSDate *sixDaysAgo = [calendar dateByAddingUnit:NSCalendarUnitDay value:-6 toDate:currentDate options:0];
    string = [sixDaysAgo urbn_humanReadableStringForTimeSinceCurrentDate];
    XCTAssertTrue([string isEqualToString:@"6d"], @"'day' test failed");
    
    NSDate *oneWeekAgo = [calendar dateByAddingUnit:NSCalendarUnitDay value:-7 toDate:currentDate options:0];
    string = [oneWeekAgo urbn_humanReadableStringForTimeSinceCurrentDate];
    XCTAssertTrue([string isEqualToString:@"1w"], @"'week' test failed");
    
    NSDate *twoWeeksAgo = [calendar dateByAddingUnit:NSCalendarUnitDay value:-14 toDate:currentDate options:0];
    string = [twoWeeksAgo urbn_humanReadableStringForTimeSinceCurrentDate];
    XCTAssertTrue([string isEqualToString:@"2w"], @"'week' test failed");
    
}

- (void)testHumanReadableStrings {
    NSString *string;
    NSDate *currentDate = [NSDate date];
    
    string = [currentDate urbn_humanReadableStringForTimeSinceCurrentDate];
    XCTAssertTrue([string isEqualToString:@"now"], @"'now' test failed");
    
    string = [[currentDate dateByAddingTimeInterval:59] urbn_humanReadableStringForTimeSinceCurrentDate];
    XCTAssertTrue([string isEqualToString:@"now"], @"'now' test failed");
    
    string = [[currentDate dateByAddingTimeInterval:70] urbn_humanReadableStringForTimeSinceCurrentDate];
    XCTAssertTrue([string isEqualToString:@"1m"], @"'minute' test failed");
    
    string = [[currentDate dateByAddingTimeInterval:3599] urbn_humanReadableStringForTimeSinceCurrentDate];
    XCTAssertTrue([string isEqualToString:@"59m"], @"'minute' test failed");
    
    string = [[currentDate dateByAddingTimeInterval:3700] urbn_humanReadableStringForTimeSinceCurrentDate];
    XCTAssertTrue([string isEqualToString:@"1h"], @"'hour' test failed");
    
    string = [[currentDate dateByAddingTimeInterval:84399] urbn_humanReadableStringForTimeSinceCurrentDate];
    XCTAssertTrue([string isEqualToString:@"23h"], @"'hour' test failed");
    
    string = [[currentDate dateByAddingTimeInterval:86500] urbn_humanReadableStringForTimeSinceCurrentDate];
    XCTAssertTrue([string isEqualToString:@"1d"], @"'day' test failed");
    
    string = [[currentDate dateByAddingTimeInterval:604799] urbn_humanReadableStringForTimeSinceCurrentDate];
    XCTAssertTrue([string isEqualToString:@"6d"], @"'day' test failed");
    
    string = [[currentDate dateByAddingTimeInterval:604900] urbn_humanReadableStringForTimeSinceCurrentDate];
    XCTAssertTrue([string isEqualToString:@"1w"], @"'week' test failed");
    
    string = [[currentDate dateByAddingTimeInterval:1209800] urbn_humanReadableStringForTimeSinceCurrentDate];
    XCTAssertTrue([string isEqualToString:@"2w"], @"'week' test failed");
}

- (void)testContainsString {
    NSString *refString = @"This is a test string";
    
    XCTAssertTrue([refString urbn_containsString:@"This"], @"Case sensistive case failed for present string");
    
    XCTAssertFalse([refString urbn_containsString:@"Stuff"], @"Case sensitive case failed for absent string");
    
    XCTAssertTrue([refString urbn_containsCaseInsensitiveString:@"this"], @"Case insensistive case failed for present string");
    
    XCTAssertFalse([refString urbn_containsCaseInsensitiveString:@"more stuff"], @"Case insensistive case failed for absent string");
}

@end
