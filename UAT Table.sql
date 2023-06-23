
alter table merchant_transaction_history_fundin_idr add merchant_fee_amount	decimal	(18,4) NULL
merchant_fee_percent	decimal	no	9	18   	4    
alter table merchant_transaction_history_fundin_idr add merchant_fee_type	varchar	(50) NULL
pg_fee_amount	decimal	no	9	18   	4    
pg_fee_percent	decimal	no	9	18   	4    
pg_fee_type	varchar	no	50	     	     
member_fee_amount	decimal	no	9	18   	4    
member_fee_percent	decimal	no	9	18   	4    
member_fee_type	varchar	no	50	     	     
first_name	nvarchar	no	200	     
