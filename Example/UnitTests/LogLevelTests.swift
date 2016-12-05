//
//  LogLevelTests.swift
//  Logomotive
//
//  Created by Andreas on 02.12.16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Logomotive
import Quick
import Nimble

class LogLevelTests: QuickSpec {
    override func spec() {
        rawValueTest()
        descriptionTest()
        debugTest()
        infoTest()
        warningTest()
        errorTest()
    }
    
    func rawValueTest() {
        describe("rawValue of") {
            it("debug equals 0") {
                expect(LogLevel.debug.rawValue).to(equal(0))
            }
            it("info equals 1") {
                expect(LogLevel.info.rawValue).to(equal(1))
            }
            it("warning equals 2") {
                expect(LogLevel.warning.rawValue).to(equal(2))
            }
            it("error equals 3") {
                expect(LogLevel.error.rawValue).to(equal(3))
            }
        }
    }
    
    func descriptionTest() {
        describe("description of") {
            it("debug equals DEBUG") {
                expect(LogLevel.debug.description).to(equal("DEBUG"))
            }
            it("info equals INFO") {
                expect(LogLevel.info.description).to(equal("INFO"))
            }
            it("warning equals WARNING") {
                expect(LogLevel.warning.description).to(equal("WARNING"))
            }
            it("error equals ERROR") {
                expect(LogLevel.error.description).to(equal("ERROR"))
            }
        }
    }
    
    func debugTest() {
        describe("debug") {
            describe("is") {
                describe("equal to") {
                    it("debug") {
                        expect(LogLevel.debug == LogLevel.debug).to(beTrue())
                        expect(LogLevel.debug <= LogLevel.debug).to(beTrue())
                    }
                }
                describe("less then") {
                    it("info") {
                        expect(LogLevel.debug < LogLevel.info).to(beTrue())
                        expect(LogLevel.debug <= LogLevel.info).to(beTrue())
                    }
                    it("warning") {
                        expect(LogLevel.debug < LogLevel.warning).to(beTrue())
                        expect(LogLevel.debug <= LogLevel.warning).to(beTrue())
                    }
                    it("error") {
                        expect(LogLevel.debug < LogLevel.error).to(beTrue())
                        expect(LogLevel.debug <= LogLevel.error).to(beTrue())
                    }
                }
            }
            describe("is not") {
                describe("equal to") {
                    it("info") {
                        expect(LogLevel.debug == LogLevel.info).to(beFalse())
                        expect(LogLevel.debug != LogLevel.info).to(beTrue())
                    }
                    it("warning") {
                        expect(LogLevel.debug == LogLevel.warning).to(beFalse())
                        expect(LogLevel.debug != LogLevel.warning).to(beTrue())
                    }
                    it("error") {
                        expect(LogLevel.debug == LogLevel.error).to(beFalse())
                        expect(LogLevel.debug != LogLevel.error).to(beTrue())
                    }
                }
                describe("greater then") {
                    it("info") {
                        expect(LogLevel.debug >= LogLevel.info).to(beFalse())
                        expect(LogLevel.debug > LogLevel.info).to(beFalse())
                    }
                    it("warning") {
                        expect(LogLevel.debug >= LogLevel.warning).to(beFalse())
                        expect(LogLevel.debug > LogLevel.warning).to(beFalse())
                    }
                    it("error") {
                        expect(LogLevel.debug >= LogLevel.error).to(beFalse())
                        expect(LogLevel.debug > LogLevel.error).to(beFalse())
                    }
                }
            }
        }
    }
    
    func infoTest() {
        describe("info") {
            describe("is") {
                describe("equal to") {
                    it("info") {
                        expect(LogLevel.info == LogLevel.info).to(beTrue())
                        expect(LogLevel.info <= LogLevel.info).to(beTrue())
                    }
                }
                describe("less then") {
                    it("warning") {
                        expect(LogLevel.info < LogLevel.warning).to(beTrue())
                        expect(LogLevel.info <= LogLevel.warning).to(beTrue())
                    }
                    it("error") {
                        expect(LogLevel.info < LogLevel.error).to(beTrue())
                        expect(LogLevel.info <= LogLevel.error).to(beTrue())
                    }
                }
                describe("greater then") {
                    it("debug") {
                        expect(LogLevel.info > LogLevel.debug).to(beTrue())
                        expect(LogLevel.info >= LogLevel.debug).to(beTrue())
                    }
                }
            }
            describe("is not") {
                describe("equal to") {
                    it("debug") {
                        expect(LogLevel.info == LogLevel.debug).to(beFalse())
                        expect(LogLevel.info != LogLevel.debug).to(beTrue())
                    }
                    it("warning") {
                        expect(LogLevel.info == LogLevel.warning).to(beFalse())
                        expect(LogLevel.info != LogLevel.warning).to(beTrue())
                    }
                    it("error") {
                        expect(LogLevel.info == LogLevel.error).to(beFalse())
                        expect(LogLevel.info != LogLevel.error).to(beTrue())
                    }
                }
                describe("less then") {
                    it("debug") {
                        expect(LogLevel.info <= LogLevel.debug).to(beFalse())
                        expect(LogLevel.info < LogLevel.debug).to(beFalse())
                    }
                }
                describe("greater then") {
                    it("warning") {
                        expect(LogLevel.info >= LogLevel.warning).to(beFalse())
                        expect(LogLevel.info > LogLevel.warning).to(beFalse())
                    }
                    it("error") {
                        expect(LogLevel.info >= LogLevel.error).to(beFalse())
                        expect(LogLevel.info > LogLevel.error).to(beFalse())
                    }
                }
            }
        }
    }
    
