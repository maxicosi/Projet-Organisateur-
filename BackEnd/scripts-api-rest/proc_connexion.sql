ALTER PROCEDURE "DBA"."proc_connexion"(in mailIn VARCHAR(50), in mdpIn VARCHAR(50))

RESULT(userId int, prenom VARCHAR(50), nom VARCHAR(50))
BEGIN
    call sa_set_http_header( 'Access-Control-Allow-Origin','*');
    IF ( (SELECT  mdpCheck(mailIn, mdpIn)) = 1)
    THEN
        BEGIN
            SELECT userId, nom, prenom, mail
            FROM utilisateurs
            WHERE mail = mailIn ;
        END
     ELSE
        BEGIN
            select -1;
        END
    ENDIF
END


CREATE SERVICE "connexion" TYPE 'JSON' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call DBA.proc_connexion(mailIn = :mail, mdpIn= :mdp);