//
//  Models.swift
//  CyptoSimulator
//
//  Created by Drum, Jesse on 12/15/21.
//

import Foundation

struct Crypto: Codable{
    let asset_id: String
    let name: String
    let price_usd: Float
    
}

//{
//   "asset_id": "EUR",
//   "name": "EUR",
//   "type_is_crypto": 1,
//   "data_quote_start": "2021-11-04T14:00:00.0000000Z",
//   "data_quote_end": "2021-12-16T14:16:17.7220000Z",
//   "data_trade_start": "2021-11-04T16:34:30.1920160Z",
//   "data_trade_end": "2021-12-16T14:19:10.0490000Z",
//   "data_symbols_count": 110,
//   "volume_1hrs_usd": 8707269.67,
//   "volume_1day_usd": 308606861.35,
//   "volume_1mth_usd": 8997853296.67,
//   "price_usd": 1.1350659026358972189344663052,
//   "data_start": "2021-11-04",
//   "data_end": "2021-12-16"
// },
