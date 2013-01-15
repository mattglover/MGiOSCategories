//
//  NSFileManager+CachesDirectory.m
//  
//
//  Created by Matt Glover on 15/01/2013.
//
//

#import "NSFileManager+CachesDirectory.h"

@implementation NSFileManager (CachesDirectory)

#pragma mark - Caches Directory Helper
+ (NSString *)applicationCachesDirectory {
  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
  NSString *cachePath = [paths objectAtIndex:0];
  BOOL isDir = NO;
  NSError *error = nil;
  
  if (![[NSFileManager defaultManager] fileExistsAtPath:cachePath isDirectory:&isDir] && isDir == NO) {
    [[NSFileManager defaultManager] createDirectoryAtPath:cachePath withIntermediateDirectories:NO attributes:nil error:&error];
  }
  
  return cachePath;
}

@end
