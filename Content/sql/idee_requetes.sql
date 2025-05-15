
-- Requête 1 : Afficher les informations sur les vols entre deux aéroports spécifiques avec des options de vol
SELECT
    f.Id_Flights,
    f.departure_date,
    f.arrival_date,
    f.base_price,
    o.name AS compagnie_name,
    op.class,
    op.seat_choice,
    op.luggage
FROM Flights f
JOIN Airport a1 ON f.Id_Airport = a1.Id_Airport
JOIN Airport a2 ON f.Id_Airport_1 = a2.Id_Airport
JOIN offer ofr ON f.Id_Airport = ofr.Id_Airport AND f.Id_Airport_1 = ofr.Id_Airport_1 AND f.Id_Flights = ofr.Id_Flights
JOIN Companies o ON ofr.Id_Companie = o.Id_Companie
JOIN precise p ON f.Id_Airport = p.Id_Airport AND f.Id_Airport_1 = p.Id_Airport_1 AND f.Id_Flights = p.Id_Flights
JOIN Options op ON p.Id_Options = op.Id_Options
WHERE
    a1.name = 'Charles de Gaulle'
    AND a2.name = 'JFK International'
    AND op.class = 'First Class'
    AND f.departure_date BETWEEN '2025-05-01' AND '2025-06-05';


-- Requête 2 : Afficher les informations sur les activités disponibles dans une ville spécifique entre deux dates entrée par l'utilisateur
SELECT 
    act.name AS activity_name,
    act.descriptioin AS description,
    act.price,
    act.start_date,
    act.end_date,
    ci.name AS city_name
FROM Activities act
JOIN Asso_16 a16 ON act.Id_Activities = a16.Id_Activities
JOIN Road r ON a16.Id_Name = r.Id_Name AND a16.Id_Cities = r.Id_Cities AND a16.Id_Road = r.Id_Road
JOIN Cities ci ON r.Id_Cities = ci.Id_Cities
WHERE 
    ci.name = 'Rome'  -- nom de la ville à adapter dynamiquement
    AND act.start_date <= '2025-06-01'  -- date de début de recherche
    AND act.end_date >= '2025-06-05';   -- date de fin de recherche


--Requête 3 : afficher les information et la disponibilité des chambres d'un hébergement spécifique entre deux dates entrée par l'utilisateur
SELECT 
    h.name AS hebergement_name,
    r.price,
    c.name AS city_name,
    a.start_date,
    a.end_date,
    ro.type AS room_type,
    ro.capacity
FROM rental r
JOIN Hebergement h ON r.Id_Hebergement = h.Id_Hebergement
JOIN Cities c ON h.Id_Cities = c.Id_Cities
JOIN Available a ON r.Id_rental = a.Id_rental
JOIN Room ro ON a.Id_Room = ro.Id_Room
WHERE 
    a.is_available = TRUE
    AND a.start_date <= '2025-06-01'
    AND a.end_date >= '2025-06-05';

select * from users;