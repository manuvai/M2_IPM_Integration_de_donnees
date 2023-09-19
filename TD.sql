-- CHEVAL (CodeC, NomC, DateNaisC, RaceC, SexeC)
-- PROPRIO (CodeP, NomP, PrenomP, ProfessionP, RueP, CpostalP, VilleP)
-- POSSEDE (CodeC#, CodeP#, Part, DateAcquisition)
-- CRITIQUE (CodeCri, NomCri, PrenomCri)
-- VERSIONCOURS (CodeVE, DateV, Code Co#)
-- COURSE (CodeCo, NomCo, TypeCo, CodeH#)
-- HIPPO (CodeH, NomH, LongH, DateConst, NomResp, PrénomResp, Code VI#)
-- VILLE (CodeVI, NomVI, CodeDept, NomMaire, PrénomMaire, NbHabitants)
-- JOCKEYS (CodeJ, NomJ, PrenomJ, DateNaisJ)
-- DONNEAVIS (CodeC#, CodeCri#, CodeVE#, Avis)
-- PARTICIPE (CodeC#, CodeJ#, CodeVE#, Place)
-- ENTRAINEMENT(CodeC#, CodeJ#, Date, HeureDeb, CodeH#, HeureFin)
-- DONNEAVISPRO (CodeC#, CodeP#, DateAvis, AvisPRO)

-- 9. Nom des chevaux ayant participé à toutes les courses s'étant déroulées en 2017 sur l'hippodrome de Chantilly (nom de l'hippodrome)
SELECT NomC
FROM Cheval Ch
WHERE NOT EXISTS (
    SELECT *
    FROM Course Co, Hippo H
    WHERE Co.CodeH = H.CodeH
    AND LOWER(H.NomH) = 'chantilly'
    AND NOT EXISTS (
        SELECT *
        FROM Participe P, VersionCours VC
        WHERE P.CodeVE = VC.CodeVE
            AND Ch.CodeC = P.CodeC
            AND VC.CodeCo = Co.CodeCo
            AND TO_CHAR(VC.DateVE, 'YYYY') = 2017
    )
)

-- 17. Nom des propriétaires possédant tous les "pur-sang" de la BD
SELECT NomP
FROM PROPRIO P
WHERE NOT EXISTS (
    SELECT *
    FROM Cheval C
    WHERE C.Race = 'pur-sang'
    AND NOT EXISTS (
        SELECT *
        FROM POSSEDE Pos
        WHERE C.CodeC = Pos.CodeC
            AND Pos.CodeP = P.CodeP
    )
);
-- Nom des propriétaires possédant tous les "pur-sang" nés après 2010 de la BD
SELECT NomP
FROM PROPRIO P
WHERE NOT EXISTS (
    SELECT *
    FROM Cheval C
    WHERE C.Race = 'pur-sang'
    AND NOT EXISTS (
        SELECT *
        FROM POSSEDE Pos
        WHERE C.CodeC = Pos.CodeC
            AND Pos.CodeP = P.CodeP
    )
);
