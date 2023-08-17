//
//  OpenFDAModel.swift
//  OpenFDAShareData
//
//  Created by robevans on 8/16/23.
//

import Foundation

public struct CoreConstants {
//https://api.fda.gov/food/enforcement.json?search=report_date:[20040101+TO+20131231]&limit=1
    public static let openFDAEntryURL = "https://api.fda.gov/food/enforcement.json"
    public static let searchKey = "search="
    public static let limit = "limit="
}

public struct OpenFDA: Codable {
    public let meta: Meta
    public let results: [Recall]
}

// MARK: - Meta
public struct Meta: Codable {
    public let disclaimer: String
    public let terms, license: String
    public let lastUpdated: String
    public let results: Results

    public enum CodingKeys: String, CodingKey {
        case disclaimer, terms, license
        case lastUpdated = "last_updated"
        case results
    }
}

// MARK: - Results
public struct Results: Codable {
    public let skip, limit, total: Int
}

// MARK: - Result
public struct Recall: Codable {
    public let id = UUID()
    public let status: Status
    public let city, state: String
    public let country: String
    public let classification: Classification
    public let openfda: Openfda?
    public let productType: ProductType
    public let eventID, recallingFirm, address1: String, address2: String
    public let postalCode: String
    public let voluntaryMandated: String
    public let initialFirmNotification, distributionPattern, recallNumber, productDescription: String
    public let productQuantity, reasonForRecall, recallInitiationDate, centerClassificationDate: String
    public let reportDate, codeInfo: String
    public let terminationDate, moreCodeInfo: String?

    public enum CodingKeys: String, CodingKey {
        case status, city, state, country, classification, openfda
        case productType = "product_type"
        case eventID = "event_id"
        case recallingFirm = "recalling_firm"
        case address1 = "address_1"
        case address2 = "address_2"
        case postalCode = "postal_code"
        case voluntaryMandated = "voluntary_mandated"
        case initialFirmNotification = "initial_firm_notification"
        case distributionPattern = "distribution_pattern"
        case recallNumber = "recall_number"
        case productDescription = "product_description"
        case productQuantity = "product_quantity"
        case reasonForRecall = "reason_for_recall"
        case recallInitiationDate = "recall_initiation_date"
        case centerClassificationDate = "center_classification_date"
        case reportDate = "report_date"
        case codeInfo = "code_info"
        case terminationDate = "termination_date"
        case moreCodeInfo = "more_code_info"
    }
}

public enum Classification: String, Codable {
    case classI = "Class I"
    case classII = "Class II"
    case classIII = "Class III"
}

// MARK: - Openfda
public struct Openfda: Codable {
}

public enum ProductType: String, Codable {
    case food = "Food"
}

public enum Status: String, Codable {
    case completed = "Completed"
    case ongoing = "Ongoing"
    case terminated = "Terminated"
}

