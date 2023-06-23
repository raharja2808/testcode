use pacmanmaindb
-----------------------------------------------------
--User :
--Page = Developer > User Developer
--Page = Operator > User Operator
--Page = Merchant > User Merchant
	Developer
	--Company (vacuum)
	Operator
	Merchant
	--Referral (pending)

-----------------------------------------------------
--Module + Section + Menu + Authorization
-----------------------------------------------------
--Module
--Desc = pengelompokkan Menu
--Page = Developer > Module
--Table = master_module (module_id)
--Table = master_module_menu (module_id, menu_id)
--Table = master_module_section (module_id, section_id)
--Table = master_module_authorization (module_id, authorization_id)

select * from master_user
--select * from master_company
Login 
	operator66
select * from master_user  = O 
	select * from master_operator = OPR
		select * from master_module = OPR 
			select * from master_module_menu = OPR + status_manager = Y
			select * from master_module_section = OPR + status_manager = Y
select * from master_merchant_group

---------------------------------------------------
--Menu
--Page = Developer > Menu
--Table = master_menu (menu_id)
--SP = spMasterMenuList



---------------------------------------------------
--Section
--Desc = rapiin tampilan menu 
--Page = Developer > Section
--Table = master_section (section_id)


---------------------------------------------------
--Authorization
--Desc = di Menu ini bisa Edit Data atau tidak
--Table = master_authorization (menu_id, authorization_id)



-----------------------------------------------------
--Company + Operator + Currency + Bank
-----------------------------------------------------
UAT =
	
	Bikin Company PL (POLO)

	Operator = POL = POLO

	Currency = IDR
		BVT = Bank Vertu

-----------------------------------------------------
--Gateway + PGMerchant + Gateway Currency + Gateway Payment Channel + Gateway Bank + Gateway Setting + Gateway Pool
-----------------------------------------------------
UAT = 

	Gateway Baru (POLO)

	PGMerchant
		Polo1

	Currency
		IDR

	Payment Channel 
		IB
		QR
		VA

	Bank
		BCA

	Gateway Controller
		min 10,000
		max 10juta
		max daily 100juta




-----------------------------------------------------
--Merchant Group + Merchant Code + Merchant Currency + Merchant Payment Channel + Merchant Setting
	--FundIn = Min.Fee 5,000  (%) = 1%
	--FundOut = Min.Fee 10,000	(%) = 0.2%
	--Settlement = Fee 50,000
	
	
	
	
	
	--Fund In 1 juta
		Balance Fund In = 1 juta

	--Fund Out 2 juta
		Balance Fund Out = 0

	-- Settlement FO (Fund Out)
		pindahin balance fund in ke fund out
	
-----------------------------------------------------
UAT = 
	Merchant Group
		SDD = Swadarma

	Merchant Code = Balance
		SDD	IDR 
		SDD SGD 

	IDR
		
		Payment Method = Payment Channel =
		IDR = QR
		SGD - QR




-----------------------------------------------------
--User Group Menu + Set Menu + Add User
-----------------------------------------------------







-----------------------------------------------------
--User Assign Merchant + Set Merchant + Add User
-----------------------------------------------------





-------------------------------------------------------

-------------------------------------------------------

Business Flow = 
	Merchant - Vertu - Gateway1  IDR, VND
					 - Gateway2  THB, JPY
					 - Gateway3  KRW, KHR
					 - Gateway4  USD, bank_code, 

	Fee
		Fixed = IDR 5,000
		Percent = 3%

	Forex
		99% main forex = loss
		100juta = 3% = 3 juta

BackOffice
	Operator
		menu2 
	Merchant
		menu2
	Developer
		menu2
	Referral
		menu2

---------------------------------------------------
--level_id
select level_id from master_user with (nolock) group by level_id

Developer - D
	Company - C
		Operator - O
			Merchant - M
			--Referral - R

master_user
	level_id						D,C,O,M
		company_id					C
			operator_id				O
				merchant_group_id	M

	level_id	company_id		operator_id		merchant_group_id
		D			

		C			000
		O			000				00	
		M			000				00				MG1
		O			000				DV	
		M			000				DV				MGD

		C			VTP
		O			VTP				VP	
		M			VTP				VP				MGT

		
---------------------------------------------------

--User Group Menu
--	User Group Header (Merchant)		user_group
--	User Group Menu (Merchant List)		user_group_user
--  User Group User (operator66A)		user_group_menu
select * from  user_group		
select * from  user_group_menu	
select * from  user_group_user (hanya user yang bukan manager dan supervisor)

Login 
	operator66A

select * from master_user  = O + status_manager = N
		select * from user_group_user = user_group_id = 26,10,11
			select * from user_group_menu = user_group_id = 9,10,11 (module_id	section_id	menu_id)
				select * from master_module_menu  
				select * from master_module_section 

---------------------------------------------------

---------------------------------------------------
--Currency
master_currecy

---------------------------------------------------
--Bank
master_bank
master_bank_currency

---------------------------------------------------
--Language
master_language
link ke gateway

