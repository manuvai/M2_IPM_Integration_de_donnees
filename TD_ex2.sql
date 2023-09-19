-- Client (CodeC, CiviC, NomC, PrenomC, RueFacC, CPostalFacC, VilleFacC, CodeSoc#)
-- Societe (CodeSoc, RaisonSoc, RueSoc, VilleSoc, CpSoc, DomaineSoc)
-- Hotel (CodeH, NomH, RueH, CPH, VilleH, PaysH, NbetoilesH, CodeGR#)
-- TypeCH (CodeTyCH, NomTyCH)
-- Proposer (CodeH#, CodeTyCH#, NbChambres)
-- Groupe (CodeGR, NomGR, PaysOrigineGR)
-- Reserver (CodeC#, CodeH#, CodeTyCH#, DateArr, DateDep, NombreCH)

-- 1. Pour chaque client, donner sa civilité en clair (Monsieur ou Madame), son nom, son prénom et éventuellement le nom et le domaine de sa société
-- 2. Nom des sociétés ayant effectué au moins une réservation débutant cette année
-- 3. Nom des sociétés ayant effectué dix réservations débutant cette année
-- 4. Nom des sociétés n’ayant effectué aucune réservation en 2018 (arrivées et départs en 2018)
-- 5. Nom des sociétés ayant effectué toutes réservations débutant cette année
-- 6. Nom des sociétés n’ayant effectué que des réservations cette année (arrivée et départ cette année)
-- 7. Nom et prénom des clients ayant effectué une réservation de 2 nuits
-- 8. Nom et prénom des clients ayant effectué deux réservations en 2019 (ne pas se limiter à une arrivée et un départ cette année)
-- 9. Nom, prénom et ville du client ayant effectué le plus de réservations débutant en 2018
-- 10. Nom des groupes hôteliers proposant plus de 10 hôtels dans le pays originaire du groupe
-- 11. Nom des hôtels français de 3 étoiles proposant tous les types de chambres
-- 12. Nom des hôtels français de 3 étoiles ne proposant pas le type de chambres « suite »

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

-- 19. Nom des sociétés ayant réservé tous les types de chambres
SELECT RaisonSoc
FROM Societe
WHERE 1 = 1