    func warningTest() {
        describe("warning") {
            describe("is") {
                describe("equal to") {
                    it("warning") {
                        expect(LogLevel.warning == LogLevel.warning).to(beTrue())
                        expect(LogLevel.warning <= LogLevel.warning).to(beTrue())
                    }
                }
                describe("less then") {
                    it("error") {
                        expect(LogLevel.warning < LogLevel.error).to(beTrue())
                        expect(LogLevel.warning <= LogLevel.error).to(beTrue())
                    }
                }
                describe("greater then") {
                    it("debug") {
                        expect(LogLevel.warning > LogLevel.debug).to(beTrue())
                        expect(LogLevel.warning >= LogLevel.debug).to(beTrue())
                    }
                    it("info") {
                        expect(LogLevel.warning > LogLevel.info).to(beTrue())
                        expect(LogLevel.warning >= LogLevel.info).to(beTrue())
                    }
                }
            }
            describe("is not") {
                describe("equal to") {
                    it("debug") {
                        expect(LogLevel.warning == LogLevel.debug).to(beFalse())
                        expect(LogLevel.warning != LogLevel.debug).to(beTrue())
                    }
                    it("info") {
                        expect(LogLevel.warning == LogLevel.info).to(beFalse())
                        expect(LogLevel.warning != LogLevel.info).to(beTrue())
                    }
                    it("error") {
                        expect(LogLevel.warning == LogLevel.error).to(beFalse())
                        expect(LogLevel.warning != LogLevel.error).to(beTrue())
                    }
                }
                describe("less then") {
                    it("debug") {
                        expect(LogLevel.warning <= LogLevel.debug).to(beFalse())
                        expect(LogLevel.warning < LogLevel.debug).to(beFalse())
                    }
                    it("info") {
                        expect(LogLevel.warning <= LogLevel.info).to(beFalse())
                        expect(LogLevel.warning < LogLevel.info).to(beFalse())
                    }
                }
                describe("greater then") {
                    it("error") {
                        expect(LogLevel.warning >= LogLevel.error).to(beFalse())
                        expect(LogLevel.warning > LogLevel.error).to(beFalse())
                    }
                }
            }
        }
    }

    func errorTest() {
        describe("error") {
            describe("is") {
                describe("equal to") {
                    it("error") {
                        expect(LogLevel.error == LogLevel.error).to(beTrue())
                        expect(LogLevel.error <= LogLevel.error).to(beTrue())
                    }
                }
                describe("greater then") {
                    it("debug") {
                        expect(LogLevel.error > LogLevel.debug).to(beTrue())
                        expect(LogLevel.error >= LogLevel.debug).to(beTrue())
                    }
                    it("info") {
                        expect(LogLevel.error > LogLevel.info).to(beTrue())
                        expect(LogLevel.error >= LogLevel.info).to(beTrue())
                    }
                    it("warning") {
                        expect(LogLevel.error > LogLevel.warning).to(beTrue())
                        expect(LogLevel.error >= LogLevel.warning).to(beTrue())
                    }
                }
            }
            describe("is not") {
                describe("equal to") {
                    it("debug") {
                        expect(LogLevel.error == LogLevel.debug).to(beFalse())
                        expect(LogLevel.error != LogLevel.debug).to(beTrue())
                    }
                    it("info") {
                        expect(LogLevel.error == LogLevel.info).to(beFalse())
                        expect(LogLevel.error != LogLevel.info).to(beTrue())
                    }
                    it("warning") {
                        expect(LogLevel.error == LogLevel.warning).to(beFalse())
                        expect(LogLevel.error != LogLevel.warning).to(beTrue())
                    }
                }
                describe("less then") {
                    it("debug") {
                        expect(LogLevel.error <= LogLevel.debug).to(beFalse())
                        expect(LogLevel.error < LogLevel.debug).to(beFalse())
                    }
                    it("info") {
                        expect(LogLevel.error <= LogLevel.info).to(beFalse())
                        expect(LogLevel.error < LogLevel.info).to(beFalse())
                    }
                    it("warning") {
                        expect(LogLevel.error <= LogLevel.warning).to(beFalse())
                        expect(LogLevel.error < LogLevel.warning).to(beFalse())
                    }
                }
            }
        }
    }
}
