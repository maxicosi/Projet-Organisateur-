ALTER FUNCTION "DBA"."mdpCheck"(in ml varchar(50), in pwd varchar(50))
RETURNS BIT
BEGIN

    IF EXISTS (
        SELECT mail, mdp FROM DBA.utilisateurs
        WHERE mail LIKE ml AND mdp like pwd
    )
    THEN RETURN 1;
    ELSE RETURN 0;
    ENDIF;

END