---------------------------------------------------
--Payment Method / Payment Channel
IB - Internet Banking
	P2P 
	FPX (FundIn)
QR - 
	QR Personal
	QR Corporate
VA - Virtual Account
--master_payment_channel
---------------------------------------------------
--Gateway

XPay			gateway_id / pg_id
	VTP001		pg_merchant_id
		IDR = IB, QR, VA
			Deposit (FundIn) = IB, QR, VA
			Withdrawal (FundOut) = IB
	VTP002
		VND = QR
			Deposit (FundIn) = QR
		THB = IB, QR
			Deposit (FundIn) = IB, QR
			Deposit (FundOut) = IB



gateway [PGMerchant]					master_gateway (gateway_id  / pg_id)
	pg_merchant [Currency] [Payment]		master_gateway_pgmerchant
		currency							payment_gateway_balance
		payment method + type (FUNDIN, FUNDOUT) [Bank]		payment_gateway_pgmerchant
			bank											payment_gateway_fundin_bank + payment_gateway_fundout_bank
			XPY IDR IB FUNDIN		min max    
			XPY IDR QR FUNDIN
			XPY IDR VA FUNDIN			Bank = payment_gateway_fundin_bank
			XPY IDR IB FUNDOUT			Bank = payment_gateway_fundout_bank
			XPY VND QR FUNDIN
			XPY THB IB FUNDIN		
			XPY THB QR FUNDIN
			XPY THB IB FUNDOUT
---------------------------------------------------
--Merchant

	merchant_group_id A			--master_merchant_group
		merchant_code 01			--merchant_master
			IDR					--merchant_master_currency + merchant_master_balance
				(IB, QR, VA)	Balance IDR	 --merchant_list
					Fund In, Fund Out			--merchant_setting
			VND 
				(QR, VA)		Balance VND
		merchant_code 02
			IDR (QR)	Balance IDR
			VND (QR)	Balance VND


merchant_id = merchant_code + currency + payment_channel_id
			M01IDRQR = M01, IDR, QR


Fund IN = merchant_id=M01IDRQR, bank_code=BCA, amount=10,000  
Fund IN = merchant_id=M01IDRIB, bank_code=BCA, amount=10,000  
Fund IN = merchant_id=M01IDRVA, bank_code=BCA, amount=10,000  


	Report Transaction
	merchant_id		currency		payment_channel_id		merchant_code		amount
	M01IDRQR		IDR				QR						M01					10,000
	M01IDRIB		IDR				IB						M01					10,000
	M01IDRVA		IDR				VA						M01					10,000



	Balance  (merchant_master_balance)
	merchant_code		currency		amount
	M01					IDR				30,000

---------------------------------------------------
select name from sys.tables order by name

