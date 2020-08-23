ALTER PROCEDURE "DBA"."proc_ajoutUtilisateur"(in n varchar(50), in pn varchar(50), in s char(1), in ml varchar(50), in psw varchar(100))
RESULT ("status" integer, "message" varchar(100))
BEGIN
    call sa_set_http_header('Access-Control-Allow-Origin', '*');

    IF NOT EXISTS (
        SELECT mail FROM dba.utilisateurs
        WHERE mail LIKE ml
    )
    THEN
        BEGIN
            INSERT INTO utilisateurs (nom, prenom, sexe, mail, mdp)
            VALUES (n, pn, s, ml, psw);
            SELECT '201', 'utilisateur ajouté';
        END
    ELSE
        BEGIN
            SELECT '400', 'le mail existe déjà';
        END
    ENDIF

END;


CREATE SERVICE "ajoutUtilisateur" TYPE 'JSON' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call DBA.proc_ajoutUtilisateur(n = :nom,pn = :prenom,s = :sexe,ml = :mail,psw = :mdp)