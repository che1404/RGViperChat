[![Build Status](https://travis-ci.org/che1404/RGViperChat.svg?branch=master)](https://travis-ci.org/che1404/RGViperChat) [![codecov](https://codecov.io/gh/che1404/RGViperChat/branch/master/graph/badge.svg)](https://codecov.io/gh/che1404/RGViperChat) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)



# RGViperChat
An iOS chat app written following a VIPER architecture and BDD

![RGViperChat](https://robertogarrido.com/wp-content/uploads/2017/06/RGViperChat_resized_2.png)

With this project I'd like to gather all the best practices I can find when working with a VIPER architecture and a BDD approach. ***VIPER is the Uncle Bob's Clean Architecture implementation, and it pushes the SRP (Single Responsibility Principle) to the limit***. Although it works seamlessly on linear and simple apps, there are always cases in which VIPER doesn't fit perfectly without thinking a bit further: inter module communications, or working view containers like UIPageViewControllers, UITabBarControllers, or Burger menus. The dependency injection is another challenge, particularly for those cases in which a service is reused across different modules of the app.

Here you can find a presentation of a talk I gave about VIPER and BDD: https://robertogarrido.com/wp-content/uploads/2017/06/Clean-Architectures-and-BDD-on-iOS-GitHub.pdf

## References
Here you can find a list of interesting readings about VIPER and BDD:

**IOS ARCHITECTURE PATTERNS:** https://medium.com/ios-os-x-development/ios-architecture-patterns-ecba4c38de52

**ARCHITECTING IOS APPS WITH VIPER:** https://www.objc.io/issues/13-architecture/viper/

**ARCHITECTING MOBILE APPS WITH (B)VIPER MODULES - A STRUCTURED ENGINEERING APPROACH FOR BIG MOBILE APPS:** http://digital.travelport.com/blog/architecting-mobile-apps-with-bviper-modules

**VIPER ARCHITECTURE: OUR BEST PRACTICES TO BUILD AN APP LIKE A BOSS:** https://cheesecakelabs.com/blog/best-practices-viper-architecture/

**IOS PROJECT ARCHITECTURE: USING VIPER:** https://cheesecakelabs.com/blog/ios-project-architecture-using-viper/

**ENGINEERING THE ARCHITECTURE BEHIND UBER’S NEW RIDER APP:** https://eng.uber.com/new-rider-app/

### Author
I'm Roberto Garrido, a freelance iOS developer available for hire on my website: https://robertogarrido.com
