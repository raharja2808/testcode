pg_merchant_id = VTP0001
pg_merchant_code = VTP0001


pg_merchant_id = 034AB38020

backoffice = pg_merchant_code = VERTUIDRIB01


master_gateway				--pg_id
master_gateway_pgmerchant	--pg_merchant_id / pg_merchant_code
payment_gateway_balance		--pg_merchant_id + currency
payment_gateway_pgmerchant	--gateway_pgmerchant_id = pg_id + pg_merchant_id + currency + payment_channel_id + payment_channel_id_vendor
payment_gateway_operator	--gateway_pgmerchant_id + operator_id




Operator login
	buka report
		filter gateway 
			spComboOperatorPyamentGateway


	EXEC PacmanMainDB.dbo.spComboPaymentGateway @operator_id='', @currency='', @stamp_user='developer66'
	spComboPaymentGateway -- developer
	spComboOperatorPaymentGateway --page2 si operator
	
	spComboUserCurrency --> merchant		merchant_list / merchant_balance
	spComboOperatorCurrency --operator		payment_gateway_operator
	spComboCurrency --dev					master_currency

	spComboPaymentGateway -> spComboOperatorPaymentGateway
	drop spComboPaymentGateway

	--------------------
	spComboPaymentGateway = master_gateway

	Page = spComboPaymentGateway (new)
	--------------------