callback_log
demo_vertu_user
demo_vertu_user_merchant
gateway_adjustment_list
gateway_pool_list
gateway_pool_pgmerchant
gateway_statement_idr
gateway_statement_jpy
gateway_statement_krw
gateway_statement_myr
gateway_statement_sgd
gateway_statement_thb
gateway_statement_usd
gateway_statement_vnd
gateway_topup_list
gateway_topup_pending
master_api_map
--Master Authorization = master_authorization
--Master Bank = master_bank
--Master Bank Currency = master_bank_currency
--Master Company = master_company
master_counter
--Master Currency = master_currency
--Master Gateway = master_gateway
--Master Gateway = master_gateway_pgmerchant
master_generator_id
--Master Language = master_language
--Master Menu = master_menu
--Master Merchant Group = master_merchant_group
--Master Module = master_module
--Master Module = master_module_authorization
--Master Module = master_module_menu
--Master Module = master_module_section
-- Master Operator = master_operator
master_parameter
--Master Payment Channel = master_payment_channel
--DROP = master_payment_gateway
--DROP = master_payment_gateway_fundin
--DROP = master_payment_gateway_fundin_bank
--DROP = master_payment_gateway_fundin_channel
--DROP = master_payment_gateway_fundout
--DROP = master_payment_gateway_fundout_bank
--DROP = master_payment_gateway_fundout_channel
--DROP = master_payment_gateway_language
--DROP = master_payment_gateway_pool
--Master Section = master_section
--Master User = master_user
master_web_page
merchant_adjustment_list
--DROP = merchant_balance
merchant_fundin_failed_log
merchant_fundout_failed_log
merchant_fundout_request_list
merchant_fundout_request_pending
merchant_fundout_request_temp
--Master Merchant = merchant_list
--Master Merchant = merchant_master
--Master Merchant = merchant_master_balance
--Master Merchant = merchant_master_currency
merchant_request_fundin_log
merchant_request_fundout_log
--Master Merchant = merchant_setting
merchant_settlement_list
merchant_settlement_payment
merchant_settlement_pending
merchant_settlement_temp
merchant_statement_idr
merchant_statement_idr_request
merchant_statement_jpy
merchant_statement_jpy_request
merchant_statement_krw
merchant_statement_krw_request
merchant_statement_myr
merchant_statement_myr_request
merchant_statement_sgd
merchant_statement_sgd_request
merchant_statement_thb
merchant_statement_thb_request
merchant_statement_usd
merchant_statement_usd_request
merchant_statement_vnd
merchant_statement_vnd_request
merchant_topup_bank
merchant_topup_list
merchant_transaction_fundin_idr_check
merchant_transaction_fundin_jpy_check
merchant_transaction_fundin_krw_check
merchant_transaction_fundin_myr_check
merchant_transaction_fundin_sgd_check
merchant_transaction_fundin_thb_check
merchant_transaction_fundin_usd_check
merchant_transaction_fundin_vnd_check
merchant_transaction_fundout_idr_check
merchant_transaction_fundout_jpy_check
merchant_transaction_fundout_krw_check
merchant_transaction_fundout_myr_check
merchant_transaction_fundout_sgd_check
merchant_transaction_fundout_thb_check
merchant_transaction_fundout_usd_check
merchant_transaction_fundout_vnd_check
merchant_transaction_history_fundin_idr
merchant_transaction_history_fundin_idr_log
merchant_transaction_history_fundin_jpy
merchant_transaction_history_fundin_jpy_log
merchant_transaction_history_fundin_krw
merchant_transaction_history_fundin_krw_log
merchant_transaction_history_fundin_myr
merchant_transaction_history_fundin_myr_log
merchant_transaction_history_fundin_sgd
merchant_transaction_history_fundin_sgd_log
merchant_transaction_history_fundin_thb
merchant_transaction_history_fundin_thb_log
merchant_transaction_history_fundin_usd
merchant_transaction_history_fundin_usd_log
merchant_transaction_history_fundin_vnd
merchant_transaction_history_fundin_vnd_log
merchant_transaction_history_fundout_idr
merchant_transaction_history_fundout_idr_log
merchant_transaction_history_fundout_jpy
merchant_transaction_history_fundout_jpy_log
merchant_transaction_history_fundout_krw
merchant_transaction_history_fundout_krw_log
merchant_transaction_history_fundout_myr
merchant_transaction_history_fundout_myr_log
merchant_transaction_history_fundout_sgd
merchant_transaction_history_fundout_thb
merchant_transaction_history_fundout_thb_log
merchant_transaction_history_fundout_usd
merchant_transaction_history_fundout_vnd
merchant_transaction_history_fundout_vnd_log
merchant_transaction_notify_fundin_idr
merchant_transaction_notify_fundin_jpy
merchant_transaction_notify_fundin_krw
merchant_transaction_notify_fundin_log
merchant_transaction_notify_fundin_myr
merchant_transaction_notify_fundin_sgd
merchant_transaction_notify_fundin_thb
merchant_transaction_notify_fundin_usd
merchant_transaction_notify_fundin_vnd
merchant_transaction_notify_fundout_idr
merchant_transaction_notify_fundout_jpy
merchant_transaction_notify_fundout_krw
merchant_transaction_notify_fundout_log
merchant_transaction_notify_fundout_myr
merchant_transaction_notify_fundout_sgd
merchant_transaction_notify_fundout_thb
merchant_transaction_notify_fundout_usd
merchant_transaction_notify_fundout_vnd
merchant_transaction_payment_html_thb
merchant_transaction_pending_fundin_idr
merchant_transaction_pending_fundin_jpy
merchant_transaction_pending_fundin_krw
merchant_transaction_pending_fundin_myr
merchant_transaction_pending_fundin_sgd
merchant_transaction_pending_fundin_thb
merchant_transaction_pending_fundin_usd
merchant_transaction_pending_fundin_vnd
merchant_transaction_pending_fundout_idr
merchant_transaction_pending_fundout_jpy
merchant_transaction_pending_fundout_krw
merchant_transaction_pending_fundout_myr
merchant_transaction_pending_fundout_sgd
merchant_transaction_pending_fundout_thb
merchant_transaction_pending_fundout_usd
merchant_transaction_pending_fundout_vnd
merchant_transaction_qris_idr
merchant_transaction_virtual_account_idr
operator_settlement_payment_temp
operator_topup_temp
--Master Gateway = payment_gateway_balance
--Master Gateway = payment_gateway_fundin_bank
payment_gateway_fundin_statistic
payment_gateway_fundin_statistic_request
--Master Gateway = payment_gateway_fundout_bank
payment_gateway_fundout_statistic
payment_gateway_fundout_statistic_request
--Master Gateway = payment_gateway_language
payment_gateway_operator
--Master Gateway = payment_gateway_pgmerchant
payment_gateway_pool_fundin_statistic
payment_gateway_pool_fundout_statistic
request_response_log
--Log = sql_log  (rf_sql_log, rf_sql_log_text)
summary_transaction_daily
--User Group Menu = user_group		
--User Group Menu = user_group_authorization
--User Group Menu = user_group_menu	
--User Group Menu = user_group_user
user_merchant_group
user_merchant_group_merchant
user_merchant_group_user
--Login = user_session
--Logout = user_session_hist

---------------------------------------------------