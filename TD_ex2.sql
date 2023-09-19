-- Client (CodeC, CiviC, NomC, PrenomC, RueFacC, CPostalFacC, VilleFacC, CodeSoc#)
-- Societe (CodeSoc, RaisonSoc, RueSoc, VilleSoc, CpSoc, DomaineSoc)
-- Hotel (CodeH, NomH, RueH, CPH, VilleH, PaysH, NbetoilesH, CodeGR#)
-- TypeCH (CodeTyCH, NomTyCH)
-- Proposer (CodeH#, CodeTyCH#, NbChambres)
-- Groupe (CodeGR, NomGR, PaysOrigineGR)
-- Reserver (CodeC#, CodeH#, CodeTyCH#, DateArr, DateDep, NombreCH)

-- 13. Nom des clients ayant réservé un hôtel dans tous les groupes hôteliers proposés par la BD
SELECT NomC
FROM Client Cl
WHERE NOT EXISTS (
    SELECT *
    FROM Groupe Gr
    WHERE 1 = 1
        AND NOT EXISTS (
        SELECT *
        FROM Reserver R, Hotel H
        WHERE R.CodeH = H.CodeH
            AND H.CodeGR = Gr.CodeGR
            AND R.CodeC = Cl.CodeC
    )
)
