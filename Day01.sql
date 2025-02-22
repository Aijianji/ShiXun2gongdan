-- 创建表
-- 创建资产表，包含各项资产信息
CREATE TABLE IF NOT EXISTS insurance_assets (
    id INT,
    transactional_financial_assets DOUBLE,
    derivative_financial_assets DOUBLE,
    repurchase_agreements DOUBLE,
    time_deposits DOUBLE,
    available_for_sale_financial_assets DOUBLE,
    held_to_maturity_investments DOUBLE,
    long_term_equity_investments DOUBLE,
    investment_properties DOUBLE,
    lending_funds DOUBLE,
    loans DOUBLE,
    monetary_funds DOUBLE,
    accrued_interest DOUBLE,
    accrued_premiums DOUBLE,
    accrued_management_fees DOUBLE,
    accrued_asset_management_fees DOUBLE,
    subrogation_receivables DOUBLE,
    reinsurance_receivables DOUBLE,
    unearned_reinsurance_reserves DOUBLE,
    outstanding_loss_reinsurance_reserves DOUBLE,
    life_insurance_reinsurance_reserves DOUBLE,
    long_term_health_insurance_reinsurance_reserves DOUBLE,
    policy_loans DOUBLE,
    deposit_margins DOUBLE,
    capital_deposit_margins DOUBLE,
    fixed_assets DOUBLE,
    intangible_assets DOUBLE,
    deferred_tax_assets DOUBLE,
    system_intercompany_balances DOUBLE,
    internal_intercompany_balances DOUBLE,
    other_assets DOUBLE,
    investment_income DOUBLE,
    fair_value_change_income DOUBLE,
    impairment_loss_investment_assets DOUBLE,
    fair_value_change_available_for_sale DOUBLE,
    end_life_insurance_reserves DOUBLE,
    end_long_term_health_insurance_reserves DOUBLE,
    evaluation_interest_rate_life_insurance DOUBLE,
    evaluation_interest_rate_long_term_health_insurance DOUBLE,
    risk_free_rate DOUBLE,
    investment_returns ARRAY<DOUBLE>
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY '|';

-- 创建现金和投资资产表，用于计算现金和投资资产组合变化率
CREATE TABLE IF NOT EXISTS cash_investment_assets (
    id INT,
    base_period_bank_deposits DOUBLE,
    base_period_government_bonds DOUBLE,
    base_period_financial_bonds DOUBLE,
    base_period_corporate_bonds DOUBLE,
    base_period_equity_investments DOUBLE,
    base_period_securities_investment_funds DOUBLE,
    base_period_policy_loans DOUBLE,
    base_period_repurchase_securities DOUBLE,
    base_period_cash DOUBLE,
    base_period_other_investment_assets DOUBLE,
    base_period_non_recognized_financing_risk_deduction DOUBLE,
    reporting_period_bank_deposits DOUBLE,
    reporting_period_government_bonds DOUBLE,
    reporting_period_financial_bonds DOUBLE,
    reporting_period_corporate_bonds DOUBLE,
    reporting_period_equity_investments DOUBLE,
    reporting_period_securities_investment_funds DOUBLE,
    reporting_period_policy_loans DOUBLE,
    reporting_period_repurchase_securities DOUBLE,
    reporting_period_cash DOUBLE,
    reporting_period_other_investment_assets DOUBLE,
    reporting_period_non_recognized_financing_risk_deduction DOUBLE
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ',';


-- 生成数据
-- 插入 100 条示例数据到资产表
INSERT INTO TABLE insurance_assets
SELECT
    pos + 1 AS id,
    rand() * 10000 AS transactional_financial_assets,
    rand() * 10000 AS derivative_financial_assets,
    rand() * 10000 AS repurchase_agreements,
    rand() * 10000 AS time_deposits,
    rand() * 10000 AS available_for_sale_financial_assets,
    rand() * 10000 AS held_to_maturity_investments,
    rand() * 10000 AS long_term_equity_investments,
    rand() * 10000 AS investment_properties,
    rand() * 10000 AS lending_funds,
    rand() * 10000 AS loans,
    rand() * 10000 AS monetary_funds,
    rand() * 10000 AS accrued_interest,
    rand() * 10000 AS accrued_premiums,
    rand() * 10000 AS accrued_management_fees,
    rand() * 10000 AS accrued_asset_management_fees,
    rand() * 10000 AS subrogation_receivables,
    rand() * 10000 AS reinsurance_receivables,
    rand() * 10000 AS unearned_reinsurance_reserves,
    rand() * 10000 AS outstanding_loss_reinsurance_reserves,
    rand() * 10000 AS life_insurance_reinsurance_reserves,
    rand() * 10000 AS long_term_health_insurance_reinsurance_reserves,
    rand() * 10000 AS policy_loans,
    rand() * 10000 AS deposit_margins,
    rand() * 10000 AS capital_deposit_margins,
    rand() * 10000 AS fixed_assets,
    rand() * 10000 AS intangible_assets,
    rand() * 10000 AS deferred_tax_assets,
    rand() * 10000 AS system_intercompany_balances,
    rand() * 10000 AS internal_intercompany_balances,
    rand() * 10000 AS other_assets,
    rand() * 10000 AS investment_income,
    rand() * 10000 AS fair_value_change_income,
    rand() * 10000 AS impairment_loss_investment_assets,
    rand() * 10000 AS fair_value_change_available_for_sale,
    rand() * 10000 AS end_life_insurance_reserves,
    rand() * 10000 AS end_long_term_health_insurance_reserves,
    rand() * 0.1 AS evaluation_interest_rate_life_insurance,
    rand() * 0.1 AS evaluation_interest_rate_long_term_health_insurance,
    rand() * 0.1 AS risk_free_rate,
    array(rand() * 0.1, rand() * 0.1, rand() * 0.1, rand() * 0.1) AS investment_returns
FROM (
    SELECT posexplode(split(repeat('1', 100), ''))
) t;

-- 插入100条示例数据到现金和投资资产表
INSERT INTO TABLE cash_investment_assets
SELECT
    pos + 1 AS id,
    rand() * 10000 AS base_period_bank_deposits,
    rand() * 10000 AS base_period_government_bonds,
    rand() * 10000 AS base_period_financial_bonds,
    rand() * 10000 AS base_period_corporate_bonds,
    rand() * 10000 AS base_period_equity_investments,
    rand() * 10000 AS base_period_securities_investment_funds,
    rand() * 10000 AS base_period_policy_loans,
    rand() * 10000 AS base_period_repurchase_securities,
    rand() * 10000 AS base_period_cash,
    rand() * 10000 AS base_period_other_investment_assets,
    rand() * 10000 AS base_period_non_recognized_financing_risk_deduction,
    rand() * 10000 AS reporting_period_bank_deposits,
    rand() * 10000 AS reporting_period_government_bonds,
    rand() * 10000 AS reporting_period_financial_bonds,
    rand() * 10000 AS reporting_period_corporate_bonds,
    rand() * 10000 AS reporting_period_equity_investments,
    rand() * 10000 AS reporting_period_securities_investment_funds,
    rand() * 10000 AS reporting_period_policy_loans,
    rand() * 10000 AS reporting_period_repurchase_securities,
    rand() * 10000 AS reporting_period_cash,
    rand() * 10000 AS reporting_period_other_investment_assets,
    rand() * 10000 AS reporting_period_non_recognized_financing_risk_deduction
FROM (
    SELECT posexplode(split(repeat('1', 100), ''))
) t;






