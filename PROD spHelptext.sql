select
    tab.name as table_name, 
    col.name as column_name, 
    t.name as data_type,    
    col.max_length
  
from sys.tables as tab
    inner join sys.columns as col
        on tab.object_id = col.object_id
    left join sys.types as t
    on col.user_type_id = t.user_type_id
WHERE tab.name LIKE '%spCombo%'
order by
    table_name, 
    column_id;