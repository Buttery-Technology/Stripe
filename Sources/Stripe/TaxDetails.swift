//
//  TaxDetails.swift
//  Stripe
//
//  Created by Jonathan Holland on 6/5/22.
//

import Foundation

public struct TaxDetails: Codable, Sendable {
    /// Describes the purchaser’s tax exemption status. One of `none`, `exempt`, or `reverse`.
    public let taxExempt: TaxExempt
    /// The purchaser’s tax IDs to be used in calculation of tax for this Order.
    public let taxIDs: [TaxID]
    
    /// Designated initailizer
    public init(taxExempt: TaxExempt, taxIDs: [TaxID]) {
        self.taxExempt = taxExempt
        self.taxIDs = taxIDs
    }
    
    public enum CodingKeys: String, CodingKey {
        case taxExempt = "tax_exempt", taxIDs = "tax_ids"
    }
    
    public enum TaxExempt: String, Codable, Sendable {
        case exempt, none, reverse
    }
    
    public struct TaxID: Codable, Sendable {
        /// The type of the tax ID.
        public let type: TaxIDType
        /// The value of the tax ID.
        public let value: String
        
        /// Designated initializer
        public init(type: TaxIDType, value: String) {
            self.type = type
            self.value = value
        }
        
        public enum TaxIDType: String, Codable, Sendable {
            case eu_vat, br_cnpj, br_cpf, eu_oss_vat, gb_vat, nz_gst, au_abn, au_arn, in_gst, no_vat, za_vat, ch_vat, mx_rfc, sg_uen, ru_inn, ru_kpp, ca_bn, hk_br, es_cif, tw_vat, th_vat, jp_cn, jp_rn, li_uid, my_itn, us_ein, kr_brn, ca_qst, ca_gst_hst, ca_pst_bc, ca_pst_mb, ca_pst_sk, my_sst, sg_gst, ae_trn, cl_tin, sa_vat, id_npwp, my_frp, il_vat, ge_vat, ua_vat, is_vat, bg_uic, hu_tin, si_tin, unknown
        }
    }
}
