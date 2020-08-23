ALTER PROCEDURE "DBA"."proc_tableTache"( )

RESULT(nomTache VARCHAR (50), descriptionTache VARCHAR (50), accomplissementTache INTEGER )
BEGIN
    call sa_set_http_header( 'Access-Control-Allow-Origin','*');

	SELECT nomTache, descriptionTache, accomplissementTache
    FROM taches
	order by nomTache DESC

END

CREATE SERVICE "classement" TYPE 'JSON' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call DBA.proc_tableTache();