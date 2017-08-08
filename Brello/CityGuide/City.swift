// The MIT License (MIT)
//
// Copyright (c) 2016 Luke Zhao <me@lkzhao.com>
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

struct City {
  var name: String
  var image: UIImage
  var shortDescription: String
  var description: String
  var type: Int
  var icon: UIImage

  static var cities = [
    City(name: "Sky Bar Cafe",
         image: #imageLiteral(resourceName: "SkyBar"),
         shortDescription: "Best Bar In Auburn",
         description: "Hours:\nM: 5pm-2am\nT: 5pm-2am\nW: 5pm-2am\nTh: 5pm-2am\nF: 5pm-2am\nS: 5pm-2am\nSun: 5pm-2am\n",
         type: 1,
         icon: #imageLiteral(resourceName: "brelloLogo")),
    City(name: "17/16 Bar",
         image: #imageLiteral(resourceName: "seventeen"),
         shortDescription: "Great Stop",
         description: "Hours:\nM: 5pm-2am\nT: 5pm-2am\nW: 5pm-2am\nTh: 5pm-2am\nF: 5pm-2am\nS: 5pm-2am\nSun: 5pm-2am\n",
         type: 1,
         icon: #imageLiteral(resourceName: "BlueLogo")),
    City(name: "Quixotes",
         image: #imageLiteral(resourceName: "Quixotes"),
         shortDescription: "Always Ending Location",
         description: "Hours:\nM: 5pm-2am\nT: 5pm-2am\nW: 5pm-2am\nTh: 5pm-2am\nF: 5pm-2am\nS: 5pm-2am\nSun: 5pm-2am\n",
         type: 1,
        icon: #imageLiteral(resourceName: "GoldLogo"))
  ]
    static var passes = [
        City(name: "Single Pass",
             image: #imageLiteral(resourceName: "RedCell"),
             shortDescription: "Base Brello",
             description: "Base Brello",
             type: 1,
             icon: #imageLiteral(resourceName: "brelloLogo")),
        City(name: "Blue Brello",
             image: #imageLiteral(resourceName: "BlueCell"),
             shortDescription: "Double Coverage",
             description: "Double Coverage",
             type: 2,
             icon: #imageLiteral(resourceName: "BlueLogo")),
        City(name: "Green Brello",
             image: #imageLiteral(resourceName: "GreenCell"),
             shortDescription: "Triple Coverage",
             description: "Triple Coverage",
             type: 3,
             icon: #imageLiteral(resourceName: "GreenLogo")),
        City(name: "Gold Brello",
             image: #imageLiteral(resourceName: "goldCell"),
             shortDescription: "Quadrouple Coverage",
             description: "Quadrouple Coverage",
             type: 4,
             icon: #imageLiteral(resourceName: "GoldLogo")),
        City(name: "Orange Brello",
             image: #imageLiteral(resourceName: "OrangeCell"),
             shortDescription: "Quintuple Coverage",
             description: "Quintuple Coverage",
             type: 5,
             icon: #imageLiteral(resourceName: "OrangeLogo")),
        City(name: "Pink Brello",
             image: #imageLiteral(resourceName: "PinkCell"),
             shortDescription: "Group Brello 6",
             description: "Group Brello 6",
             type: 6,
             icon: #imageLiteral(resourceName: "PinkLogo"))

            ]

    static var buyPass = [
        City(name: "Single Pass",
             image: #imageLiteral(resourceName: "RedCell"),
             shortDescription: "Base Brello",
             description: "Base Brello",
             type: 1,
             icon: #imageLiteral(resourceName: "brelloLogo")),
        City(name: "Blue Brello",
             image: #imageLiteral(resourceName: "BlueCell"),
             shortDescription: "Double Coverage",
             description: "Double Coverage",
             type: 2,
             icon: #imageLiteral(resourceName: "BlueLogo")),
        City(name: "Green Brello",
             image: #imageLiteral(resourceName: "GreenCell"),
             shortDescription: "Triple Coverage",
             description: "Triple Coverage",
             type: 3,
             icon: #imageLiteral(resourceName: "GreenLogo")),
        City(name: "Gold Brello",
             image: #imageLiteral(resourceName: "goldCell"),
             shortDescription: "Quadrouple Coverage",
             description: "Quadrouple Coverage",
             type: 4,
             icon: #imageLiteral(resourceName: "GoldLogo")),
        City(name: "Orange Brello",
             image: #imageLiteral(resourceName: "OrangeCell"),
             shortDescription: "Quintuple Coverage",
             description: "Quintuple Coverage",
             type: 5,
             icon: #imageLiteral(resourceName: "OrangeLogo")),
        City(name: "Pink Brello",
             image: #imageLiteral(resourceName: "PinkCell"),
             shortDescription: "Group Brello 6",
             description: "Group Brello 6",
             type: 6,
             icon: #imageLiteral(resourceName: "PinkLogo"))
    ]
    static var redPasses = [
        City(name: "Single Pass",
             image: #imageLiteral(resourceName: "RedCell"),
             shortDescription: "Base Brello",
             description: "Base Brello",
             type: 1,
             icon: #imageLiteral(resourceName: "brelloLogo")),
        City(name: "Single Pass",
             image: #imageLiteral(resourceName: "RedCell"),
             shortDescription: "Base Brello",
             description: "Base Brello",
             type: 1,
             icon: #imageLiteral(resourceName: "brelloLogo"))
    ]

    static var bluePasses = [
        City(name: "Blue Brello",
             image: #imageLiteral(resourceName: "BlueCell"),
             shortDescription: "Double Coverage",
             description: "Double Coverage",
             type: 2,
             icon: #imageLiteral(resourceName: "BlueLogo")),
        City(name: "Blue Brello",
             image: #imageLiteral(resourceName: "BlueCell"),
             shortDescription: "Double Coverage",
             description: "Double Coverage",
             type: 2,
             icon: #imageLiteral(resourceName: "BlueLogo"))
    ]
    static var redBlue = [
        City(name: "Single Pass",
             image: #imageLiteral(resourceName: "RedCell"),
             shortDescription: "Base Brello",
             description: "Base Brello",
             type: 1,
             icon: #imageLiteral(resourceName: "brelloLogo")),
        City(name: "Blue Brello",
             image: #imageLiteral(resourceName: "BlueCell"),
             shortDescription: "Double Coverage",
             description: "Double Coverage",
             type: 2,
             icon: #imageLiteral(resourceName: "BlueLogo"))
        ]
    static var greenBlue = [
        City(name: "Green Brello",
             image: #imageLiteral(resourceName: "GreenCell"),
             shortDescription: "Triple Coverage",
             description: "Triple Coverage",
             type: 3,
             icon: #imageLiteral(resourceName: "GreenLogo")),
        City(name: "Blue Brello",
             image: #imageLiteral(resourceName: "BlueCell"),
             shortDescription: "Double Coverage",
             description: "Double Coverage",
             type: 2,
             icon: #imageLiteral(resourceName: "BlueLogo"))
    ]
    static var greengreen = [
        City(name: "Green Brello",
             image: #imageLiteral(resourceName: "GreenCell"),
             shortDescription: "Triple Coverage",
             description: "Triple Coverage",
             type: 3,
             icon: #imageLiteral(resourceName: "GreenLogo")),
        City(name: "Green Brello",
             image: #imageLiteral(resourceName: "GreenCell"),
             shortDescription: "Triple Coverage",
             description: "Triple Coverage",
             type: 3,
             icon: #imageLiteral(resourceName: "GreenLogo"))
    ]

}
