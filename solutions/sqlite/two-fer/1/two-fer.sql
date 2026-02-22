UPDATE twofer
SET response = 'One for ' || 
               CASE 
                 WHEN input IS NOT NULL AND input != '' THEN input 
                 ELSE 'you' 
               END || 
               ', one for me.';