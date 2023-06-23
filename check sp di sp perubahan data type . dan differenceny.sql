select tab.name,
CONCAT( col.name,' ','[', t.name,']',' ','(', col.max_length,')' ) AS Result
from sys.tables as tab
    inner join sys.columns as col
        on tab.object_id = col.object_id
    left join sys.types as t
    on col.user_type_id = t.user_type_id
--WHERE 
--CONCAT( col.name,' ','[', t.name,']',' ','(', col.max_length,')' ) = 
--'amount [decimal] (11)'
group by 
	tab.name,
	col.name, 
    t.name,    
    col.max_length

order by  
	col.name, 
    t.name,    
    col.max_length

