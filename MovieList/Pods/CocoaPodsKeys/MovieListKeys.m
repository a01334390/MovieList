//
// Generated by CocoaPods-Keys
// on 21/12/2020
// For more information see https://github.com/orta/cocoapods-keys
//

#import <objc/runtime.h>
#import <Foundation/NSDictionary.h>
#import "MovieListKeys.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincomplete-implementation"

@implementation MovieListKeys

  @dynamic movieAPIKey;

#pragma clang diagnostic pop

+ (BOOL)resolveInstanceMethod:(SEL)name
{
  NSString *key = NSStringFromSelector(name);
  NSString * (*implementation)(MovieListKeys *, SEL) = NULL;

  if ([key isEqualToString:@"movieAPIKey"]) {
    implementation = _podKeys671eeee13bbae3ee5f80931b34d7b3eb;
  }

  if (!implementation) {
    return [super resolveInstanceMethod:name];
  }

  return class_addMethod([self class], name, (IMP)implementation, "@@:");
}

static NSString *_podKeys671eeee13bbae3ee5f80931b34d7b3eb(MovieListKeys *self, SEL _cmd)
{
  
    
      char cString[33] = { MovieListKeysData[572], MovieListKeysData[636], MovieListKeysData[975], MovieListKeysData[38], MovieListKeysData[745], MovieListKeysData[545], MovieListKeysData[6], MovieListKeysData[1072], MovieListKeysData[910], MovieListKeysData[719], MovieListKeysData[401], MovieListKeysData[652], MovieListKeysData[507], MovieListKeysData[132], MovieListKeysData[150], MovieListKeysData[1014], MovieListKeysData[669], MovieListKeysData[1084], MovieListKeysData[406], MovieListKeysData[937], MovieListKeysData[811], MovieListKeysData[93], MovieListKeysData[11], MovieListKeysData[961], MovieListKeysData[247], MovieListKeysData[7], MovieListKeysData[632], MovieListKeysData[659], MovieListKeysData[623], MovieListKeysData[1021], MovieListKeysData[694], MovieListKeysData[651], '\0' };
    
    return [NSString stringWithCString:cString encoding:NSUTF8StringEncoding];
  
}


static char MovieListKeysData[1114] = "7/BtIl6eCr7eE3cF2XBJ9Kn3ENhRoOo4S5rJ1v0O2EHldYcf33xc+LnQMGz+ZgrOl8HogTjXVnJaBzgNXOrjvs9cpdOwH9XQe1dcDstLl6N6nKZNGTKn+qvLmvNJHKq8Q8MuavLsMiB7ZvyoOO0nMfdh+az8I2M5XIndofb+M7rwaLi7YvGprfW3ixlGPHxcZEwsGAxIXc24ady5oYChJHjbB9KYPkdDCTb6fGCvgbFphuN5Rf/Dune74lggubjCkI9vdoAPoJOaMsMqv1ant+x0X0MJsFG1l1a6z+fZ+JpxQuVuzKezFR7Ob82Q6P1FseSzNZ8Kl4CcEyoTsFBbFsTGW9bKr20adsU80oFuP1zJKAbgTGth/X08KodyPhPmbhyHTd/2OvD/QGPd86iOlB5cKSaIWi4N/zZOHypvSZfvnoDYaNfQm/b4Uz6WZUBPu8hqW6MxhvqX6z5/Cx38aLtUBMv1ONc01pYe7z4xS1CXmccDeHWLBnmKpBybirthV5+DMH21oqtF2kk7HJIVhRLSvf60pWT4R8dNgOru6l0Dvcri0rzT5n955A7dejr11BU7lkhOpR21nNohfXscCgxzKCDb8mAC3HrJ/aVBrZLeUgt8fHuX1QOtfJaY7SLgWXGTJhZneAL57zRZ6My1vO82+kyQsbF2G6GVfab4HF3hDjK0OjdouReJkum4sqfE8oUQG5rBexsFPqYensO2RWWzh9VMF81Wb588exT4a2T80vbFHn6p53TXb0wRjN8nUDvmf4iS2u7HGgOVYRx6KaQ3hL/x5SxMH0jAug6EUHC9fugds8n0Gl/tYXS4z7UB9f4s5zCNKKm/p/oGi1+Fet5oF2U3CJ+sob5uR1D+C+Og6c0Bec/tQM35h0dZHdz6EIHGiJ+vNMdhwj6tMLOUkmTZB+5RWTkPCPhU5Vdi7bXwaDc1Ye2IlDBHCxlf7MvCS2VhL1IednXYi3n0oOpN61yZxOG5oGDyMZTwUlIpB6NzJSIN+YbXng0DFO8Sv6o4fwD+qH/UBNywA6pwJZWwQIbV0azwvEcSplYzbpa5Q5WCsuheaQDAPqsQnjlI0nC+lHsrpGaIJIq+1GktAr4VZA==\\\"";

- (NSString *)description
{
  return [@{
            @"movieAPIKey": self.movieAPIKey,
  } description];
}

- (id)debugQuickLookObject
{
  return [self description];
}

@end