public let recallMockData = [
    Recall(status: .ongoing, city: "Doral", state: "FL", country: "United States", classification: .classI, openfda: nil, productType: .food, eventID: "1213", recallingFirm: "Emceta International Inc.", address1: "10836 Nw 27th St", address2: "", postalCode: "33172-5907", voluntaryMandated: "Voluntary: Firm initiated", initialFirmNotification: "E-Mail", distributionPattern: "Domestic and Foreign distribution.", recallNumber: "F-1295-2023", productDescription: "Potential Salmonella contamination.", productQuantity: "554 bottles/60 tablets each", reasonForRecall: "FDA sample analysis of Natural Systems brand Multi Vitamin, 60 Tablets, found the magnesium content as 33.5% of the amount declared in label.", recallInitiationDate: "20230710", centerClassificationDate: "20230726", reportDate: "20230802", codeInfo: "Lot 38883, Exp. 07/2024", terminationDate: nil, moreCodeInfo: "Lot 38883, Exp. 07/2024"),
    Recall(status: .terminated, city: "New Oxford", state: "NV", country: "United States", classification: .classIII, openfda: nil, productType: .food, eventID: "154", recallingFirm: "Winter Gardens Quality Foods, Inc.", address1: "304 Commerce St", address2: "", postalCode: "17350-1723", voluntaryMandated: "Voluntary: Firm initiated", initialFirmNotification: "E-Mail", distributionPattern: "The product was distributed to the following states, FL, IL, CA, TX,WA, PA, CT", recallNumber: "F-1294-2023", productDescription: "Trader Joes Unexpected Broccoli Cheddar Soup ( Sharp Cheddar Cheese & Unexpected Cheddar Cheese )Keep Refrigerated, NET WT. 20 OZ (1 LB 4 OZ ) 567g, 12 in a Case", productQuantity: "10,889 cases", reasonForRecall: "Winter Gardens Quality Foods, 304 Commerce St., New Oxford, PA 17350 is initiating a recall of Trader Joes, Unexpected Broccoli Cheddar Soup , 20 oz. film sealed plastic container with lid, further packaged in cardboard case, keep refrigerated , because the product has insects in the frozen broccoli florets.", recallInitiationDate: "20230710", centerClassificationDate: "20230726", reportDate: "20230722", codeInfo: "Item #: 68470  Lot #s: 383; 384; 385; 390; 391; 392; 397; 398; 405; 406; 425; 426; 431; 433; 442  Use by dates: 7/18/2023; 7/19/2023; 7/20/2023; 7/25/2023; 7/26/2023; 7/27/2023; 8/1/2023; 8/2/2023; 8/9/2023; 8/10/2023; 8/29/2023; 8/30/2023; 9/4/2023; 9/6/2023; 9/15/2023", terminationDate: "20230804", moreCodeInfo: nil
    ),
    Recall(status: .terminated, city: "New Oxford", state: "SC", country: "United States", classification: .classIII, openfda: nil, productType: .food, eventID: "464", recallingFirm: "Winter Gardens Quality Foods, Inc.", address1: "304 Commerce St", address2: "", postalCode: "17350-1723", voluntaryMandated: "Voluntary: Firm initiated", initialFirmNotification: "E-Mail", distributionPattern: "The product was distributed to the following states, FL, IL, CA, TX,WA, PA, CT", recallNumber: "F-1294-2023", productDescription: "Trader Joes Unexpected Broccoli Cheddar Soup ( Sharp Cheddar Cheese & Unexpected Cheddar Cheese )Keep Refrigerated, NET WT. 20 OZ (1 LB 4 OZ ) 567g, 12 in a Case", productQuantity: "10,889 cases", reasonForRecall: "Winter Gardens Quality Foods, 304 Commerce St., New Oxford, PA 17350 is initiating a recall of Trader Joes, Unexpected Broccoli Cheddar Soup , 20 oz. film sealed plastic container with lid, further packaged in cardboard case, keep refrigerated , because the product has insects in the frozen broccoli florets.", recallInitiationDate: "20230710", centerClassificationDate: "20230726", reportDate: "20230806", codeInfo: "Item #: 68470  Lot #s: 383; 384; 385; 390; 391; 392; 397; 398; 405; 406; 425; 426; 431; 433; 442  Use by dates: 7/18/2023; 7/19/2023; 7/20/2023; 7/25/2023; 7/26/2023; 7/27/2023; 8/1/2023; 8/2/2023; 8/9/2023; 8/10/2023; 8/29/2023; 8/30/2023; 9/4/2023; 9/6/2023; 9/15/2023", terminationDate: "20230804", moreCodeInfo: nil
    ),
    Recall(status: .terminated, city: "New Oxford", state: "NY", country: "United States", classification: .classIII, openfda: nil, productType: .food, eventID: "7564", recallingFirm: "Winter Gardens Quality Foods, Inc.", address1: "304 Commerce St", address2: "", postalCode: "17350-1723", voluntaryMandated: "Voluntary: Firm initiated", initialFirmNotification: "E-Mail", distributionPattern: "The product was distributed to the following states, FL, IL, CA, TX,WA, PA, CT", recallNumber: "F-1294-2023", productDescription: "Trader Joes Unexpected Broccoli Cheddar Soup ( Sharp Cheddar Cheese & Unexpected Cheddar Cheese )Keep Refrigerated, NET WT. 20 OZ (1 LB 4 OZ ) 567g, 12 in a Case", productQuantity: "10,889 cases", reasonForRecall: "Winter Gardens Quality Foods, 304 Commerce St., New Oxford, PA 17350 is initiating a recall of Trader Joes, Unexpected Broccoli Cheddar Soup , 20 oz. film sealed plastic container with lid, further packaged in cardboard case, keep refrigerated , because the product has insects in the frozen broccoli florets.", recallInitiationDate: "20230710", centerClassificationDate: "20230726", reportDate: "20230806", codeInfo: "Item #: 68470  Lot #s: 383; 384; 385; 390; 391; 392; 397; 398; 405; 406; 425; 426; 431; 433; 442  Use by dates: 7/18/2023; 7/19/2023; 7/20/2023; 7/25/2023; 7/26/2023; 7/27/2023; 8/1/2023; 8/2/2023; 8/9/2023; 8/10/2023; 8/29/2023; 8/30/2023; 9/4/2023; 9/6/2023; 9/15/2023", terminationDate: "20230804", moreCodeInfo: nil
    ),
    Recall(status: .terminated, city: "New Oxford", state: "SC", country: "United States", classification: .classIII, openfda: nil, productType: .food, eventID: "35464", recallingFirm: "Winter Gardens Quality Foods, Inc.", address1: "304 Commerce St", address2: "", postalCode: "17350-1723", voluntaryMandated: "Voluntary: Firm initiated", initialFirmNotification: "E-Mail", distributionPattern: "The product was distributed to the following states, FL, IL, CA, TX,WA, PA, CT", recallNumber: "F-1294-2023", productDescription: "Trader Joes Unexpected Broccoli Cheddar Soup ( Sharp Cheddar Cheese & Unexpected Cheddar Cheese )Keep Refrigerated, NET WT. 20 OZ (1 LB 4 OZ ) 567g, 12 in a Case", productQuantity: "10,889 cases", reasonForRecall: "Winter Gardens Quality Foods, 304 Commerce St., New Oxford, PA 17350 is initiating a recall of Trader Joes, Unexpected Broccoli Cheddar Soup , 20 oz. film sealed plastic container with lid, further packaged in cardboard case, keep refrigerated , because the product has insects in the frozen broccoli florets.", recallInitiationDate: "20230710", centerClassificationDate: "20230726", reportDate: "20230806", codeInfo: "Item #: 68470  Lot #s: 383; 384; 385; 390; 391; 392; 397; 398; 405; 406; 425; 426; 431; 433; 442  Use by dates: 7/18/2023; 7/19/2023; 7/20/2023; 7/25/2023; 7/26/2023; 7/27/2023; 8/1/2023; 8/2/2023; 8/9/2023; 8/10/2023; 8/29/2023; 8/30/2023; 9/4/2023; 9/6/2023; 9/15/2023", terminationDate: "20230804", moreCodeInfo: nil
    ),
    Recall(status: .terminated, city: "New Oxford", state: "NC", country: "United States", classification: .classIII, openfda: nil, productType: .food, eventID: "232534", recallingFirm: "Winter Gardens Quality Foods, Inc.", address1: "304 Commerce St", address2: "", postalCode: "17350-1723", voluntaryMandated: "Voluntary: Firm initiated", initialFirmNotification: "E-Mail", distributionPattern: "The product was distributed to the following states, FL, IL, CA, TX,WA, PA, CT", recallNumber: "F-1294-2023", productDescription: "Trader Joes Unexpected Broccoli Cheddar Soup ( Sharp Cheddar Cheese & Unexpected Cheddar Cheese )Keep Refrigerated, NET WT. 20 OZ (1 LB 4 OZ ) 567g, 12 in a Case", productQuantity: "10,889 cases", reasonForRecall: "Winter Gardens Quality Foods, 304 Commerce St., New Oxford, PA 17350 is initiating a recall of Trader Joes, Unexpected Broccoli Cheddar Soup , 20 oz. film sealed plastic container with lid, further packaged in cardboard case, keep refrigerated , because the product has insects in the frozen broccoli florets.", recallInitiationDate: "20230710", centerClassificationDate: "20230726", reportDate: "20230805", codeInfo: "Item #: 68470  Lot #s: 383; 384; 385; 390; 391; 392; 397; 398; 405; 406; 425; 426; 431; 433; 442  Use by dates: 7/18/2023; 7/19/2023; 7/20/2023; 7/25/2023; 7/26/2023; 7/27/2023; 8/1/2023; 8/2/2023; 8/9/2023; 8/10/2023; 8/29/2023; 8/30/2023; 9/4/2023; 9/6/2023; 9/15/2023", terminationDate: "20230804", moreCodeInfo: nil
    ),
    Recall(status: .terminated, city: "New Oxford", state: "PA", country: "United States", classification: .classIII, openfda: nil, productType: .food, eventID: "3", recallingFirm: "Winter Gardens Quality Foods, Inc.", address1: "304 Commerce St", address2: "", postalCode: "17350-1723", voluntaryMandated: "Voluntary: Firm initiated", initialFirmNotification: "E-Mail", distributionPattern: "The product was distributed to the following states, FL, IL, CA, TX,WA, PA, CT", recallNumber: "F-1294-2023", productDescription: "Trader Joes Unexpected Broccoli Cheddar Soup ( Sharp Cheddar Cheese & Unexpected Cheddar Cheese )Keep Refrigerated, NET WT. 20 OZ (1 LB 4 OZ ) 567g, 12 in a Case", productQuantity: "10,889 cases", reasonForRecall: "Winter Gardens Quality Foods, 304 Commerce St., New Oxford, PA 17350 is initiating a recall of Trader Joes, Unexpected Broccoli Cheddar Soup , 20 oz. film sealed plastic container with lid, further packaged in cardboard case, keep refrigerated , because the product has insects in the frozen broccoli florets.", recallInitiationDate: "20230710", centerClassificationDate: "20230726", reportDate: "20230801", codeInfo: "Item #: 68470  Lot #s: 383; 384; 385; 390; 391; 392; 397; 398; 405; 406; 425; 426; 431; 433; 442  Use by dates: 7/18/2023; 7/19/2023; 7/20/2023; 7/25/2023; 7/26/2023; 7/27/2023; 8/1/2023; 8/2/2023; 8/9/2023; 8/10/2023; 8/29/2023; 8/30/2023; 9/4/2023; 9/6/2023; 9/15/2023", terminationDate: "20230804", moreCodeInfo: nil
    ),
    Recall(status: .terminated, city: "New Oxford", state: "AK", country: "United States", classification: .classIII, openfda: nil, productType: .food, eventID: "7564", recallingFirm: "Winter Gardens Quality Foods, Inc.", address1: "304 Commerce St", address2: "", postalCode: "17350-1723", voluntaryMandated: "Voluntary: Firm initiated", initialFirmNotification: "E-Mail", distributionPattern: "The product was distributed to the following states, FL, IL, CA, TX,WA, PA, CT", recallNumber: "F-1294-2023", productDescription: "Trader Joes Unexpected Broccoli Cheddar Soup ( Sharp Cheddar Cheese & Unexpected Cheddar Cheese )Keep Refrigerated, NET WT. 20 OZ (1 LB 4 OZ ) 567g, 12 in a Case", productQuantity: "10,889 cases", reasonForRecall: "Winter Gardens Quality Foods, 304 Commerce St., New Oxford, PA 17350 is initiating a recall of Trader Joes, Unexpected Broccoli Cheddar Soup , 20 oz. film sealed plastic container with lid, further packaged in cardboard case, keep refrigerated , because the product has insects in the frozen broccoli florets.", recallInitiationDate: "20230710", centerClassificationDate: "20230726", reportDate: "20230806", codeInfo: "Item #: 68470  Lot #s: 383; 384; 385; 390; 391; 392; 397; 398; 405; 406; 425; 426; 431; 433; 442  Use by dates: 7/18/2023; 7/19/2023; 7/20/2023; 7/25/2023; 7/26/2023; 7/27/2023; 8/1/2023; 8/2/2023; 8/9/2023; 8/10/2023; 8/29/2023; 8/30/2023; 9/4/2023; 9/6/2023; 9/15/2023", terminationDate: "20230804", moreCodeInfo: nil
    ),
    Recall(status: .terminated, city: "New Oxford", state: "GA", country: "United States", classification: .classIII, openfda: nil, productType: .food, eventID: "35464", recallingFirm: "Winter Gardens Quality Foods, Inc.", address1: "304 Commerce St", address2: "", postalCode: "17350-1723", voluntaryMandated: "Voluntary: Firm initiated", initialFirmNotification: "E-Mail", distributionPattern: "The product was distributed to the following states, FL, IL, CA, TX,WA, PA, CT", recallNumber: "F-1294-2023", productDescription: "Trader Joes Unexpected Broccoli Cheddar Soup ( Sharp Cheddar Cheese & Unexpected Cheddar Cheese )Keep Refrigerated, NET WT. 20 OZ (1 LB 4 OZ ) 567g, 12 in a Case", productQuantity: "10,889 cases", reasonForRecall: "Winter Gardens Quality Foods, 304 Commerce St., New Oxford, PA 17350 is initiating a recall of Trader Joes, Unexpected Broccoli Cheddar Soup , 20 oz. film sealed plastic container with lid, further packaged in cardboard case, keep refrigerated , because the product has insects in the frozen broccoli florets.", recallInitiationDate: "20230710", centerClassificationDate: "20230726", reportDate: "20230806", codeInfo: "Item #: 68470  Lot #s: 383; 384; 385; 390; 391; 392; 397; 398; 405; 406; 425; 426; 431; 433; 442  Use by dates: 7/18/2023; 7/19/2023; 7/20/2023; 7/25/2023; 7/26/2023; 7/27/2023; 8/1/2023; 8/2/2023; 8/9/2023; 8/10/2023; 8/29/2023; 8/30/2023; 9/4/2023; 9/6/2023; 9/15/2023", terminationDate: "20230804", moreCodeInfo: nil
    )
]
